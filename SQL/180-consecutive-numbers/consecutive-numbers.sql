# Write your MySQL query statement below

-- 1. Using Joins
-- SELECT DISTINCT l1.num AS ConsecutiveNums
-- FROM Logs l1
-- JOIN Logs l2 ON l1.id = l2.id - 1
-- JOIN Logs l3 ON l1.id = l3.id - 2
-- WHERE l1.num = l2.num AND l2.num = l3.num;

-- 2. Using LEAD and LAG
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
    LAG(id) OVER (ORDER BY id) AS prev_id,
    id,
    LEAD(id) OVER (ORDER BY id) AS next_id,
    LAG(num) OVER (ORDER BY id) AS prev_num,
    num,
    LEAD(num) OVER (ORDER BY id) AS next_num
    FROM logs
) subquery
WHERE prev_num = num
AND num = next_num
AND next_id - id = 1
AND id - prev_id = 1;