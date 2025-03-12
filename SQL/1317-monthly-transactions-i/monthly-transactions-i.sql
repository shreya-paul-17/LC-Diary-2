# Write your MySQL query statement below
SELECT SUBSTRING(trans_date, 1, 7) AS MONTH,
country,
COUNT(state) AS trans_count,
SUM(state = 'approved') AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY MONTH, country;