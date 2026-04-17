# Write your MySQL query statement below

SELECT 
    t.customer_id
FROM(SELECT
        customer_id,
        COUNT(DISTINCT product_key) prodCount
    FROM Customer
    GROUP BY customer_id
)t WHERE prodCount = (
    SELECT
        COUNT(*)
    FROM Product
)