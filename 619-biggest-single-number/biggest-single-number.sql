# Write your MySQL query statement below

SELECT 
    MAX(num) num
FROM(SELECT
        *,
        COUNT(*) numCount
    FROM MyNumbers
    GROUP BY num)t
WHERE numCount = 1