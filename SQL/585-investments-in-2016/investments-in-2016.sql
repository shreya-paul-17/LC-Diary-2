# Write your MySQL query statement below

-- 1. Approach-1
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
    SELECT tiv_2016,
        COUNT(*) OVER(PARTITION BY tiv_2015) AS tiv_2015_count,
        COUNT(*) OVER(PARTITION BY lat, lon) AS city_count
    FROM Insurance
) AS InsuranceWithCounts
WHERE tiv_2015_count > 1
AND city_count = 1;

-- 2. Approach-2
-- SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
-- FROM Insurance
-- WHERE tiv_2015 IN (
--     SELECT tiv_2015
--     FROM Insurance
--     GROUP BY 1
--     HAVING COUNT(*) > 1
-- ) AND CONCAT (lat, lon) IN
-- (
--     SELECT CONCAT (lat, lon)
--     FROM Insurance
--     GROUP BY lat, lon
--     HAVING COUNT(*) = 1
-- );