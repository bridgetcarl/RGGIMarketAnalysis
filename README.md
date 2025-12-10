# Analyzing the Relationship Between Cap-and-Trade Emissions Spot Price and Effectiveness in Emissions Reductions
## A Study of the Regional Greenhouse Gas Initiative

#### Bridget Carl
#### Data Analytics and Policy, Johns Hopkins University
#### AS.470.862.81 Capstone for Data Analytics and Policy
#### August 12, 2024

## Abstract
Cap-and-trade regulatory interventions are an innovative method of achieving pollutant mitigation by targeting emissions at the firm-level. Regulators define a maximum level of pollutant in an ecosystem, which are then divided into “credits” for firms to trade the “right to pollute.” The 1995 Acid Rain Program was the first cap-and-trade program globally. The program was able to successfully reduce emissions, but was inconsistent in cost-savings to society. The Regional Greenhouse Gas Initiative (RGGI) is a cap-and-trade program for CO2 consumption in 11 Northeastern US states. This analysis estimates the policy impact of the RGGI’s implementation in CO2 emissions in these states, as well as the correlation between average quarterly auction prices of CO2 credits and subsequent changes in CO2 emissions. While there has been no statistically significant changes in CO2 emissions across states between the periods before and after the RGGIs implementation, there is a negative and statistically significant correlation between the previous quarter’s average auction price and current quarter-over-quarter change in CO2 emissions across states

Cap-and-trade markets are a form of market-based regulatory intervention aimed at reducing pollutant emissions at the firm-level. Cap-and-trade measures have proven successful at mitigating pollutant emissions (Ellerman, 2003), as well as are less economically costly to firms than orthodox command-and-control regulations (Chan et al., 2018). It appears that cap-and-trade intervention is a strong option for environmental regulation moving forward, especially in the race against climate change. However, cap-and-trade programs are not common globally. Today, there is no federally mandated cap-and-trade emissions programs after the Acid Rain Program’s end in 2015. 11 Northeastern US states joined the Regional Greenhouse Gas Initiative (RGGI) in 2009. Other major markets include the European Union and China. What is the effect of cap-and-trade programs on carbon emissions in the US? Are market-based programs a viable and economically efficient measure of curbing pollution?

## I. Policy Background
  Cap-and-trade programs are a form of market-based government intervention aimed at encouraging firms, particularly in the energy sector, to reduce their emissions of pollutants. This approach involves the government setting a maximum allowable level of pollutant in an environment, dividing the maximum into allowances, or “credits”. Firms are allocated credits yearly, which can either be used based on the firm’s specific needs. A lower-emission firm may choose to sell extraneous credits to a higher-emission firm who is willing to incur the price of the credit for a greater “right to pollute”. A sustained market for carbon credits will result if the government has set a cap on overall emissions that is low enough so that demand exceeds supply and individual credits become a commodity. 
  
  The first cap-and-trade programs were proposed to Congress during the George H.W. Bush administration as a means of reducing the growing issue of acid rain in the eastern US. This was eventually implemented as the 1995 Acid Rain Program, a component of the Clean Air Act. Market-based interventions like cap-and-trade were popular in the 1980s, as they deemphasized the government’s involvement in influencing firm behavior and leading to a desired outcome. This was theorized to be more effective at influencing firm behavior than the previously popular command-and-control regulations, which required firms to purchase and implement scrubbers to reduce sulfur oxide emissions, since firms had the freedom to buy or sell the right to pollute themselves (Conniff, 2009). 
  
  The growing concern of climate change has influenced elections and driven sectors to introduce new marketing campaigns, innovate new process to decrease their environmental footprint, and strategically plan for future endeavors with environmental concern in mind. Finding effective means of addressing climate change has proven to be near impossible with the need to balance environmentalists, advocating for advanced control measures, and free-market advocates, who believe that regulatory intervention would have economically disastrous effects on firm performance and output. Cap-and-trade programs were an exciting and innovative regulatory measure that proved popular among both camps at first. In many ways, the Acid Rain Program was an experiment for market-based programs as a means of environmental regulation. 
	
  11 US States (Maine, New Hampshire, Vermont, Massachusetts, Connecticut, Rhode Island, New York, New Jersey, Delaware, Maryland, Virginia, and Pennsylvania) are a member of the Regional Greenhouse Gas Initiative (RGGI). This is an ongoing program aiming to reduce carbon dioxide emissions in the US Northeast by the energy sector, launched in 2009. Initially, the program’s success was hindered by the Great Recession naturally causing a slowdown in energy consumption and a growing movement towards renewable energy consumption. This resulted in the emissions cap lowering by 45% in 2014 to meet natural emissions levels and force scarcity onto carbon credits (Congressional Research Service, 2017). Despite this, a 2015 econometric study found that the RGGI program resulted in a 24% reduction in carbon dioxide emissions not as a result of external factors (Murray & Maniloff, 2015). 

