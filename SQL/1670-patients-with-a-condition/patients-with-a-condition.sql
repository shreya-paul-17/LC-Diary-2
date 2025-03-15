# Write your MySQL query statement below

-- Approach 1: RegEx
-- SELECT * FROM patients WHERE conditions REGEXP '\\bDIAB1';

-- Approach 2: Basic
SELECT patient_id, patient_name, conditions
FROM patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';

-- Approach 3: Using LOCATE function
-- SELECT * 
-- FROM patients
-- WHERE LOCATE('DIAB1', conditions) = 1
-- OR LOCATE(' DIAB1', conditions) != 0;