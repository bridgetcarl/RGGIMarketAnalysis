library(zoo)
library(tidyverse)
library(ggplot2)
library(segmented)
library(corrplot)
library(readxl)
library(stargazer)
library(flextable)
library(scales)


 setwd("~/Capstone/Data")


#-----------------------------------------------------------------------------------------------------
#read in emissions CSV and clean

emissions <- read.csv('Emissions, 95-24.csv')

#remove VA
emissions <- subset(emissions, State != 'VA')

#year-quarter date code
emissions$YearQuarter <- paste(emissions$Year, sprintf("%d", emissions$Quarter), sep = "-Q")
emissions$YearQuarter <- as.yearqtr(paste(emissions$Year, emissions$Quarter), format = "%Y%q")

#integer year-quarter date code (for reg analysis)
emissions$YearQuarterCode <- as.integer(paste(emissions$Year, emissions$Quarter, sep = ""))

#% change in CO2 emissions quarter by quarter
emissions <- emissions %>%
             mutate(CO2_delta = (CO2.Mass..short.tons. - lag(CO2.Mass..short.tons.)) / lag(CO2.Mass..short.tons.))



head(emissions)
summary(emissions)
nrow(emissions)

#average emissions by year, across states
mean_emissions <- emissions %>%
                  group_by(YearQuarter) %>%
                  summarise(mean_emissions = mean(CO2.Mass..short.tons., na.rm = TRUE))

mean_emissions_code <- emissions %>%
                       group_by(YearQuarterCode) %>%
                       summarise(mean_emissions = mean(CO2.Mass..short.tons., na.rm = TRUE))


#--------------------------------------------------------------------------------------------------  
#read in auction xlsx and apply sheets to different df
RGGI_state <- read_excel('RGGI Proceeds by Auction.xlsx',
                         sheet = 'RGGI_state',
                         col_names = T,
                         na = 'NA',
                         col_types = c('text','text','date','numeric','numeric','numeric'))

#remove VA
RGGI_state <- subset(RGGI_state, State != 'VA')

#RGGI_state cleaning- match dates to emissions$YearQuarterCode
RGGI_state$Year <- format(as.Date(RGGI_state$Date, format="%d/%m/%Y"),"%Y")
RGGI_state$Month <- format(as.Date(RGGI_state$Date, format="%d/%m/%Y"),"%m")
RGGI_state <- RGGI_state %>% 
                        mutate(Quarter = case_when(Month == '03' ~ '1',
                                                   Month == '06' ~ '2',
                                                   Month == '09' ~ '3', 
                                                   Month == '12' ~ '4'))


#year-quarter date code
RGGI_state$YearQuarter <- paste(RGGI_state$Year, RGGI_state$Quarter, sep = "-Q")
RGGI_state$YearQuarter <- as.yearqtr(paste(RGGI_state$Year, RGGI_state$Quarter), format = "%Y%q")

#integer year-quarter date code (for reg analysis)
RGGI_state$YearQuarterCode <- as.integer(paste(RGGI_state$Year, RGGI_state$Quarter, sep = ""))



head(RGGI_state)
summary(RGGI_state)
nrow(RGGI_state)


#average price by year, across states
mean_price <- RGGI_state %>%
  group_by(YearQuarter) %>%
  summarise(mean_price = mean(`Total Price Per Allowance`, na.rm = TRUE))

mean_price_code <- RGGI_state %>%
  group_by(YearQuarterCode) %>%
  summarise(mean_price = mean(`Total Price Per Allowance`, na.rm = TRUE))

#---------------------------------------------------------------------------------------------------

#time series analysis -> understanding the impact of the 2009 RGGI to CO2 emissions 
#across initial RGGI states 

#time series plots

#average of all states

co2_time_all <- ggplot(mean_emissions, aes(x = YearQuarter, y = mean_emissions)) +
                geom_line() +
                scale_x_yearqtr(limits = c(min(emissions$YearQuarter), max(emissions$YearQuarter)),
                                format = '%Y-Q%q')+
                labs(title = "CO2 Emissions By Quarter, RGGI States", 
                     subtitle = "All States",
                     x = "Quarter", 
                     y = "Tonnage")+
                theme_minimal()
co2_time_all


#by state
co2_time_bystate <- ggplot(emissions, aes(x = YearQuarter, y = CO2.Mass..short.tons.,
                                          color = State)) +
            geom_line() +
            scale_x_yearqtr(limits = c(min(emissions$YearQuarter), max(emissions$YearQuarter)),
                            format = '%Y-Q%q')+
            labs(title = "CO2 Emissions By Quarter, RGGI States", 
                 subtitle = "By State",
                 x = "Quarter", 
                 y = "Tonnage")+
            theme_minimal() +
            scale_color_discrete()
co2_time_bystate