## *I.I Efficiency of Cap-and-Trade Interventions*
  For a cap-and-trade intervention to be economically efficient, the overall benefit to society must outweigh the overall cost to society of its implementation. A 2018 econometric study disputed the Acid Rain Program’s ability to reach these ends. This study primarily quantifies the economic cost of the Acid Rain Program vs. other command-and-control interventions that aimed to reduce the same amount of emissions. While emissions reductions goals were met, the overall cost to society under the cap-and-trade environment was estimated to be $2.1 billion higher than the no-trade environment. Compliance costs were $200 million higher and health damages were $170 million higher than the no-trade environment (Chan et.al, 2018). This exemplifies the unintended consequence called leakage, where the marginal impacts of emissions are disproportionately placed onto nearby, unregulated areas.

Another aspect of economic efficiency is the ability for auction markets to impact emissions entirely. Two unintended consequences of cap-and-trade programs are emissions leakage, or the transfer of polluting production to unregulated states, and emissions spillage, or the increased emission of other, unregulated pollutants as a replacement of the regulated pollutant. This is partially due to a lack of complete regulation across regions. There is also a known relationship between auction price and economic leakage. A 2009 econometric study identified that leakage of CO2 to nearby unregulated stats is negatively correlated with CO2 allowance prices. Alternatively, leakage of SO2 and NOx are positively correlated with CO2 allowance prices. While there are potential unintended costs associated with allowance price, there is clear demand elasticity between CO2 emissions and CO2 allowance price (Chen, 2009).
	
  A 2008 econometric study predicts the economic and energy impacts of joining the RGGI at a state-level, using Maryland as an instrument. They concluded that Maryland’s participation in the RGGI is likely to have no impact on their emissions or energy market than if following alternative command-and-control interventions. RGGI was estimated to lower overall energy demand, but have limited impact on energy supply due to shifting to non-CO2 emitting options. They also predict that CO2 emissions would fall, with minimal leakage to nearby, unregulated states. They also predicted overall household electricity costs would lower over time, mostly due to the lowered usage of electricity from energy-efficient innovations (Ruth et al., 2008).

## II. Hypotheses

## *II.I RGGI Impact on CO2 Emissions- Time Series Analysis*
  What was the impact of the origination of the RGGI as a emissions-reductions initiative on the CO2 emissions in the states affected by the policy? The null hypothesis proposes that the emissions pre-policy and post-policy are identical, or there was no impact on emissions by the initiative. The alternative hypothesis proposes that the emissions pre-policy and post-policy are not identical significantly, or there was a statistically significant impact on emissions by the initiative.

*H0: emissions pre-RGGI = emissions post-RGGI*

*H1 : emissions pre-RGGI != emissions post-RGGI*

