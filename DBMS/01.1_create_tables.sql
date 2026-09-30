-- ============================================================
-- EXPERIMENT 1.1
-- AIM: To create tables for the College Management System
--      using SQL commands.
-- ============================================================


-- ============================================================
-- 1. CREATE DEPARTMENT TABLE
-- ============================================================

CREATE TABLE Department (
    Dept_ID NUMBER,
    Dept_Name VARCHAR2(100),
    HOD VARCHAR2(100)
);


-- ============================================================
-- 2. CREATE STUDENT TABLE
-- ============================================================

CREATE TABLE Student (
    Student_ID NUMBER,
    Student_Name VARCHAR2(100),
    Gender VARCHAR2(10),
    DOB DATE,
    Email VARCHAR2(100),
    Phone VARCHAR2(15),
    Dept_ID NUMBER
);


-- ============================================================
-- 3. CREATE FACULTY TABLE
-- ============================================================

CREATE TABLE Faculty (
    Faculty_ID NUMBER,
    Faculty_Name VARCHAR2(100),
    Designation VARCHAR2(50),
    Email VARCHAR2(100),
    Dept_ID NUMBER
);


-- ============================================================
-- 4. CREATE COURSE TABLE
-- ============================================================

CREATE TABLE Course (
    Course_ID NUMBER,
    Course_Name VARCHAR2(100),
    Credits NUMBER,
    Dept_ID NUMBER,
    Faculty_ID NUMBER
);


-- ============================================================
-- 5. CREATE ENROLLMENT TABLE
-- ============================================================

CREATE TABLE Enrollment (
    Enrollment_ID NUMBER,
    Student_ID NUMBER,
    Course_ID NUMBER,
    Semester NUMBER,
    Academic_Year VARCHAR2(10)
);


-- ============================================================
-- 6. CREATE EXAM TABLE
-- ============================================================

CREATE TABLE Exam (
    Exam_ID NUMBER,
    Course_ID NUMBER,
    Exam_Date DATE,
    Exam_Type VARCHAR2(50),
    Max_Marks NUMBER
);


-- ============================================================
-- 7. CREATE RESULT TABLE
-- ============================================================

CREATE TABLE Result (
    Result_ID NUMBER,
    Student_ID NUMBER,
    Exam_ID NUMBER,
    Marks NUMBER,
    Grade CHAR(2)
);


-- ============================================================
-- 8. CREATE LIBRARY TABLE
-- ============================================================

CREATE TABLE Library (
    Library_ID NUMBER,
    Library_Name VARCHAR2(100),
    Location VARCHAR2(100)
);


-- ============================================================
-- 9. CREATE BOOK_ISSUE TABLE
-- ============================================================

CREATE TABLE Book_Issue (
    Issue_ID NUMBER,
    Student_ID NUMBER,
    Library_ID NUMBER,
    Book_Name VARCHAR2(100),
    Issue_Date DATE,
    Return_Date DATE
);


-- ============================================================
-- END OF EXPERIMENT 1.1
-- ============================================================