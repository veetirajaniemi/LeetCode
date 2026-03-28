# Write your MySQL query statement below
SELECT
    w.id as Id
FROM
    (SELECT
        id,
        recordDate,
        temperature,
        LAG(temperature) OVER(ORDER BY recordDate) AS prevTemp,
        DATEDIFF(recordDate, LAG(recordDate) OVER(ORDER BY recordDate)) AS dateDiff
    FROM Weather)
AS w
WHERE w.temperature > w.prevTemp AND w.dateDiff = 1    

