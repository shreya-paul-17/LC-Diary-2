# Write your MySQL query statement below

-- Approach 1: Using aggregated value functions
SELECT DISTINCT MAX(salary) AS SecondHighestSalary
FROM Employee a
WHERE Salary < (SELECT MAX(salary) FROM Employee b WHERE b.salary > a.salary);

-- Approach 3: Using Order By value
-- SELECT IFNULL((SELECT DISTINCT Salary
-- FROM Employee
-- ORDER BY Salary DESC
-- LIMIT 1,1), NULL) AS SecondHighestSalary;

-- Approach 4:
-- SELECT MAX(a.Salary) AS SecondHighestSalary
-- FROM Employee a
-- JOIN Employee b
-- ON a.Salary < b.Salary;