#by state, cO2 delta
delta_time_bystate <- ggplot(emissions, aes(x = YearQuarter, y = CO2_delta,
                                          color = State)) +
  geom_line() +
  scale_x_yearqtr(limits = c(min(emissions$YearQuarter), max(emissions$YearQuarter)),
                  format = '%Y-Q%q')+
  labs(title = "Change in CO2 Emissions By Quarter, RGGI States", 
       subtitle = "By State",
       x = "Quarter", 
       y = "Change in Emissions Tonnage, %")+
  theme_minimal() +
  scale_color_discrete()
delta_time_bystate

#----------------------------------------------------------------------------------------------
#statistical analysis

#all states, pre-2009
mean_emissions_code_pre <- subset(mean_emissions_code, YearQuarterCode < 20090)

lm_model_all_pre <- lm(YearQuarterCode ~ log(mean_emissions), data = mean_emissions_code_pre)
summary(lm_model_all_pre)
stargazer(lm_model_all_pre,  title = 'Model 1.1: All states, pre-2009', align=TRUE, out='mod1.1.txt')

all_CI_pre <- confint(lm_model_all_pre, level = 0.95)
all_CI_pre

#all states, post-2009
mean_emissions_code_post <- subset(mean_emissions_code, YearQuarterCode > 20090)

lm_model_all_post <- lm(YearQuarterCode ~ log(mean_emissions), data = mean_emissions_code_post)
summary(lm_model_all_post)
stargazer(lm_model_all_post,  title = 'Model 1.2: All states, post-2009', align=TRUE, out='mod1.2.txt')

all_CI_post <- confint(lm_model_all_post, level = 0.95)
all_CI_post

#difference in coefficients between pre and post
coef_all_pre <- coef(lm_model_all_pre)
coef_all_post <- coef(lm_model_all_post)

tdiff_all <- t.test(coef_all_pre,coef_all_post, paired=T)
tdiff_all

#---------------------------------------------------------------------------------
#by state, pre-2009
emissions_pre <- subset(emissions, YearQuarterCode < 20090)

lm_model_by_pre <- lm(YearQuarterCode ~ CO2.Mass..short.tons. + State, data = emissions_pre)
by_pre_sum <- summary(lm_model_by_pre)
by_pre_sum
stargazer(lm_model_by_pre,  title = 'Model 1.1.1: By State, pre-2009', align=TRUE, out='mod1.1.1.txt')


by_CI_pre <- confint(lm_model_by_pre, level = 0.95)
by_CI_pre

#by state, post-2009
emissions_post <- subset(emissions, YearQuarterCode > 20090)

lm_model_by_post <- lm(YearQuarterCode ~ CO2.Mass..short.tons. + State, data = emissions_post)
by_post_sum <- summary(lm_model_by_post)
stargazer(lm_model_by_post,  title = 'Model 1.2.1: By State, post-2009', align=TRUE, out='mod1.2.1.txt')


by_CI_post <- confint(lm_model_by_post, level = 0.95)
by_CI_post

#difference in coefficients between pre and post
coef_by_pre <- coef(lm_model_by_pre)
coef_by_post <- coef(lm_model_by_post)

tdiff_by <- t.test(coef_by_pre,coef_by_post, paired=T)
tdiff_by

#difference in coefficients, by state
tidff_DE <- t.test(by_pre_sum$coefficients[3,1], by_post_sum$coefficients[3,1], paired = T)

#---------------------------------------------------------------------------------------------------
#price analysis -> understanding the impact of average allowance price and change

#price by all states
price_time_all <- ggplot(mean_price, aes(x = YearQuarter, y = mean_price))+
                  geom_line()+
                  scale_x_yearqtr(limits = c(min(mean_price$YearQuarter), max(mean_price$YearQuarter)),
                  format = '%Y-Q%q')+
                  labs(title = "Average Allowance Price at Auction, RGGI States", 
                  subtitle = "Average of all States",
                  x = "Quarter", 
                  y = "Average Price, USD")+
  theme_minimal()
  
price_time_all

#time series graphs -> average allowance price by quarter
RGGI_state$State <- factor(RGGI_state$State)

price_time_bystate <- RGGI_state %>% 
                      drop_na() %>% 
                      ggplot(aes(x = YearQuarter, y = `Total Price Per Allowance`,
                             group = State, color = State))+
                      geom_point()+
  geom_smooth()+
                      scale_x_yearqtr(limits = c(min(RGGI_state$YearQuarter), max(RGGI_state$YearQuarter)),
                                       format = '%Y-Q%q')+
                      labs(title = "Average Allowance Price at Auction, RGGI States", 
                           subtitle = "By State",
                           x = "Quarter", 
                           y = "Average Price, USD")+
                      theme_minimal()+
                      scale_colour_discrete()
price_time_bystate


#bar graph of average
avg_by_bar <- ggplot(RGGI_state, aes(x = factor(State), y = `Total Price Per Allowance`))+
              geom_bar(stat = 'summary', fun = 'mean')+
              labs(title = "Average Allowance Price at Auction, RGGI States", 
                subtitle = "Across Period",
                x = "State", 
                y = "Average Price, USD")+
                theme_minimal()+
                scale_colour_discrete()

