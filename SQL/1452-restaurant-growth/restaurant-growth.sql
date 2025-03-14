# Write your MySQL query statement below

-- 1. Approach - 1
-- SELECT
--     visited_on,
--     (
--         SELECT SUM(amount)
--         FROM customer
--         WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
--     ) AS amount,
--     ROUND(
--         (
--             SELECT SUM(amount) / 7
--             FROM customer
--             WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
--         ),
--         2
--     ) AS average_amount
-- FROM customer c
-- WHERE visited_on >= (
--         SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
--         FROM customer
--     )
-- GROUP BY visited_on;

-- 2. Approach - 2 -> Using Window function, Frame
SELECT DISTINCT visited_on,
        sum(amount) OVER w AS amount,
        round((sum(amount) OVER w)/7, 2) AS average_amount
    FROM customer
    WINDOW w AS ( 
            ORDER BY visited_on
            RANGE BETWEEN interval 6 day PRECEDING AND current ROW
    )
    LIMIT 6, 999
