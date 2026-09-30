-- ============================================================
-- EXPERIMENT 3.2
-- AIM: To perform Union, Intersection, Difference and
--      Aggregation with GROUP BY operations on the existing
--      database tables using SQL.
-- ============================================================


-- ============================================================
-- 1. UNION
-- ============================================================

-- Display all department IDs from Student and Faculty tables
SELECT Dept_ID
FROM Student
UNION
SELECT Dept_ID
FROM Faculty;


-- ============================================================
-- 2. INTERSECTION
-- ============================================================

-- Display department IDs common to Student and Faculty tables
SELECT Dept_ID
FROM Student
INTERSECT
SELECT Dept_ID
FROM Faculty;


-- ============================================================
-- 3. DIFFERENCE
-- ============================================================

-- Display department IDs present in Student but not in Faculty
SELECT Dept_ID
FROM Student
MINUS
SELECT Dept_ID
FROM Faculty;


-- ============================================================
-- 4. AGGREGATION WITH GROUP BY
-- ============================================================

-- Count the number of students in each department
SELECT Dept_ID, COUNT(*) AS Total_Students
FROM Student
GROUP BY Dept_ID;


-- Find average age of students in each department
SELECT Dept_ID, AVG(Age) AS Average_Age
FROM Student
GROUP BY Dept_ID;


-- Find maximum and minimum age in each department
SELECT
    Dept_ID,
    MAX(Age) AS Maximum_Age,
    MIN(Age) AS Minimum_Age
FROM Student
GROUP BY Dept_ID;


-- ============================================================
-- END OF EXPERIMENT 3.2
-- ============================================================