## *II.II Number of Allowances Auctioned Impact on Subsequent Change in Emissions- Correlation Analysis*
  In states impacted by the RGGI, does the quantity of allowances sold impact subsequent CO2 emissions? The null hypothesis proposes that there is no statistically significant correlation between number of allowances auctioned and the subsequent change in CO2 emissions. The alternative hypothesis proposes that there is a statistically significant correlation between number of allowances auctioned and the subsequent change in CO2 emissions.

*H0: There is no correlation between quantity of allowances sold and subsequent change in CO2 emissions.*

*H1 : There is a correlation between quantity of allowances sold and subsequent change in CO2 emissions.*

## *II.III Average Allowance Price Impact on Subsequent Change in Emissions- Correlation Analysis*
  In states impacted by the RGGI, does the average price of allowances sold impact subsequent CO2 emissions? The null hypothesis proposes that there is no statistically significant correlation between average price of allowances auctioned and the subsequent change in CO2 emissions. The alternative hypothesis proposes that there is a statistically significant correlation between average price of allowances auctioned and the subsequent change in CO2 emissions.
  
*H0: There is no correlation between average allowance price and subsequent change in CO2 emissions.*

*H1 : There is a correlation between average allowance price and subsequent change in CO2 emissions.*

## III Data

## *III.I CO2 Emissions*
  Data on CO2 emissions over time are sourced from the US Environmental Protection Agency (EPA)’s Clean Air Markets Program Data (CAMD) database. This data includes information on tonnage of various pollutant emissions in the 11 states participating in the RGGI program. RGGI auctions occur quarterly, so quarterly emissions data is reviewed in this analysis. 

  The CAMD data includes 1,130 quarterly emissions values across the states. The years included are 1995 – Q1 2024, giving a nearly equal amount of time between the pre-policy and post-policy periods for an adequate time series analysis. When analyzed against RGGI price and quantity of allowances sold, emissions prior to 2009 will not be included. 

  To prepare the data for a time series analysis and time series plotting, three variables were added. A ‘YearQuarter’ variable, of class yearqtr (from the “Zoo” R package), allows for seamless plotting of quarterly time periods. A ‘YearQuarterCode’ variable, of class integer, allows for mathematical interpretation of the year-quarter time periods in the time series analysis. A ‘co2_delta’ variable, of class numeric, represents the percent change in CO2 which is the final dependent variable in both analyses. Table 1 summarizes the CAMD emissions data:

### Table 1: CAMD Data Summary

| Field           | Length | Min       | 1st Qu.    | Median   | Mean     | 3rd Qu.   | Max       | Class    |
|----------------|--------|----------|-----------|----------|----------|-----------|-----------|----------|
| State          | 1130   |          |           |          |          |           |           | char     |
| Year           | 1130   | 1995     |           |          |          |           | 2024      | numeric  |
| Quarter        | 1130   | 1        |           |          |          |           | 4         | numeric  |
| YearQuarter    | 1130   | 1995 Q1  |           |          |          |           | 2024 Q1   | yearqtr  |
| YearQuarterCode| 1130   | 19951    |           |          |          |           | 20241     | integer  |
| CO2_Tons       | 1130   | 26883    | 748588    | 1774259  | 3011999  | 4273400   | 19185640  | numeric  |
| CO2_Delta      | 1130   | -0.941303| -0.198672 | 0.002715 | 0.074733 | 0.253505  | 7.226018  | integer  |

## *III.II RGGI Auction Price and Number of Allowances Auctioned*
  The Regional Greenhouse Gas Initiative itself provides data on quarterly auction results across all states who participate. This includes total number of allowances sold, the total revenue earned at auction, state, and auction number. There are 618 observations across the states involved between Q4 2008 and Q3 2024. 
  
  To prepare the data for analysis and ensure that time variables align with the emissions data when combined, several variables were added. First, the auction number variable had to be translated to a date. Because it is known that auctions occur quarterly, each auction number was translated to the first month of the quarter in the corresponding year in the ‘Date’ variable.  A ‘YearQuarter’ variable, of class yearqtr (from the “Zoo” R package), allows for seamless plotting of quarterly time periods. A ‘YearQuarterCode’ variable, of class integer, allows for mathematical interpretation of the year-quarter time periods in the time series analysis. A `Total Price Per Allowance` variable, of class integer, was added to summarize the average price per allowance auctioned. A ‘lag_price’ variable, of class integer, represents the previous period’s value for `Total Price Per Allowance`. A ‘lag_quant’ variable, of class integer, represents the previous period’s value for `Total Allowances Sold`. Table 2 summarizes the RTGGI auction data:

