-- ============================================================
-- EXPERIMENT 7.1
-- AIM: To create and use Views, Sequences and Indexes
--      on the existing database tables using SQL.
-- ============================================================


-- ============================================================
-- 1. VIEW
-- ============================================================

-- Create a view to display student details
-- along with their department name

CREATE VIEW Student_Department_View AS
SELECT
    S.Student_ID,
    S.Student_Name,
    S.Gender,
    S.Email,
    D.Dept_Name
FROM Student S
INNER JOIN Department D
    ON S.Dept_ID = D.Dept_ID;


-- ============================================================
-- 2. DISPLAY THE VIEW
-- ============================================================

SELECT *
FROM Student_Department_View;


-- ============================================================
-- 3. SEQUENCE
-- ============================================================

-- Create a sequence for generating Issue_ID values

CREATE SEQUENCE Issue_Sequence
START WITH 806
INCREMENT BY 1
NOCACHE
NOCYCLE;


-- ============================================================
-- 4. USE THE SEQUENCE
-- ============================================================

SELECT Issue_Sequence.NEXTVAL
FROM DUAL;


-- ============================================================
-- 5. CHECK THE NEXT VALUE
-- ============================================================

SELECT Issue_Sequence.NEXTVAL
FROM DUAL;


-- ============================================================
-- 6. INDEX
-- ============================================================

-- Create an index on Student_Name
-- to improve searching performance

CREATE INDEX IDX_Student_Name
ON Student(Student_Name);


-- ============================================================
-- 7. VERIFY THE INDEX
-- ============================================================

SELECT
    INDEX_NAME,
    TABLE_NAME,
    COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE INDEX_NAME = 'IDX_STUDENT_NAME';


-- ============================================================
-- END OF EXPERIMENT 7.1
-- ============================================================