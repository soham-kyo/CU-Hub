-- ============================================================
-- EXPERIMENT 10
-- AIM: To analyze Execution Plans, compare Index Performance,
--      and study the ACID properties of database transactions
--      using Oracle SQL.
-- ============================================================


-- ============================================================
-- 1. EXECUTION PLAN
-- ============================================================

-- Generate execution plan for a query
EXPLAIN PLAN FOR
SELECT *
FROM Student
WHERE Student_Name = 'Amit Kumar';


-- Display execution plan
SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);


-- ============================================================
-- 2. INDEX PERFORMANCE COMPARISON
-- ============================================================


-- ------------------------------------------------------------
-- 2.1 QUERY WITHOUT INDEX
-- ------------------------------------------------------------

-- Drop the index temporarily if it exists
DROP INDEX IDX_Student_Name;


-- Generate execution plan without index
EXPLAIN PLAN FOR
SELECT *
FROM Student
WHERE Student_Name = 'Amit Kumar';


-- Display execution plan
SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);


-- ------------------------------------------------------------
-- 2.2 CREATE INDEX
-- ------------------------------------------------------------

-- Create index on Student_Name
CREATE INDEX IDX_Student_Name
ON Student(Student_Name);


-- ------------------------------------------------------------
-- 2.3 QUERY WITH INDEX
-- ------------------------------------------------------------

-- Generate execution plan with index
EXPLAIN PLAN FOR
SELECT *
FROM Student
WHERE Student_Name = 'Amit Kumar';


-- Display execution plan
SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);


-- The two execution plans can be compared to observe how
-- Oracle accesses the data with and without the index.


-- ============================================================
-- 3. ACID PROPERTIES
-- ============================================================


-- ------------------------------------------------------------
-- 3.1 ATOMICITY
-- ------------------------------------------------------------

-- Set a savepoint before performing the transaction
SAVEPOINT Transaction_Start;


-- Update student's phone number
UPDATE Student
SET Phone = '9999999999'
WHERE Student_ID = 1;


-- Rollback the update to the savepoint
ROLLBACK TO Transaction_Start;


-- The update is rolled back, demonstrating that a transaction
-- is treated as a unit.


-- ------------------------------------------------------------
-- 3.2 CONSISTENCY
-- ------------------------------------------------------------

-- Insert a new student record
INSERT INTO Student
(Student_ID, Student_Name, Gender, DOB, Email, Phone, Age, Dept_ID)
VALUES
(9, 'Test Student', 'Male',
TO_DATE('2004-01-01', 'YYYY-MM-DD'),
'test@gmail.com', '9000000000', 22, 101);


-- Commit the transaction
COMMIT;


-- The inserted record satisfies the table's defined
-- constraints, maintaining database consistency.


-- ------------------------------------------------------------
-- 3.3 ISOLATION
-- ------------------------------------------------------------

-- Set transaction isolation level to SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;


-- This ensures that the transaction operates in an isolated
-- manner from other concurrent transactions.


-- ------------------------------------------------------------
-- 3.4 DURABILITY
-- ------------------------------------------------------------

-- Update student's phone number
UPDATE Student
SET Phone = '8888888888'
WHERE Student_ID = 9;


-- Commit the transaction
COMMIT;


-- After COMMIT, the change is permanently saved.


-- Verify the updated record
SELECT Student_ID, Student_Name, Phone
FROM Student
WHERE Student_ID = 9;


-- ============================================================
-- END OF EXPERIMENT 10
-- ============================================================