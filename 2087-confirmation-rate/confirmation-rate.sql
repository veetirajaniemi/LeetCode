# Write your MySQL query statement below
SELECT 
    t2.user_id,
    CASE
        WHEN t2.countAll = 0 THEN 0
        ELSE ROUND(t2.countConf / t2.countAll, 2)
    END confirmation_rate 
FROM 
    (SELECT
        si.user_id,
        COALESCE(t.countAll, 0) countAll,
        COALESCE(t.countConf, 0) countConf
    FROM Signups as si
    LEFT JOIN
        (SELECT DISTINCT
            a.user_id,
            COUNT(*) OVER(PARTITION BY user_id) countAll,
            COALESCE(c.countConf, 0) countConf
        FROM Confirmations AS a
        LEFT JOIN
            (SELECT DISTINCT
                user_id,
                COUNT(*) OVER(PARTITION BY user_id) countConf
            FROM Confirmations
            WHERE action = 'confirmed') AS c
        ON c.user_id = a.user_id) AS t
    ON si.user_id = t.user_id) AS t2

