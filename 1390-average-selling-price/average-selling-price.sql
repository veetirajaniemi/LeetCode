# Write your MySQL query statement below

SELECT 
    t.product_id,
    IFNULL(ROUND(SUM(t.totalAmountSold) / SUM(t.unitsSold), 2), 0) average_price
FROM(SELECT 
        p.product_id,
        p.price * u.units totalAmountSold,
        u.units unitsSold
    FROM Prices AS p
    LEFT JOIN UnitsSold AS u
    ON p.product_id = u.product_id
    AND p.start_date <= u.purchase_date AND u.purchase_date <= p.end_date
)t GROUP BY t.product_id