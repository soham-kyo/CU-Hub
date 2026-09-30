-- ============================================================
-- EXPERIMENT 9.1
-- AIM: To implement Triggers, Procedures and Functions
--      using PL/SQL.
-- ============================================================


-- ============================================================
-- 1. TRIGGER
-- ============================================================

-- Create a trigger to automatically display a message
-- whenever a new student is inserted

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER trg_student_insert
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'New student inserted: ' || :NEW.Student_Name
    );
END;
/


-- ------------------------------------------------------------
-- TEST THE TRIGGER
-- ------------------------------------------------------------

-- Insert a new student record to test the trigger

INSERT INTO Student
(Student_ID, Student_Name, Gender, DOB, Email, Phone, Age, Dept_ID)
VALUES
(7, 'Karan Singh', 'Male',
TO_DATE('2004-09-15', 'YYYY-MM-DD'),
'karan@gmail.com', '9876543216', 21, 101);


-- Commit the inserted record
COMMIT;


-- ============================================================
-- 2. PROCEDURE
-- ============================================================

-- Create a procedure to display student details
-- using Student ID

CREATE OR REPLACE PROCEDURE Display_Student
(
    P_Student_ID IN NUMBER
)
IS
    V_Name Student.Student_Name%TYPE;
    V_Email Student.Email%TYPE;
    V_Dept_ID Student.Dept_ID%TYPE;
BEGIN
    SELECT Student_Name, Email, Dept_ID
    INTO V_Name, V_Email, V_Dept_ID
    FROM Student
    WHERE Student_ID = P_Student_ID;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || V_Name);
    DBMS_OUTPUT.PUT_LINE('Email: ' || V_Email);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || V_Dept_ID);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student not found.');
END;
/


-- ------------------------------------------------------------
-- EXECUTE THE PROCEDURE
-- ------------------------------------------------------------

BEGIN
    Display_Student(1);
END;
/


-- ============================================================
-- 3. FUNCTION
-- ============================================================

-- Create a function to return the total number of students

CREATE OR REPLACE FUNCTION Get_Student_Count
RETURN NUMBER
IS
    V_Count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO V_Count
    FROM Student;

    RETURN V_Count;
END;
/


-- ------------------------------------------------------------
-- EXECUTE THE FUNCTION
-- ------------------------------------------------------------

SELECT Get_Student_Count() AS Total_Students
FROM DUAL;


-- ============================================================
-- END OF EXPERIMENT 9.1
-- ============================================================