### Table 2: Summary of RGGI Data

| Field                     | Length | Min       | 1st Qu.  | Median  | Mean     | 3rd Qu.  | Max       | Class    |
|---------------------------|--------|-----------|----------|---------|----------|----------|-----------|----------|
| State                     | 618    |           |          |         |          |          |           | char     |
| Date                      | 618    | 08-09-25  |          |         |          |          | 24-06-25  | datetime |
| YearQuarter               | 618    | 2008 Q3   |          |         |          |          | 2024 Q3   | yearqtr  |
| YearQuarterCode           | 618    | 20083     |          |         |          |          | 20243     | integer  |
| Total Allowances Sold     | 618    | 54384     | 523703   | 977122  | 4365981  | 3001185  | 485232102 | numeric  |
| Total Price Per Allowance | 618    | 1.860     | 2.703    | 4.710   | 5.953    | 7.410    | 21.030    | numeric  |


## IV. Methods
  All analysis, including data pre-processing, plotting, and statistical analysis was conducted in R Studio using R 4.4.0. Data pre-processing included importing into dataframes, adding necessary time series variables for statistical and visual analysis, and merging dataframes to analyze the relationship between emissions and auction results. Plotting was conducted in the R package “ggplot2”, using simple line graphs for visual effectiveness. 
	
  To understand the policy impact of the RGGI on emissions in RGGI states, two linear regressions were conducted for emissions before and after the 2009 inception of the policy. The period before and after the policy change are roughly, allowing for a robust correlation analysis. The regression coefficient estimate on both regressions were then compared via a paired students t-test. This is to estimate if the difference in mean emissions before and after are statistically significant, or if the difference would exist in reality all-else-equal. 

  To understand the relationship between auction results and emissions and analyze the second null hypothesis, the datasets were combined and analyzed jointly. The variable ‘CO2_delta’ represents the change in CO2 emissions from the previous period (quarter), and is the dependent variable of interest in analyzing the second null hypothesis. The variable ‘lag_price’ represents the average auction price from the previous period (quarter) and is the dependent variable of interest in analyzing the second null hypothesis. These two variables describe the causation best between auction result and effective change in emissions.
	
## V. Results

## *V. I Time Series Policy Analysis*

## *V.I.I Visual Analysis.* 
First, the hypothesis null hypothesis stating that the emissions pre-policy and post-policy are identical must be tested. As seen in Figure 1 below, quarterly CO2 emissions by tonnage decreased across all RGGI states post-policy introduction in 2009.

<img width="789" height="665" alt="image" src="https://github.com/user-attachments/assets/635d39ee-6096-4d13-b433-d11ec68ff31f" />

Figure 2 below depicts CO2 emissions over the same time period, but by state. This shows that while most states followed a downward trend, there was an asymmetric impact of the RGGI policy across states. For example, New Hampshire’s emissions appeared to increase while Vermont consistently had near zero emissions.

<img width="789" height="665" alt="image" src="https://github.com/user-attachments/assets/a2762814-b22b-4528-acc1-bd652b2cf33f" />

Figure 3 below depicts the change in CO2 emissions by state across the period. Again, there is much variation across states in the change in CO2 emissions over time. There is also clearly seasonal trends in emissions across all states.

<img width="789" height="665" alt="image" src="https://github.com/user-attachments/assets/bd56f150-88b9-4113-9b73-d71f8ab31ddd" />


