-- ============================================================
-- EXPERIMENT 1.2
-- AIM: To create tables with constraints and keys using
--      SQL commands.
-- ============================================================


-- ============================================================
-- 1. CREATE DEPARTMENT TABLE
-- ============================================================

CREATE TABLE Department (
    Dept_ID NUMBER PRIMARY KEY,
    Dept_Name VARCHAR2(100) NOT NULL UNIQUE,
    HOD VARCHAR2(100) NOT NULL
);


-- ============================================================
-- 2. CREATE STUDENT TABLE
-- ============================================================

CREATE TABLE Student (
    Student_ID NUMBER PRIMARY KEY,
    Student_Name VARCHAR2(100) NOT NULL,
    Gender VARCHAR2(10) NOT NULL,
    DOB DATE NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone VARCHAR2(15) UNIQUE,
    Dept_ID NUMBER NOT NULL,

    CONSTRAINT FK_Student_Department
        FOREIGN KEY (Dept_ID)
        REFERENCES Department(Dept_ID)
);


-- ============================================================
-- 3. CREATE FACULTY TABLE
-- ============================================================

CREATE TABLE Faculty (
    Faculty_ID NUMBER PRIMARY KEY,
    Faculty_Name VARCHAR2(100) NOT NULL,
    Designation VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Dept_ID NUMBER NOT NULL,

    CONSTRAINT FK_Faculty_Department
        FOREIGN KEY (Dept_ID)
        REFERENCES Department(Dept_ID)
);


-- ============================================================
-- 4. CREATE COURSE TABLE
-- ============================================================

CREATE TABLE Course (
    Course_ID NUMBER PRIMARY KEY,
    Course_Name VARCHAR2(100) NOT NULL,
    Credits NUMBER NOT NULL,
    Dept_ID NUMBER NOT NULL,
    Faculty_ID NUMBER NOT NULL,

    CONSTRAINT FK_Course_Department
        FOREIGN KEY (Dept_ID)
        REFERENCES Department(Dept_ID),

    CONSTRAINT FK_Course_Faculty
        FOREIGN KEY (Faculty_ID)
        REFERENCES Faculty(Faculty_ID)
);


-- ============================================================
-- 5. CREATE ENROLLMENT TABLE
-- ============================================================

CREATE TABLE Enrollment (
    Enrollment_ID NUMBER PRIMARY KEY,
    Student_ID NUMBER NOT NULL,
    Course_ID NUMBER NOT NULL,
    Semester NUMBER NOT NULL,
    Academic_Year VARCHAR2(10) NOT NULL,

    CONSTRAINT FK_Enrollment_Student
        FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),

    CONSTRAINT FK_Enrollment_Course
        FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);


-- ============================================================
-- 6. CREATE EXAM TABLE
-- ============================================================

CREATE TABLE Exam (
    Exam_ID NUMBER PRIMARY KEY,
    Course_ID NUMBER NOT NULL,
    Exam_Date DATE NOT NULL,
    Exam_Type VARCHAR2(50) NOT NULL,
    Max_Marks NUMBER NOT NULL,

    CONSTRAINT FK_Exam_Course
        FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);


-- ============================================================
-- 7. CREATE RESULT TABLE
-- ============================================================

CREATE TABLE Result (
    Result_ID NUMBER PRIMARY KEY,
    Student_ID NUMBER NOT NULL,
    Exam_ID NUMBER NOT NULL,
    Marks NUMBER NOT NULL,
    Grade CHAR(2) NOT NULL,

    CONSTRAINT FK_Result_Student
        FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),

    CONSTRAINT FK_Result_Exam
        FOREIGN KEY (Exam_ID)
        REFERENCES Exam(Exam_ID)
);


-- ============================================================
-- 8. CREATE LIBRARY TABLE
-- ============================================================

CREATE TABLE Library (
    Library_ID NUMBER PRIMARY KEY,
    Library_Name VARCHAR2(100) NOT NULL,
    Location VARCHAR2(100) NOT NULL
);


-- ============================================================
-- 9. CREATE BOOK_ISSUE TABLE
-- ============================================================

CREATE TABLE Book_Issue (
    Issue_ID NUMBER PRIMARY KEY,
    Student_ID NUMBER NOT NULL,
    Library_ID NUMBER NOT NULL,
    Book_Name VARCHAR2(100) NOT NULL,
    Issue_Date DATE NOT NULL,
    Return_Date DATE,

    CONSTRAINT FK_BookIssue_Student
        FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),

    CONSTRAINT FK_BookIssue_Library
        FOREIGN KEY (Library_ID)
        REFERENCES Library(Library_ID)
);


-- ============================================================
-- END OF EXPERIMENT 1.2
-- ============================================================