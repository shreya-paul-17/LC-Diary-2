# Write your MySQL query statement below
SELECT product_id, YEAR AS first_year, quantity, price
FROM Sales
WHERE (product_id, YEAR) IN (
    SELECT product_id,
    MIN(YEAR) AS YEAR
    FROM Sales
    GROUP BY product_id
);