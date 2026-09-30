-- ============================================================
-- EXPERIMENT 2.1
-- AIM: To insert, retrieve, update and delete records from the
--      Department and Student tables using SQL commands.
-- ============================================================


-- ============================================================
-- 1. INSERT RECORDS
-- ============================================================

-- Insert values into Department
INSERT INTO Department (Dept_ID, Dept_Name, HOD)
VALUES (101, 'Computer Science', 'Dr. Sharma');

INSERT INTO Department (Dept_ID, Dept_Name, HOD)
VALUES (102, 'Information Technology', 'Dr. Verma');

-- Display all department records
SELECT * FROM Department;


-- Insert values into Student
INSERT INTO Student
(Student_ID, Student_Name, Gender, DOB, Email, Phone, Age, Dept_ID)
VALUES
(1, 'Amit Kumar', 'Male',
TO_DATE('2004-05-10', 'YYYY-MM-DD'),
'amit@gmail.com', '9876543210', 20, 101);

INSERT INTO Student
(Student_ID, Student_Name, Gender, DOB, Email, Phone, Age, Dept_ID)
VALUES
(2, 'Neha Singh', 'Female',
TO_DATE('2003-11-15', 'YYYY-MM-DD'),
'neha@gmail.com', '9876543211', 21, 102);


-- ============================================================
-- 2. RETRIEVE RECORDS
-- ============================================================

-- Display all student records
SELECT * FROM Student;

-- Display only Student Name and Email
SELECT Student_Name, Email
FROM Student;

-- Display students from Computer Science Department
SELECT * FROM Student
WHERE Dept_ID = 101;


-- ============================================================
-- 3. UPDATE RECORDS
-- ============================================================

-- Update student's phone number
UPDATE Student
SET Phone = '9999999999'
WHERE Student_ID = 1;

-- Update student's age
UPDATE Student
SET Age = 22
WHERE Student_Name = 'Neha Singh';

-- Display updated student records
SELECT * FROM Student;


-- ============================================================
-- 4. DELETE RECORDS
-- ============================================================

-- Delete a particular student
DELETE FROM Student
WHERE Student_ID = 2;

-- Display remaining students
SELECT * FROM Student;

-- Delete all students
DELETE FROM Student;

-- Display table after deleting all students
SELECT * FROM Student;


-- ============================================================
-- END OF EXPERIMENT 2.1
-- ============================================================