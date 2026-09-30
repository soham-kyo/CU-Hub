-- ============================================================
-- EXPERIMENT 3.1
-- AIM: To perform Rename, Self-Join and Division operations
--      on the existing database tables using SQL.
-- ============================================================


-- ============================================================
-- 1. RENAME
-- ============================================================

-- Rename table using an alias
SELECT S.Student_ID, S.Student_Name
FROM Student S;


-- Rename column using an alias
SELECT Student_Name AS Name
FROM Student;


-- ============================================================
-- 2. SELF-JOIN
-- ============================================================

-- Find students belonging to the same department
SELECT
    S1.Student_Name AS Student1,
    S2.Student_Name AS Student2,
    S1.Dept_ID
FROM Student S1
JOIN Student S2
    ON S1.Dept_ID = S2.Dept_ID
WHERE S1.Student_ID < S2.Student_ID;


-- ============================================================
-- 3. DIVISION
-- ============================================================

-- Find students who have enrolled in all courses
SELECT S.Student_ID, S.Student_Name
FROM Student S
WHERE NOT EXISTS
(
    SELECT C.Course_ID
    FROM Course C
    WHERE NOT EXISTS
    (
        SELECT E.Course_ID
        FROM Enrollment E
        WHERE E.Student_ID = S.Student_ID
        AND E.Course_ID = C.Course_ID
    )
);


-- ============================================================
-- END OF EXPERIMENT 3.1
-- ============================================================