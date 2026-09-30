-- ============================================================
-- EXPERIMENT 4.2
-- AIM: To perform Inner Join, Left Outer Join and Right Outer
--      Join operations on the existing database tables
--      using SQL.
-- ============================================================


-- ============================================================
-- 1. INNER JOIN
-- ============================================================

-- Display students along with their department names
SELECT
    S.Student_ID,
    S.Student_Name,
    D.Dept_Name
FROM Student S
INNER JOIN Department D
    ON S.Dept_ID = D.Dept_ID;


-- ============================================================
-- 2. LEFT OUTER JOIN
-- ============================================================

-- Display all students and their department names
SELECT
    S.Student_ID,
    S.Student_Name,
    D.Dept_Name
FROM Student S
LEFT OUTER JOIN Department D
    ON S.Dept_ID = D.Dept_ID;


-- ============================================================
-- 3. RIGHT OUTER JOIN
-- ============================================================

-- Display all departments and the students belonging to them
SELECT
    S.Student_ID,
    S.Student_Name,
    D.Dept_Name
FROM Student S
RIGHT OUTER JOIN Department D
    ON S.Dept_ID = D.Dept_ID;


-- ============================================================
-- END OF EXPERIMENT 4.2
-- ============================================================