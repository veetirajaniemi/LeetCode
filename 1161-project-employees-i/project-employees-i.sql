# Write your MySQL query statement below
SELECT DISTINCT
    p.project_id,
    ROUND(AVG(e.experience_years) OVER(PARTITION BY p.project_id), 2) average_years
FROM Project AS p
LEFT JOIN Employee AS e
ON p.employee_id = e.employee_id