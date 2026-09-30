-- ============================================================
-- EXPERIMENT 2.2
-- AIM: To perform Selection, Projection and Natural Join
--      operations on the existing database tables using SQL.
-- ============================================================


-- ============================================================
-- 1. SELECTION
-- ============================================================

-- Display students from Computer Science Department
SELECT *
FROM Student
WHERE Dept_ID = 101;


-- Display students whose age is greater than 20
SELECT *
FROM Student
WHERE Age > 20;


-- ============================================================
-- 2. PROJECTION
-- ============================================================

-- Display only Student Name and Email
SELECT Student_Name, Email
FROM Student;


-- Display Student ID, Student Name and Department ID
SELECT Student_ID, Student_Name, Dept_ID
FROM Student;


-- ============================================================
-- 3. NATURAL JOIN
-- ============================================================

-- Join Student and Department using common Dept_ID
SELECT *
FROM Student
NATURAL JOIN Department;


-- Display selected columns from Natural Join
SELECT Student_ID, Student_Name, Dept_Name, HOD
FROM Student
NATURAL JOIN Department;


-- ============================================================
-- END OF EXPERIMENT 2.2
-- ============================================================