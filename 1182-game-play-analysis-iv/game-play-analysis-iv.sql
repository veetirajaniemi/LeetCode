# Write your MySQL query statement below

SELECT 
    ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) fraction
FROM(SELECT 
        RANK() OVER(PARTITION BY player_id ORDER BY event_date) rankP,
        DATEDIFF(event_date, LAG(event_date) OVER(PARTITION BY player_id ORDER BY event_date)) daydiff
    FROM Activity)t 
WHERE rankP = 2 AND daydiff = 1

