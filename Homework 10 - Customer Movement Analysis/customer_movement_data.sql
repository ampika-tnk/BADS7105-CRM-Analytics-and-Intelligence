SELECT
    Current_Period,
    SUM(CASE WHEN CUSTOMER_TYPE = 'New' THEN 1 ELSE 0 END) AS `New_Customer`,
    SUM(CASE WHEN CUSTOMER_TYPE = 'Repeat' THEN 1 ELSE 0 END) AS `Repeat_Customer`,
    SUM(CASE WHEN CUSTOMER_TYPE = 'Reactivate' THEN 1 ELSE 0 END) AS `Reactivate_Customer`,
    SUM(CASE WHEN CUSTOMER_TYPE = 'Repeat' THEN 1 ELSE 0 END) - LAG(COUNT(Current_Period), 1) OVER (ORDER BY Current_Period) AS `Churn_Customer`,
FROM 
(
    SELECT
        Current_Period,
        CASE 
            WHEN Previous_Period IS NULL THEN "New"
            WHEN (Current_Year - Previous_Year) * 12 + (Current_Month - Previous_Month) = 1 THEN "Repeat"
            WHEN (Current_Year - Previous_Year) * 12 + (Current_Month - Previous_Month) > 1 THEN "Reactivate"
            WHEN Previous_Period IS NOT NULL AND Current_Period IS NULL THEN "Churn" 
        END AS Customer_Type
    FROM 
    (
        SELECT 
            CUST_CODE,
            Shop_Period AS Current_Period,
            LAG (Shop_Period, 1) OVER (PARTITION BY CUST_CODE ORDER BY Shop_Period) AS Previous_Period,
            CAST(FORMAT_DATETIME('%Y', PARSE_DATE('%Y%m', CAST(Shop_Period AS STRING))) AS INT64) AS Current_Year,
            CAST(FORMAT_DATETIME('%m', PARSE_DATE('%Y%m', CAST(Shop_Period AS STRING))) AS INT64) AS Current_Month,
            CAST(FORMAT_DATETIME('%Y', PARSE_DATE('%Y%m', LAG (Shop_Period, 1) OVER (PARTITION BY CUST_CODE ORDER BY Shop_Period))) AS INT64) AS Previous_Year,
            CAST(FORMAT_DATETIME('%m', PARSE_DATE('%Y%m', LAG (Shop_Period, 1) OVER (PARTITION BY CUST_CODE ORDER BY Shop_Period))) AS INT64) AS Previous_Month,
        FROM 
        (
            SELECT 
                CUST_CODE,
                FORMAT_DATETIME('%Y%m', PARSE_DATE('%Y%m%d', CAST(SHOP_DATE AS STRING))) AS Shop_Period,
            FROM `bads7105-crm.Supermarket.supermarket`
            WHERE CUST_CODE IS NOT NULL
            GROUP BY CUST_CODE, Shop_Period
        )
        ORDER BY CUST_CODE, Shop_Period
    )
    ORDER BY Current_Period
) 
GROUP BY Current_Period 
ORDER BY Current_Period