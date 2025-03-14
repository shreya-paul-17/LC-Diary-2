# Write your MySQL query statement below

-- 1. Using Joins
-- SELECT DISTINCT l1.num AS ConsecutiveNums
-- FROM Logs l1
-- JOIN Logs l2 ON l1.id = l2.id - 1
-- JOIN Logs l3 ON l1.id = l3.id - 2
-- WHERE l1.num = l2.num AND l2.num = l3.num;

-- 2. Using LEAD and LAG
-- SELECT DISTINCT num AS ConsecutiveNums
-- FROM (
--     SELECT 
--     LAG(id) OVER (ORDER BY id) AS prev_id,
--     id,
--     LEAD(id) OVER (ORDER BY id) AS next_id,
--     LAG(num) OVER (ORDER BY id) AS prev_num,
--     num,
--     LEAD(num) OVER (ORDER BY id) AS next_num
--     FROM logs
-- ) subquery
-- WHERE prev_num = num
-- AND num = next_num
-- AND next_id - id = 1
-- AND id - prev_id = 1;

-- 3. Using EXISTS and SUBQUERY
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
WHERE EXISTS (
    SELECT 1
    FROM Logs l2
    WHERE l2.id = l1.id + 1 AND l2.num = l1.num
    AND EXISTS (
        SELECT 1
        FROM Logs l3
        WHERE l3.id = l1.id + 2 AND l3.num = l1.num
    )
);
