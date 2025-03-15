# Write your MySQL query statement below

-- Approach-1 Using Subqueries
-- SELECT
--     d.name AS Department,
--     e.name AS Employee,
--     e.salary AS Salary
-- FROM Employee e
-- JOIN Department d ON e.departmentId = d.id
-- WHERE (
--     SELECT COUNT(DISTINCT salary)
--     FROM Employee e2
--     WHERE e2.departmentId = e.departmentId AND e2.salary >= e.salary
-- ) <= 3
-- ORDER BY Department, Salary DESC;

-- Approach-2 Using Windows dense function
SELECT Department, Employee, Salary
FROM (
    SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary,
    DENSE_RANK() OVER (PARTITION BY d.name ORDER BY Salary DESC) AS rnk
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
) AS rnk_tbl
WHERE rnk <= 3;
