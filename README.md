# e-Electronics Sales Analysis

e-Electronics is an e-commerce company that sells popular electronics to customers worldwide. I performed an exploratory analysis of their core marketing data to investigate yearly trends, product performance, marketing channel performance, and refund rates. I also evaluated the efficacy of their loyalty program and recommended whether they should continue with the program.

## Summary of Insights

Yearly trends: Between 2019 and 2022, the total revenue exceeded $28 million over 100K orders with an AOV of $260. In particular, 2020 saw the highest growth across the board along with the greatest revenue ($10.2 million) and highest AOV ($300), potentially related to increased pandemic spending. Meanwhile, 2021 saw the highest number of orders (36K).

Seasonality: November and December tend to see the highest growth in orders and revenue while January and February see the lowest growth, possibly related to trends in holiday spending. March 2020 saw the highest growth in the number of orders and total revenue, possibly due to pandemic purchases.

Product performance: The Apple AirPods Headphones were consistently the most popular product, with 48K sales for a total revenue of $7.7 million. The 27in 4K Gaming Monitor consistently brought in the most revenue for a total of $9.9 million over 23K sales. In contrast, the Bose Soundsport Headphones was consistently the least popular product, bringing in 27 sales for a total revenue of $3.3K.

Marketing channel performance: 

Refund rates: 

Loyalty program efficacy: The loyalty program is increasing in popularity, accounting for 12% of customers in 2019 to 52% in 2022. 

## Recommendations

## Caveats

Currency is in USD.
`REGION` had many non-sensical values and was supplemented with a more accurate online table.
`DAYS_TO_DELIVER` had 14 records (0.01%) with negative values (i.e., delivery date before purchase date).
`COUNTRY_CODE` had 140 records (0.1%) missing; chose not to use `CURRENCY` due to inconsistencies between `CURRENCY` and `COUNTRY_CODE`.
