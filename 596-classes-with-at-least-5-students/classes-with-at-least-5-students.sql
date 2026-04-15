# Write your MySQL query statement below

SELECT DISTINCT
    class
FROM(SELECT 
        class,
        COUNT(*) count
    FROM Courses
    GROUP BY class)t
WHERE count >= 5