## V.I.II Statistical Analysis. 
The statistical time series analysis attempts to invalidate the null hypothesis H0: emissions pre-RGGI = emissions post-RGGI. 

## *V.I.II.I Time series analysis of average emissions across all states* 
First, the most simple test analyzes the correlation between time and average emissions across states before and after 2009. To do this, a linear regression is conducted on the state-wide average of emissions over quarter before 2009. Another regression is conducted on the state-wide average of emissions over quarter after 2009. A paired t-test then analyzes the difference between correlation estimates between both time series analyses. The results of the 3 tests are below.

### Model 1.1: All states, pre-2009

**Dependent variable:** `YearQuarterCode`

| Term           | Estimate   | Std. Error | Signif. |
|----------------|-----------:|-----------:|:-------:|
| mean_emissions | 0.00002    | 0.00001    | ***     |
| Constant       | 19,942.250 | 23.044     | ***     |

**Model fit**

- **Observations:** 56  
- **R²:** 0.172  
- **Adjusted R²:** 0.156  
- **Residual Std. Error:** 37.377 (df = 54)  
- **F Statistic:** 11.187*** (df = 1; 54)  

*Note: \*p<0.1; \*\*p<0.05; \*\*\*p<0.01*

### Model 1.2: All states, post-2009

**Dependent variable:** `YearQuarterCode`

| Term           | Estimate    | Std. Error | Signif. |
|----------------|------------:|-----------:|:-------:|
| mean_emissions | -0.00005    | 0.00001    | ***     |
| Constant       | 20,279.810  | 17.910     | ***     |

**Model fit**

- **Observations:** 61  
- **R²:** 0.430  
- **Adjusted R²:** 0.421  
- **Residual Std. Error:** 33.775 (df = 59)  
- **F Statistic:** 44.562*** (df = 1; 59)  

*Note: \*p<0.1; \*\*p<0.05; \*\*\*p<0.01*


### Test 1.3: Difference in Coefficients, Pre- vs. Post-

**Test:** Paired t-test  
**Data:** `coef_all_pre` and `coef_all_post`

- **t statistic:** -1  
- **Degrees of freedom:** 1  
- **p-value:** 0.5  
- **Alternative hypothesis:** True mean difference is not equal to 0  

**95% confidence interval for the mean difference**

- Lower bound: -2313.289  
- Upper bound: 1975.735  

**Sample estimate**

- Mean difference: -168.7767  


In both regression models, the estimated correlation between average emissions and quarter is statistically significant at the 99% level. While the difference in average emissions across all states before and after the RGGI’s release in 2009  is seen visually, there is no statistically significant difference in coefficients per Test 1.3. To add robustness to the model, State is added as an independent variable in models 1.1.2 and 1.2.2, below.

## *V.I.II.II Time series analysis of average emissions by state*
The same exercise is performed, but adding State as an independent variable to the before- and after- linear regression models. 

### Model 1.1.1: By State, pre-2009

**Dependent variable:** `YearQuarterCode`

| Term                     | Estimate    | Std. Error | Signif. |
|--------------------------|------------:|-----------:|:-------:|
| CO2.Mass..short.tons.    | 0.00001     | 0.00000    | ***     |
| StateDE                  | 4.413       | 7.477      |         |
| StateMA                  | -30.801     | 7.782      | ***     |
| StateMD                  | -44.420     | 8.733      | ***     |
| StateME                  | 8.740       | 7.556      |         |
| StateNH                  | -5.630      | 7.206      |         |
| StateNJ                  | -12.973     | 7.191      | *       |
| StateNY                  | -73.784     | 11.683     | ***     |
| StateRI                  | 11.959      | 7.647      |         |
| StateVT                  | 14.604      | 7.742      | *       |
| Constant                 | 20,012.300  | 5.707      | ***     |

**Model fit**

- **Observations:** 520  
- **R²:** 0.102  
- **Adjusted R²:** 0.084  
- **Residual Std. Error:** 36.494 (df = 509)  
- **F Statistic:** 5.758*** (df = 10; 509)  

