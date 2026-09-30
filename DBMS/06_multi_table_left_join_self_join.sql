-- ============================================================
-- EXPERIMENT 6
-- AIM: To perform Multi-table Left Join and Self Join
--      operations on the existing database tables using SQL.
-- ============================================================


-- ============================================================
-- 1. MULTI-TABLE LEFT JOIN
-- ============================================================

-- Multi-table Left Join between Student,
-- Department, Enrollment and Course

SELECT
    S.Student_ID,
    S.Student_Name,
    D.Dept_Name,
    E.Semester,
    E.Academic_Year,
    C.Course_Name
FROM Student S
LEFT JOIN Department D
    ON S.Dept_ID = D.Dept_ID
LEFT JOIN Enrollment E
    ON S.Student_ID = E.Student_ID
LEFT JOIN Course C
    ON E.Course_ID = C.Course_ID;


-- ============================================================
-- 2. SELF JOIN
-- ============================================================

-- Self Join on Student table
-- Find pairs of students belonging to the same department

SELECT
    S1.Student_Name AS Student_1,
    S2.Student_Name AS Student_2,
    D.Dept_Name
FROM Student S1
INNER JOIN Student S2
    ON S1.Dept_ID = S2.Dept_ID
    AND S1.Student_ID < S2.Student_ID
INNER JOIN Department D
    ON S1.Dept_ID = D.Dept_ID;


-- ============================================================
-- END OF EXPERIMENT 6
-- ============================================================