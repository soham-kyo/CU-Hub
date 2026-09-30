-- ============================================================
-- EXPERIMENT 8
-- AIM: To implement IF-ELSE, LOOP and CURSOR statements
--      using PL/SQL.
-- ============================================================


-- ============================================================
-- 1. IF-ELSE
-- ============================================================

-- Check whether the number of students is greater than 5

SET SERVEROUTPUT ON;

DECLARE
    Total_Students NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO Total_Students
    FROM Student;

    IF Total_Students > 5 THEN
        DBMS_OUTPUT.PUT_LINE(
            'More than 5 students are present.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            '5 or fewer students are present.'
        );
    END IF;
END;
/


-- ============================================================
-- 2. LOOP
-- ============================================================

-- Display student numbers from 1 to 5 using a LOOP

SET SERVEROUTPUT ON;

DECLARE
    Counter NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Student Number: ' || Counter
        );

        Counter := Counter + 1;

        EXIT WHEN Counter > 5;
    END LOOP;
END;
/


-- ============================================================
-- 3. CURSOR
-- ============================================================

-- Create a cursor to retrieve student details
-- one row at a time

SET SERVEROUTPUT ON;

DECLARE
    CURSOR Student_Cursor IS
        SELECT Student_ID, Student_Name, Dept_ID
        FROM Student;

    V_Student_ID Student.Student_ID%TYPE;
    V_Student_Name Student.Student_Name%TYPE;
    V_Dept_ID Student.Dept_ID%TYPE;

BEGIN
    OPEN Student_Cursor;

    LOOP
        FETCH Student_Cursor
        INTO V_Student_ID, V_Student_Name, V_Dept_ID;

        EXIT WHEN Student_Cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || V_Student_ID ||
            ' | Name: ' || V_Student_Name ||
            ' | Department ID: ' || V_Dept_ID
        );
    END LOOP;

    CLOSE Student_Cursor;
END;
/


-- ============================================================
-- END OF EXPERIMENT 8
-- ============================================================