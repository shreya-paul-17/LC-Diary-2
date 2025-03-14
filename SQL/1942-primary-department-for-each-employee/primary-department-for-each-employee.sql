# Write your MySQL query statement below
SELECT DISTINCT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y' OR
    employee_id IN
    (
        SELECT employee_id
        FROM Employee
        GROUP BY Employee_id
        HAVING COUNT(employee_id) = 1
    );