# Write your MySQL query statement below
SELECT
    name
FROM Employee
WHERE 
id IN (SELECT
    managerId
    FROM(SELECT
            id,
            name, 
            managerId,
            COUNT(managerId) reportCount
        FROM Employee
        WHERE managerID IS NOT NULL
        GROUP BY managerId) t
    WHERE reportCount >= 5)