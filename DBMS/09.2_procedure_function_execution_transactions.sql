-- ============================================================
-- EXPERIMENT 9.2
-- AIM: To perform Procedure Execution, Function Execution,
--      COMMIT, ROLLBACK and SAVEPOINT operations using
--      SQL and PL/SQL.
-- ============================================================


-- ============================================================
-- 1. PROCEDURE EXECUTION
-- ============================================================

-- Execute the Display_Student procedure created in
-- Experiment 9.1

SET SERVEROUTPUT ON;

BEGIN
    Display_Student(1);
END;
/


-- ============================================================
-- 2. FUNCTION EXECUTION
-- ============================================================

-- Execute the Get_Student_Count function created in
-- Experiment 9.1

SELECT Get_Student_Count() AS Total_Students
FROM DUAL;


-- ============================================================
-- 3. COMMIT
-- ============================================================

-- Insert a new student record
INSERT INTO Student
(Student_ID, Student_Name, Gender, DOB, Email, Phone, Age, Dept_ID)
VALUES
(8, 'Riya Sharma', 'Female',
TO_DATE('2005-03-20', 'YYYY-MM-DD'),
'riya@gmail.com', '9876543217', 21, 102);


-- Permanently save the changes
COMMIT;


-- Verify the inserted record
SELECT *
FROM Student
WHERE Student_ID = 8;


-- ============================================================
-- 4. ROLLBACK
-- ============================================================

-- Update student's phone number
UPDATE Student
SET Phone = '8888888888'
WHERE Student_ID = 8;


-- Cancel the uncommitted update
ROLLBACK;


-- Verify the student's phone number
SELECT Student_ID, Student_Name, Phone
FROM Student
WHERE Student_ID = 8;


-- The phone number returns to its previous value because
-- the update was rolled back.


-- ============================================================
-- 5. SAVEPOINT
-- ============================================================

-- Create a savepoint within the transaction
SAVEPOINT Student_Update;


-- Update student's phone number
UPDATE Student
SET Phone = '7777777777'
WHERE Student_ID = 8;


-- Rollback only the changes made after the savepoint
ROLLBACK TO Student_Update;


-- Verify the student's phone number
SELECT Student_ID, Student_Name, Phone
FROM Student
WHERE Student_ID = 8;


-- The update after the savepoint is cancelled.


-- Finally commit the transaction
COMMIT;


-- ============================================================
-- END OF EXPERIMENT 9.2
-- ============================================================