# Write your MySQL query statement below


/*SELECT 
        COUNT(*) countImmediate FROM(
            SELECT
                *,
                ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) firstOrdersRank
            FROM Delivery
        )t WHERE t.firstOrdersRank = 1 AND t.order_date = t.customer_pref_delivery_date */

SELECT 
    ROUND(SUM(firstOrdersRank) / (SELECT COUNT(DISTINCT customer_id) FROM Delivery) * 100, 2) immediate_percentage
FROM(SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) firstOrdersRank
    FROM Delivery)t
WHERE t.FirstOrdersRank = 1 AND t.order_date = t.customer_pref_delivery_date
