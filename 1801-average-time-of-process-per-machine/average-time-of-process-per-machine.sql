# Write your MySQL query statement below
SELECT
    t.machine_id,
    ROUND(AVG(t.time),3) processing_time
FROM(
    SELECT DISTINCT
        machine_id, process_id,
        SUM(CASE 
            WHEN activity_type = 'start' THEN timestamp * -1
            ELSE timestamp
        END) OVER(PARTITION BY machine_id, process_id) time
    FROM Activity
    ) t
GROUP BY machine_id


