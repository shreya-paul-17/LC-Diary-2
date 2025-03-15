# Write your MySQL query statement below

-- Approach 1: Using aggregated value functions
SELECT DISTINCT MAX(salary) AS SecondHighestSalary
FROM Employee a
WHERE Salary < (SELECT MAX(salary) FROM Employee b WHERE b.salary > a.salary);