*Note: \*p<0.1; \*\*p<0.05; \*\*\*p<0.01*


### Model 1.2.1: By State, post-2009

**Dependent variable:** `YearQuarterCode`

| Term                     | Estimate    | Std. Error | Signif. |
|--------------------------|------------:|-----------:|:-------:|
| CO2.Mass..short.tons.    | -0.00002    | 0.00000    | ***     |
| StateDE                  | -22.358     | 7.612      | ***     |
| StateMA                  | 13.434      | 7.436      | *       |
| StateMD                  | 45.216      | 8.410      | ***     |
| StateME                  | -27.789     | 7.759      | ***     |
| StateNH                  | -18.066     | 7.517      | **      |
| StateNJ                  | 41.509      | 8.250      | ***     |
| StateNY                  | 106.693     | 12.165     | ***     |
| StateRI                  | -22.011     | 7.604      | ***     |
| StateVT                  | -35.196     | 8.003      | ***     |
| Constant                 | 20,200.920  | 6.189      | ***     |

**Model fit**

- **Observations:** 610  
- **R²:** 0.168  
- **Adjusted R²:** 0.154  
- **Residual Std. Error:** 40.510 (df = 599)  
- **F Statistic:** 12.087*** (df = 10; 599)  

*Note: \*p<0.1; \*\*p<0.05; \*\*\*p<0.01*


### Test 1.3.1: Difference in Coefficients, Pre- vs. Post-

**Test:** Paired t-test  
**Data:** `coef_by_pre` and `coef_by_post`

- **t statistic:** -1.4086  
- **Degrees of freedom:** 10  
- **p-value:** 0.1893  
- **Alternative hypothesis:** True mean difference is not equal to 0  

**95% confidence interval for the mean difference**

- Lower bound: -93.39971  
- Upper bound: 21.04649  

**Sample estimate**

- Mean difference: -36.17661  


As demonstrated in the above models, not all states experienced statistically significant changes over time in emissions levels prior to 2009. In the period following the RGGI’s inception, all states experienced statistically significant changes in emissions over time. Interestingly, there is a lack of consistency in the direction of the change in emissions. While the overall change in emissions per year was -0.00002 (significant at 99%), Massachusetts, Maryland, New Jersey, and New York experienced an increase after the RGGI’s inception. This may be a result of a known unintended consequence of cap-and-trade markets called leakage, where CO2 emissions from nearby unregulated states drift in the atmosphere to affect other, unregulated areas. Lastly, there again is no statistically significant difference between the change in overall emissions across states before and after the RGGI’s inception in 2009. 


## V.II Correlation Policy Analysis

## *V.II.I Visual Analysis* 
Figure 4 below depicts the change in average price per allowance sold at RGGI auction from its inception until Q2 2024.

<img width="1589" height="670" alt="image" src="https://github.com/user-attachments/assets/ff93a9e3-f3d5-4887-b301-5b544fac5f40" />

<img width="1589" height="670" alt="image" src="https://github.com/user-attachments/assets/cc8dcf11-7945-4775-946d-85503ea3041e" />


Interestingly, the average auction price of credits across the entire RGGI period is very similar across states. As seen in Figure 5 below, most states had an average auction price of $5.89 USD, except for New Jersey with an average price of $7.66 USD. Note that this analysis excludes auction prices and emissions for Virgina, who joined the RGGI in 2020 where there was a sharp increase in auction prices across the board. The average auction price in Virgina for the last four years was $12.14. 

<img width="1589" height="670" alt="image" src="https://github.com/user-attachments/assets/b55cbae5-a517-4518-98cf-f185228d20d2" />


Further, Figure 6 below depicts the change in average auction price over the RGGI period, further exemplifying the consistency across states in price trends during the RGGI period. Only Maryland and New Jersey seemed to be less effected by a 2017 jump in average auction price. RGGI states agreed to increase their increase their emissions reduction annually by an additional 30% by 2030 in Q3 2017 (RGGI Inc., 2017), which can explain the sudden but short-term increase in average auction price in late 2017 across states. 


