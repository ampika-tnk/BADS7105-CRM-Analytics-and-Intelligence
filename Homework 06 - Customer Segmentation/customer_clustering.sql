CREATE MODEL
    `bads7105-crm.Supermarket.customer_cluster5` 

OPTIONS(model_type='kmeans', num_clusters=5, kmeans_init_method='kmeans++', max_iterations=50) 
    
AS
    (
    SELECT 
        CUST_CODE, 
        TOTAL_QUANTITY,
        TOTAL_VISIT,
        AVG_SPEND,
        TICKET_SIZE,
        AVG_BASKET_SIZE,
        PRODUCT_VARIETY,
        NO_VISIT_PER_MONTH, 
        TRANSACTION_PER_MONTH, 
        NO_OF_VISIT,
        AGE_OF_USAGE_MONTH, 
        LAST_VISIT, FIRST_VISIT,  
        MIN_QUANTITY, MAX_QUANTITY,AVG_QUANTITY,
        TOTAL_SPEND, MIN_SPEND, MAX_SPEND, 
        AVG_WEEKLY_VISIT, AVG_WEEKLY_SPEND, 
        TICKET_SIZE_BY_PRODUCT_CATEGORIES, 
        NO_OF_PRODUCT_PURCHASE, NO_OF_FRESH, NO_OF_GROCERY, NO_OF_NONFOOD,
        ACTIVE_DATE, ACTIVE_MONTH, ACTIVEDAY_PER_MONTH, 
        ARPU_MONTH,
            FROM ( 
                    SELECT  CUST_CODE,  
                            MAX(SHOP_DATE) AS LAST_VISIT, 
                            MIN(SHOP_DATE) AS FIRST_VISIT, 
                            COUNT(DISTINCT SHOP_DATE ) AS TOTAL_VISIT,
                            SUM(SPEND) AS TOTAL_SPEND, 
                            MIN(SPEND) AS MIN_SPEND,  
                            MAX(SPEND) AS MAX_SPEND,
                            AVG(SPEND) AS AVG_SPEND,  
                            SUM(QUANTITY ) AS TOTAL_QUANTITY,  
                            MIN(QUANTITY ) AS MIN_QUANTITY,  
                            MAX(QUANTITY ) AS MAX_QUANTITY,  
                            ROUND(AVG(QUANTITY)) AS AVG_QUANTITY,   
                            COUNT(DISTINCT BASKET_ID)/COUNT(DISTINCT SHOP_WEEK) AS AVG_WEEKLY_VISIT,  
                            SUM(SPEND)/COUNT(DISTINCT SHOP_WEEK) AS AVG_WEEKLY_SPEND,  
                            SUM(SPEND)/COUNT(DISTINCT BASKET_ID) AS AVG_BASKET_SIZE,
                            COUNT(DISTINCT(PROD_CODE)) AS PRODUCT_VARIETY,    
                            COUNT(STORE_CODE) AS NO_OF_VISIT,  
                            COUNT(DISTINCT BASKET_ID/30)/COUNT(DISTINCT CUST_CODE) AS NO_VISIT_PER_MONTH,  
                            COUNT(DISTINCT(BASKET_ID))/30 AS TRANSACTION_PER_MONTH,  
                            SUM(SPEND)/COUNT(DISTINCT BASKET_ID) AS TICKET_SIZE,  
                            SUM(SPEND)/COUNT(DISTINCT PROD_CODE) AS TICKET_SIZE_BY_PRODUCT_CATEGORIES,  
                            COUNT(DISTINCT PROD_CODE) AS NO_OF_PRODUCT_PURCHASE,  
                            COUNT(CASE WHEN BASKET_DOMINANT_MISSION = 'FRESH' THEN 1 END) AS NO_OF_FRESH,  
                                    COUNT(CASE WHEN BASKET_DOMINANT_MISSION = 'GROCERY' THEN 1 END) AS NO_OF_GROCERY,
                                    COUNT(CASE WHEN BASKET_DOMINANT_MISSION = 'NONFOOD' THEN 1 END) AS NO_OF_NONFOOD,  
                            COUNT(DISTINCT SHOP_DATE ) AS ACTIVE_DATE,  
                            COUNT(DISTINCT(ROUND((SHOP_DATE/100),0))) AS ACTIVE_MONTH,  
                            ROUND(COUNT(DISTINCT SHOP_DATE )/COUNT(DISTINCT(ROUND((SHOP_DATE/100),0))),1) AS ACTIVEDAY_PER_MONTH,    
                            ROUND(SUM(SPEND)/COUNT(DISTINCT(ROUND((SHOP_DATE/100),0))),2) AS ARPU_MONTH,    
                            DATE_DIFF(MAX(PARSE_DATE('%Y%m%d', CAST (SHOP_DATE AS STRING))),
                            MIN(PARSE_DATE('%Y%m%d', CAST (SHOP_DATE AS STRING))),MONTH) AS AGE_OF_USAGE_MONTH,

    FROM `bads7105-crm.Supermarket.supermarket`
    WHERE CUST_CODE IS NOT NULL
    GROUP BY CUST_CODE , SHOP_WEEK)
    )