# Write your MySQL query statement below
SELECT
    activity_date day,
    COUNT(DISTINCT user_id) active_users
FROM Activity
WHERE DATEDIFF('2019-07-27', activity_date) < 30 AND activity_date <= '2019-07-27' 
GROUP BY activity_date