<img width="1589" height="670" alt="image" src="https://github.com/user-attachments/assets/59a13683-4630-4b08-90d2-51dcd662fa06" />


## *V.II.II Statistical Analysis*
The correlation regression analysis attempts to invalidate the second null hypothesis, H0: There is no correlation between average allowance price and subsequent change in CO2 emissions following the implementation of the RGGI. 

To begin the formal correlation analysis between auction sell price and subsequent changes in emissions levels, a simple correlation analysis is conducted the visualize the relationship between the auction price and emissions data. Figure 7 below further depicts the correlation between variables in the combined dataset. Unsurprisingly given the analysis of the first null hypothesis, CO2 emissions (defined as ‘CO2.Mass..short.tons’) and quarter (defined as ‘YearQuarterCode’) are slightly negatively correlated. Interestingly, change in CO2 emissions (defined as ‘CO2_delta’) and previous quarter’s auction price (defined as ‘lag_price’) are also slightly negatively correlated. 


<img width="1589" height="670" alt="image" src="https://github.com/user-attachments/assets/ecc3d1e9-459b-4592-842c-a411ef634a9d" />


This relationship is analyzed further in the below scatter plot (Figure 8).


<img width="1589" height="670" alt="image" src="https://github.com/user-attachments/assets/3fefce2c-a88a-4a37-95e3-c18250b66039" />


## *V.II.II.I Regression analysis- relationship between price and change in CO2 emissions across all states*
Model 2.1 estimates the correlation between previous quarter’s auction price and current quarter-over-quarter change in CO2 emissions. 

### Model 2.1: Price vs. CO₂ Delta

**Dependent variable:** `CO2_delta`

| Term      | Estimate | Std. Error | Signif. |
|----------|---------:|-----------:|:-------:|
| lag_price| -0.0003  | 0.0002     | **      |
| Constant | -0.004   | 0.001      | ***     |

**Model fit**

- **Observations:** 592  
- **R²:** 0.007  
- **Adjusted R²:** 0.005  
- **Residual Std. Error:** 0.015 (df = 590)  
- **F Statistic:** 4.038** (df = 1; 590)  

*Note: \*p<0.1; \*\*p<0.05; \*\*\*p<0.01*


According to the regression estimate from model 2.1, across all RGGI states between Q1 2009 and Q1 2024, a $1 change in last quarter’s average auction price resulted in a 0.0003 percentage point decrease in CO2 emissions quarter-over-quarter. This estimate is significant at the 95% level. This relationship is analyzed further in model 2.2, below.

### Model 2.2: Price vs. CO₂ Delta, by State

**Dependent variable:** `CO2_delta`

| Term      | Estimate | Std. Error | Signif. |
|-----------|---------:|-----------:|:-------:|
| lag_price | -0.0003  | 0.0001     | **      |
| StateDE   | -0.0020  | 0.0030     |         |
| StateMA   | -0.0002  | 0.0030     |         |
| StateMD   | -0.0004  | 0.0030     |         |
| StateME   | -0.0070  | 0.0030     | ***     |
| StateNH   | -0.0010  | 0.0030     |         |
| StateNJ   | -0.0002  | 0.0030     |         |
| StateNY   | -0.0010  | 0.0030     |         |
| StateRI   | -0.0003  | 0.0030     |         |
| StateVT   | -0.0150  | 0.0030     | ***     |
| Constant  | -0.0010  | 0.0020     |         |

**Model fit**

- **Observations:** 592  
- **R²:** 0.108  
- **Adjusted R²:** 0.093  
- **Residual Std. Error:** 0.014 (df = 581)  
- **F Statistic:** 7.043*** (df = 10; 581)  

*Note: \*p<0.1; \*\*p<0.05; \*\*\*p<0.01*



