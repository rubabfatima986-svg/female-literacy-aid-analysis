Female Literacy and Foreign Aid Analysis
Overview
This project examines the relationship between foreign education aid and female literacy rates in 30 developing countries from 2005 to 2021 using panel data regression methods. This dataset is the combined sample of Low-Income Countries (LICs), Lower-Middle-Income Countries (LMICs), and Middle-Income Countries (MICs).
Data

30 countries, 17 years (2005–2021)
510 total observations
Variables: Female Literacy Rate, Education Aid, Government Spending, Mortality Rate
Countries classified as: LICs, LMICs, and MICs

Methods

Pooled OLS
Fixed Effects
Random Effects
Hausman Test
Robust Standard Errors

Key Results
The empirical findings reveal strong and statistically significant relationships between education aid and female literacy outcomes:

Education Aid: Positively associated with female literacy (+0.872, p < 0.01)
Government Spending: Strong negative effect (−0.206, p < 0.01)
Mortality Rate: Large negative effect (−1.976, p < 0.01)

Additionally, the Hausman test (p-value = 0.0006) confirms the Fixed Effects model as the most appropriate specification, controlling for country-specific unobserved heterogeneity.
Regression Results (Combined Sample)
Dependent variable: Female Literacy Rate
----------------------------------------------------------------
                        Pooled OLS   Fixed Effects   Random Effects
                            (1)           (2)              (3)
----------------------------------------------------------------
log_educ_aid              0.798         0.872***         0.833***
                         (0.659)        (0.213)          (0.213)

gov_spending             -0.718***     -0.206***        -0.207***
                         (0.169)        (0.059)          (0.059)

mortality                -4.054***     -1.976***        -2.037***
                         (0.174)        (0.125)          (0.125)

Constant                 91.427***                      71.012***
                         (10.609)                        (5.190)
----------------------------------------------------------------
Observations               510            510              510
R2                        0.557          0.487            0.483
Adjusted R2               0.555          0.453            0.480
F Statistic          212.218***      150.930***         472.074***
================================================================
Note:                              *p<0.1; **p<0.05; ***p<0.01
Model Selection
The Hausman test (p-value = 0.0006) confirms that the Fixed Effects model is the most appropriate specification, as it controls for country-specific unobserved heterogeneity that may be correlated with the regressors.
Key Findings (Combined Sample)

Education Aid: A 1% increase in education aid is associated with a 0.872 point increase in female literacy (p < 0.01). The effect is positive and significant across LICs and LMICs, but not in MICs
Government Spending: Higher government education spending is associated with lower female literacy (−0.206, p < 0.01), possibly reflecting inefficient or poorly targeted spending in lower-income countries
Mortality Rate: Higher mortality is strongly associated with lower female literacy (−1.976, p < 0.01), consistent with the view that poor health conditions reduce educational outcomes

Conclusion
Overall, the results provide robust evidence that education aid has a significant positive effect on female literacy across developing countries, while high mortality rates and inefficient government spending remain key barriers to female education outcomes. These findings reinforce the importance of targeted aid allocation and health investments to support women's education in LICs and LMICs
