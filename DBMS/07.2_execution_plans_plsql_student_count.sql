-- ============================================================
-- EXPERIMENT 7.2
-- AIM: To perform Query Performance Analysis, execute PL/SQL
--      blocks, and determine the Student Count using SQL
--      and PL/SQL.
-- ============================================================


-- ============================================================
-- 1. QUERY PERFORMANCE ANALYSIS
-- ============================================================

-- Generate the execution plan for the query
EXPLAIN PLAN FOR
SELECT *
FROM Student
WHERE Student_Name = 'Amit Kumar';


-- Display the execution plan
SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);


-- ============================================================
-- 2. PL/SQL BLOCK
-- ============================================================

-- Execute a simple PL/SQL block
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('College Management System');
    DBMS_OUTPUT.PUT_LINE('PL/SQL Block Executed Successfully');
END;
/


-- ============================================================
-- 3. STUDENT COUNT
-- ============================================================

-- Display the total number of students
SELECT COUNT(*) AS Student_Count
FROM Student;


-- ============================================================
-- 4. STUDENT COUNT USING PL/SQL
-- ============================================================

-- Calculate and display the total number of students
-- using a PL/SQL block

SET SERVEROUTPUT ON;

DECLARE
    Total_Students NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO Total_Students
    FROM Student;

    DBMS_OUTPUT.PUT_LINE(
        'Total Number of Students: ' || Total_Students
    );
END;
/


-- ============================================================
-- 5. STUDENT COUNT DEPARTMENT-WISE
-- ============================================================

-- Display the number of students in each department
SELECT
    D.Dept_Name,
    COUNT(S.Student_ID) AS Student_Count
FROM Department D
LEFT JOIN Student S
    ON D.Dept_ID = S.Dept_ID
GROUP BY D.Dept_Name;


-- ============================================================
-- END OF EXPERIMENT 7.2
-- ============================================================