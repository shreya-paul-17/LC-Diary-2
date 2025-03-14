# Write your MySQL query statement below
WITH latest_price AS (
    SELECT DISTINCT product_id,
    FIRST_VALUE (new_price) OVER (PARTITION BY product_id ORDER BY change_date DESC) AS latest_price
    FROM products
    WHERE change_date <= '2019-08-16'
)

SELECT DISTINCT product_id,
IFNULL(b.latest_price, 10) AS price
FROM products a
LEFT JOIN latest_price b USING (product_id);