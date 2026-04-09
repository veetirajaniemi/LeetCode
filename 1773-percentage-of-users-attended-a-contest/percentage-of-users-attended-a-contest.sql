# Write your MySQL query statement below
SELECT DISTINCT
    contest_id,
    ROUND(COUNT(user_id) OVER(PARTITION BY contest_id) / (
        SELECT 
            COUNT(*)
        FROM Users
    ) * 100, 2) percentage
FROM Register
ORDER BY percentage DESC, contest_id 