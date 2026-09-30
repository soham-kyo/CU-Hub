-- ============================================================
-- EXPERIMENT 4.1
-- AIM: To perform complex queries using nested subqueries and
--      aggregate functions on the existing database tables
--      using SQL.
-- ============================================================


-- ============================================================
-- 1. NESTED SUBQUERY
-- ============================================================

-- Display students who belong to the Computer Science department
SELECT Student_ID, Student_Name
FROM Student
WHERE Dept_ID = (
    SELECT Dept_ID
    FROM Department
    WHERE Dept_Name = 'Computer Science'
);


-- ============================================================
-- 2. NESTED SUBQUERY WITH AGGREGATE FUNCTION
-- ============================================================

-- Display students whose age is greater than the average age
SELECT Student_ID, Student_Name, Age
FROM Student
WHERE Age > (
    SELECT AVG(Age)
    FROM Student
);


-- ============================================================
-- 3. AGGREGATE FUNCTION WITH GROUP BY
-- ============================================================

-- Display the number of students in each department
SELECT Dept_ID, COUNT(*) AS Total_Students
FROM Student
GROUP BY Dept_ID;


-- ============================================================
-- 4. NESTED SUBQUERY WITH MAX
-- ============================================================

-- Display the student(s) having the maximum age
SELECT Student_ID, Student_Name, Age
FROM Student
WHERE Age = (
    SELECT MAX(Age)
    FROM Student
);


-- ============================================================
-- 5. NESTED SUBQUERY WITH MIN
-- ============================================================

-- Display the student(s) having the minimum age
SELECT Student_ID, Student_Name, Age
FROM Student
WHERE Age = (
    SELECT MIN(Age)
    FROM Student
);


-- ============================================================
-- 6. NESTED SUBQUERY WITH DEPARTMENT
-- ============================================================

-- Display departments having more students than the average
-- number of students per department
SELECT Dept_ID, COUNT(*) AS Total_Students
FROM Student
GROUP BY Dept_ID
HAVING COUNT(*) > (
    SELECT AVG(Student_Count)
    FROM (
        SELECT COUNT(*) AS Student_Count
        FROM Student
        GROUP BY Dept_ID
    )
);


-- ============================================================
-- END OF EXPERIMENT 4.1
-- ============================================================