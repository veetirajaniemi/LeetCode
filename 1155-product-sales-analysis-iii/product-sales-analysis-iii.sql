# Write your MySQL query statement below
SELECT 
    t.product_id,
    t.year first_year,
    t.quantity,
    t.price
FROM(SELECT
        *,
        RANK() OVER(PARTITION BY product_id ORDER BY year) year_rank
    FROM Sales)t
WHERE t.year_rank = 1