avg_by_bar


avg_facline <- ggplot(RGGI_state, aes(x = Date, y = `Total Price Per Allowance`))+
                geom_line()+
                facet_wrap(~State, scales = 'free')+
                labs(title = "Average Allowance Price at Auction, RGGI States", 
                    subtitle = "Across Period",
                    x = "Date", 
                    y = "Average Price, USD")+
                theme_minimal()+
                scale_x_continuous(breaks = seq(10, 60, by = 10))

avg_facline


#reg between price and quantity
# lm_pq <- lm(`Total Price Per Allowance`~ `Total Allowances Sold`+ State, data = RGGI_state)
# summary(lm_pq)

#---------------------------------------------------------------------------------------------------
#combine emissions and price data

#average (for graph) -> come back to this

all_comb <- merge(mean_emissions, mean_price, by = 'YearQuarter')
head(all_comb)

all_comb$YearQuarter <- factor(all_comb$YearQuarter)
class(all_comb$YearQuarter)

all_comb$lag_price <- c(0, as.numeric(all_comb$mean_emissions[1-nrow(all_comb)-1]))
head(all_comb)

all_lag <- subset(all_comb, select = -c(mean_price))

#reshape to long
all_comb_long <- all_lag %>%
            pivot_longer(!YearQuarter, names_to = 'Measure', values_to = 'Value')

head(all_comb_long)

#visualize

all_comb_time <- ggplot(all_comb_long, aes(x = YearQuarter, y = Value, group = Measure,
                                           colour = Measure)) +
                 geom_line()+
                 facet_wrap(~Measure, scales = 'free')+
                 labs(title = "Relationshp `", 
                           subtitle = "All States",
                            x = "Quarter", 
                            y = "Change in Emissions Tonnage, %")+
                theme_minimal() +
                scale_color_discrete()
                #scale_x_continuous(labels = c(`2009 Q3`, `2024 Q1`))

all_comb_time


plot(state_coall_comb_longmb$lag_price,all_comb_long$CO2_delta)

#by state (for reg analysis)
state_comb <- merge(emissions, RGGI_state, by = c('YearQuarter', 'state'))
head(state_comb)


#----------------------------------------------------------------------------------------------------
#statistical analysis

#combine state-level df
state_comb <- merge(emissions, RGGI_state, by = c('State', 'YearQuarterCode')) 
#lagged price variable 
state_comb$lag_price <- c(0, as.numeric(state_comb$`Total Price Per Allowance`[1-nrow(state_comb)-1]))

head(state_comb)

#correlation matrix for all
corr_all <- cor(state_comb[sapply(state_comb, is.numeric)], use = 'pairwise.complete.obs')

corrplot(corr_all, method = "circle")

#all states -> correlation between price lag and CO2 delta

#correlation matrix for price and delta
corr_p_delta <- cor.test(state_comb$lag_price, state_comb$CO2_delta)
corr_p_delta

plot(state_comb$lag_price,state_comb$CO2_delta)


#regression between price and delta - all states
lm_model_corr_all <- lm(CO2_delta ~ lag_price, data = state_comb)
summary(lm_model_corr_all)

CI_corr_all<- confint(lm_model_corr_all, level = 0.95)
CI_corr_all

stargazer(lm_model_corr_all,  title = 'Model 2.1: Price vs. CO2 Delta', align=TRUE, out='mod2.1.txt')

#regression between price and delta - by state
lm_model_corr_by <- lm(CO2_delta ~ lag_price + State, data = state_comb)
summary(lm_model_corr_by)

stargazer(lm_model_corr_by,  title = 'Model 2.2: Price vs. CO2 Delta, By State', align=TRUE, out='mod2.2.txt')

CI_corr_by<- confint(lm_model_corr_by, level = 0.95)
CI_corr_by


#----------------------------------------------------------------------------------------------------
#correlation between price and quantity - > consider using quantity as instrument?

#quantity sold lag variable
state_comb$lag_quant <- c(0, as.numeric(state_comb$`Total Allowances Sold`[1-nrow(state_comb)-1]))

head(state_comb)

#all states -> correlation between quantity lag and CO2 delta

#correlation matrix for quant and delta
corr_p_quant <- cor.test(state_comb$lag_quant,state_comb$CO2_delta)
corr_p_quant

plot(state_comb$lag_quant,state_comb$CO2_delta)


#regression between quant and delta - all states
lm_model_corr_quant_all <- lm(CO2_delta ~ lag_quant, data = state_comb)
summary(lm_model_corr_quant_all)

CI_corr_quant_all<- confint(lm_model_corr_all, level = 0.95)
CI_corr_quant_all

#regression between price and delta - by state
lm_model_corr_quant_by <- lm(CO2_delta ~ lag_quant + State, data = state_comb)
summary(lm_model_corr_quant_by)

CI_corr_quant_by<- confint(lm_model_corr_quant_by, level = 0.95)
CI_corr_quant_by







