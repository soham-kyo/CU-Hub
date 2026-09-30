-- ============================================================
-- EXPERIMENT 5
-- AIM: To perform Full Outer Join and Multi-table Inner Join
--      operations on the existing database tables using SQL.
-- ============================================================


-- ============================================================
-- 1. FULL OUTER JOIN
-- ============================================================

-- Full Outer Join between Student and Department
-- Displays all students and all departments
-- including unmatched records from both tables

SELECT
    S.Student_ID,
    S.Student_Name,
    D.Dept_ID,
    D.Dept_Name,
    D.HOD
FROM Student S
FULL OUTER JOIN Department D
    ON S.Dept_ID = D.Dept_ID;


-- ============================================================
-- 2. MULTI-TABLE INNER JOIN
-- ============================================================

-- Multi-table Inner Join between Student, Department,
-- Enrollment and Course

SELECT
    S.Student_ID,
    S.Student_Name,
    D.Dept_Name,
    C.Course_ID,
    C.Course_Name,
    E.Semester,
    E.Academic_Year
FROM Student S
INNER JOIN Department D
    ON S.Dept_ID = D.Dept_ID
INNER JOIN Enrollment E
    ON S.Student_ID = E.Student_ID
INNER JOIN Course C
    ON E.Course_ID = C.Course_ID;


-- ============================================================
-- 3. MORE DETAILED MULTI-TABLE INNER JOIN
-- ============================================================

SELECT
    S.Student_ID,
    S.Student_Name,
    D.Dept_Name,
    C.Course_Name,
    F.Faculty_Name,
    E.Semester,
    E.Academic_Year
FROM Student S
INNER JOIN Department D
    ON S.Dept_ID = D.Dept_ID
INNER JOIN Enrollment E
    ON S.Student_ID = E.Student_ID
INNER JOIN Course C
    ON E.Course_ID = C.Course_ID
INNER JOIN Faculty F
    ON C.Faculty_ID = F.Faculty_ID;


-- ============================================================
-- END OF EXPERIMENT 5
-- ============================================================