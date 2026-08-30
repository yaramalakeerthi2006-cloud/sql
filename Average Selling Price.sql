SELECT 
    a.product_id,
    ROUND(
        COALESCE(SUM(a.price * b.units) / NULLIF(SUM(b.units), 0), 0),
        2
    ) AS average_price
FROM Prices AS a
LEFT JOIN UnitsSold AS b
    ON a.product_id = b.product_id
    AND b.purchase_date BETWEEN a.start_date AND a.end_date
GROUP BY a.product_id;