Model 2.2 estimates the correlation between previous quarter’s auction price and current quarter-over-quarter change in CO2 emissions, by state. When controlling for state-wide differences in auction price between Q1 2009 and Q1 2024, a $1 change in last quarter’s average auction price resulted in a 0.0003 percentage point decrease in CO2 emissions quarter-over-quarter. This estimate is significant at the 95% level. The relationship between auction price and quarter-over-quarter change to emissions was negative in all RGGI states. The only states with statistically significant correlations between auction price and change to CO2 emissions were Maine and Vermont. Both states showed a negative and statistically significant (at 99%) decline in CO2 emissions following the implementation of the RGGI, per model 1.2.1. 

## VI. Conclusion
In the model described, there was no statistically significant difference in CO2 emissions in RGGI states before and after the implementation of the policy in 2009. The model itself could be a poor fit, especially if there are state-level differences in regulatory environment or the energy production ecosystem. There also could be differences in electricity demand between states. With further time and resources, a model should be used to account for state-level fixed effects to control for differences in emissions across entities.

As predicted in the theoretical background, there was price elasticity of demand for auction prices for carbon credits, demonstrated by a statistically significant and negative correlation between the previous quarter’s average auction price and current quarter-over-quarter change in CO2 emissions across states. Again, with further time and resources, this correlation should be conducted controlling for state-level fixed effects for robustness. 


## Bibliography
Chan, H. R., Chupp, B. A., Cropper, M. L., & Muller, N. Z. (2018). The impact of trading on the costs and benefits of the Acid Rain Program. Journal of Environmental Economics and Management, 88, 180–209. https://doi.org/10.1016/j.jeem.2017.11.004

Chen, Y. (2009). Does a regional greenhouse gas policy make sense? A case study of carbon leakage and emissions spillover. Energy Economics, 31(5), 667–675. https://doi.org/10.1016/j.eneco.2009.02.003

Colby, B. G. (2000). Cap-and-Trade Policy Challenges: A tale of three markets. Land Economics, 76(4), 638. https://doi.org/10.2307/3146957

Conniff, R. (2013, November 16). The political history of cap and trade. Smithsonian Magazine. https://www.smithsonianmag.com/science-nature/the-political-history-of-cap-and-trade-34711212/.

Ellerman, A. (2003). Are cap-and-trade programs more environmentally effective than conventional regulation? In MIT Center for Energy and Environmental Policy Research (No. 03-015 WP). Massachusetts Institute of Technology. Retrieved June 14, 2024, from https://dspace.mit.edu/bitstream/handle/1721.1/45008/2003-015.pdf?sequence=1&isAllowed=y

Murray, B. C., & Maniloff, P. T. (2015). Why have greenhouse emissions in RGGI states declined? An econometric attribution to economic, energy market, and policy factors. Energy Economics, 51, 581–589. https://doi.org/10.1016/j.eneco.2015.07.013

RGGI Inc. (2017). RGGI States Announce Proposed Program Changes: Additional 30% EmissionsCap Decline by 2030. In The Regional Greenhouse Gas Initiative. Retrieved August 10, 2024, from https://www.rggi.org/sites/default/files/Uploads/Program-Review/8-23-2017/Announcement_Proposed_Program_Changes.pdf

Ruth, M., Gabriel, S. A., Palmer, K. L., Burtraw, D., Paul, A., Chen, Y., Hobbs, B. F., Irani, D., Michael, J., Ross, K. M., Conklin, R., & Miller, J. (2008). Economic and energy impacts from participation in the regional greenhouse gas initiative: A case study of the State of Maryland. Energy Policy, 36(6), 2279–2289. https://doi.org/10.1016/j.enpol.2008.03.012

The Regional Greenhouse Gas Initiative: lessons learned and issues for Congress. (2017). In Congressional Research Service (No. R41836). US Congress. Retrieved June 14, 2024, from https://crsreports.congress.gov/product/pdf/R/R41836/14
