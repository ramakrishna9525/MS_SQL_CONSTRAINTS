-- CONCEPT: DDL
-- COMMAND: CREATE DATABASE
-- PURPOSE: Creates a new database named NEW_P

CREATE DATABASE NEW_P;



-- CONCEPT: DDL + CONSTRAINTS
-- PURPOSE: Creates STUDENT table with PRIMARY KEY,
-- UNIQUE, CHECK and DEFAULT constraints.

CREATE TABLE STUDENT
(
    S_ID INT PRIMARY KEY,
    S_NAME VARCHAR(100) UNIQUE,
    AGE INT CHECK(AGE >= 20),
    EMAIL VARCHAR(100) UNIQUE,
    CITY VARCHAR(100) DEFAULT 'HYDERABAD'
);


Constraints used:
Constraint	Purpose
PRIMARY KEY	Uniquely identifies each record
UNIQUE	Does not allow duplicate values
CHECK	Restricts values based on a condition
DEFAULT	Inserts a predefined value when omitted

-- CONCEPT: DML
-- COMMAND: INSERT
-- PURPOSE: Inserts five student records into STUDENT.

INSERT INTO STUDENT
VALUES
(101, 'Ramesh', 20, 'ram@gmail.com', 'Hyderabad'),
(102, 'Raj', 21, 'raj@gmail.com', 'Chennai'),
(103, 'Kiran', 22, 'kiran@gmail.com', 'Mumbai'),
(104, 'Suresh', 23, 'suresh@gmail.com', 'Delhi'),
(105, 'Vamshi', 24, 'vamshi@gmail.com', 'hYDERABAD');


-- CONCEPT: DQL
-- COMMAND: SELECT
-- PURPOSE: Retrieves all columns and records from STUDENT.

SELECT * FROM STUDENT;


-- CONCEPT: DML
-- COMMAND: INSERT WITH COLUMN LIST
-- PURPOSE: Inserts a record without specifying CITY.
-- RESULT: DEFAULT constraint supplies HYDERABAD.

INSERT INTO STUDENT
(S_ID, S_NAME, AGE, EMAIL)
VALUES
(106, 'Ajay', 20, 'ajay@gmail.com');


-- CONCEPT: DDL + CONSTRAINTS
-- PURPOSE: Creates ECOMMERCE table with five constraints.

CREATE TABLE ECOMMERCE
(
    E_ID INT PRIMARY KEY,
    E_NAME VARCHAR(100) UNIQUE,
    REGION VARCHAR(100) DEFAULT 'ANAND_NAGAR_COLONY',
    AGE INT CHECK(AGE >= 35),
    EMAIL VARCHAR(100) UNIQUE
);



-- CONCEPT: DML
-- COMMAND: INSERT WITH DEFAULT
-- PURPOSE: Uses DEFAULT keyword to insert the predefined REGION.

INSERT INTO ECOMMERCE
VALUES
(101, 'Ramesh', 'Hyderabad', 35, 'ramesh@gmail.com'),
(102, 'Suresh', DEFAULT, 40, 'suresh@gmail.com'),
(103, 'Kiran', 'Mumbai', 38, 'kiran@gmail.com'),
(104, 'Ajay', 'Delhi', 45, 'ajay@gmail.com'),
(105, 'Vamshi', 'Bangalore', 50, 'vamshi@gmail.com');


-- CONCEPT: DQL
-- COMMAND: SELECT
-- PURPOSE: Displays all records from ECOMMERCE.

SELECT * FROM ECOMMERCE;

-- CONCEPT: DDL + CONSTRAINTS
-- PURPOSE: Creates department table using NOT NULL,
-- PRIMARY KEY, DEFAULT and CHECK constraints.

CREATE TABLE DEPARTMENT
(
    D_ID INT PRIMARY KEY,
    D_NAME VARCHAR(50) NOT NULL,
    HOD_NAME VARCHAR(50) NOT NULL,
    LOCATION VARCHAR(50) DEFAULT 'Hyderabad',
    CAPACITY INT CHECK(CAPACITY >= 30)
);


-- CONCEPT: DML
-- COMMAND: INSERT
-- PURPOSE: Inserts five department records.

INSERT INTO DEPARTMENT
(D_ID, D_NAME, HOD_NAME, LOCATION, CAPACITY)
VALUES
(1, 'CSE', 'Raghu', 'Hyderabad', 120),
(2, 'ECE', 'Srinivas', 'Chennai', 100),
(3, 'EEE', 'Kumar', 'Mumbai', 80),
(4, 'CIVIL', 'Prasad', 'Delhi', 60),
(5, 'MECH', 'Ramesh', 'Bangalore', 90);


-- CONCEPT: DQL
-- PURPOSE: Displays all department records.

SELECT * FROM DEPARTMENT;


-- CONCEPT: DDL + CONSTRAINTS
-- PURPOSE: Creates STUDENT3 table.
-- PRIMARY KEY: S_ID
-- UNIQUE: S_NAME, CITY
-- CHECK: AGE >= 25
-- CHECK: MARKS >= 99

CREATE TABLE STUDENT3
(
    S_ID INT PRIMARY KEY,
    S_NAME VARCHAR(100) UNIQUE,
    AGE INT CHECK(AGE >= 25),
    GENDER VARCHAR(100),
    CITY VARCHAR(100) UNIQUE,
    MARKS INT CHECK(MARKS >= 99),
    FEE INT-- CONCEPT: DQL
-- COMMAND: SELECT
-- PURPOSE: Displays all records from STUDENT3.

SELECT * FROM STUDENT3;
);


-- CONCEPT: DML
-- COMMAND: INSERT
-- PURPOSE: Inserts five records into STUDENT3.

INSERT INTO STUDENT3
VALUES
(517, 'ABHISHEK', 25, 'M', 'VJY', 599, 25000),
(518, 'PK', 26, 'M', 'BJY', 899, 30000),
(519, 'RANI', 59, 'F', 'TMR', 499, 32000),
(520, 'RK', 59, 'M', 'CHI', 999, 50000),
(521, 'SK', 65, 'F', 'ADKL', 399, 60000);


-- CONCEPT: DQL
-- COMMAND: SELECT
-- PURPOSE: Displays all records from STUDENT3.

SELECT * FROM STUDENT3;

-- CONCEPT: WHERE CLAUSE
-- CATEGORY: BASIC FILTERING
-- OPERATOR: EQUAL TO (=)
-- PURPOSE: Displays only male students.

SELECT *
FROM STUDENT3
WHERE GENDER = 'M';


-- CONCEPT: WHERE CLAUSE
-- CATEGORY: BASIC FILTERING
-- OPERATOR: EQUAL TO (=)
-- PURPOSE: Displays only female students.

SELECT *
FROM STUDENT3
WHERE GENDER = 'F';



-- CONCEPT: COMPARISON OPERATOR
-- OPERATOR: >= (GREATER THAN OR EQUAL TO)
-- PURPOSE: Displays students whose AGE is 30 or above.

SELECT *
FROM STUDENT3
WHERE AGE >= 30;


-- CONCEPT: COMPARISON OPERATOR
-- OPERATOR: <> (NOT EQUAL TO)
-- PURPOSE: Displays students whose CITY is not CHI.

SELECT *
FROM STUDENT3
WHERE CITY <> 'CHI';


-- CONCEPT: LOGICAL OPERATOR
-- OPERATOR: AND
-- PURPOSE: Displays the student only when BOTH conditions are TRUE.
-- CONDITION 1: S_ID = 520
-- CONDITION 2: GENDER = 'M'

SELECT *
FROM STUDENT3
WHERE S_ID = 520 AND GENDER = 'M';

-- CONCEPT: LOGICAL OPERATOR
-- OPERATOR: OR
-- PURPOSE: Displays students when AT LEAST ONE condition is TRUE.
-- CONDITION 1: S_ID = 520
-- CONDITION 2: GENDER = 'M'

SELECT *
FROM STUDENT3
WHERE S_ID = 520 OR GENDER = 'M';


Difference between AND and OR:
AND	OR
Both conditions must be TRUE	At least one condition must be TRUE
More restrictive	Less restrictive



-- CONCEPT: RANGE OPERATOR
-- OPERATOR: BETWEEN
-- PURPOSE: Displays students whose MARKS are between 499 and 899.
-- NOTE: Both boundary values are INCLUDED.

SELECT *
FROM STUDENT3
WHERE MARKS BETWEEN 499 AND 899;



-- CONCEPT: RANGE OPERATOR
-- OPERATOR: NOT BETWEEN
-- PURPOSE: Displays students whose AGE is outside the range 25 to 26.

SELECT *
FROM STUDENT3
WHERE AGE NOT BETWEEN 25 AND 26;


9. Membership Operators
Purpose: Check whether a column value matches any value in a specified list.
Query 23. IN operator
-- CONCEPT: MEMBERSHIP OPERATOR
-- OPERATOR: IN
-- PURPOSE: Displays students belonging to any one of
-- the three specified cities.

SELECT *
FROM STUDENT3
WHERE CITY IN ('TMR', 'CHI', 'ADKL');


Query 24. NOT IN operator
-- CONCEPT: MEMBERSHIP OPERATOR
-- OPERATOR: NOT IN
-- PURPOSE: Displays students whose CITY is not Python or SQL.

SELECT *
FROM STUDENT3
WHERE CITY NOT IN ('Python', 'SQL');


-- MEMBERSHIP OPERATOR: NOT IN
-- PURPOSE: Excludes CHI and ADKL cities.

SELECT *
FROM STUDENT3
WHERE CITY NOT IN ('CHI', 'ADKL');


-- CONCEPT: SEARCH OPERATOR
-- OPERATOR: LIKE
-- PATTERN: 'R%'
-- PURPOSE: Displays names that START with R.

SELECT *
FROM STUDENT3
WHERE S_NAME LIKE 'R%';



-- CONCEPT: SEARCH OPERATOR
-- OPERATOR: LIKE
-- PATTERN: 'R%'
-- PURPOSE: Displays names that START with R.

SELECT *
FROM STUDENT3
WHERE S_NAME LIKE 'R%';


Query 27. Display all non-NULL names using LIKE
-- CONCEPT: SEARCH OPERATOR
-- OPERATOR: LIKE
-- PATTERN: '%%'
-- PURPOSE: Matches any sequence of characters,
-- including an empty sequence, in non-NULL names.

SELECT *
FROM STUDENT3
WHERE S_NAME LIKE '%%';


-- CONCEPT: DDL
-- COMMAND: CREATE TABLE
-- PURPOSE: Creates a COURSE table to store course details.

CREATE TABLE COURSE
(
    C_ID INT PRIMARY KEY,
    C_NAME VARCHAR(50),
    DURATION INT,
    COURSE_FEE INT,
    TECHNOLOGY VARCHAR(50)
);





-- CONCEPT: DML
-- COMMAND: INSERT
-- PURPOSE: Inserts five course records.

INSERT INTO COURSE
VALUES
(101, 'Python', 6, 15000, 'Programming'),
(102, 'Java', 8, 18000, 'Programming'),
(103, 'SQL', 3, 10000, 'Database'),
(104, 'Web Development', 10, 20000, 'Development'),
(105, 'Data Science', 12, 25000, 'Analytics');


-- CONCEPT: DQL
-- PURPOSE: Displays all course records.

SELECT * FROM COURSE;


-- CONCEPT: COMPARISON OPERATOR
-- OPERATOR: >=
-- PURPOSE: Displays courses having duration greater than
-- or equal to 7 months.

SELECT *
FROM COURSE
WHERE DURATION >= 7;


-- CONCEPT: LOGICAL OPERATOR
-- OPERATOR: OR
-- PURPOSE: Displays courses where C_ID is 102
-- OR DURATION is 7.

SELECT *
FROM COURSE
WHERE C_ID = 102 OR DURATION = 7;



-- CONCEPT: LOGICAL OPERATOR
-- OPERATOR: AND
-- PURPOSE: Displays courses where BOTH C_ID is 102-- CONCEPT: RANGE OPERATOR
-- OPERATOR: BETWEEN
-- PURPOSE: Displays courses whose duration is between
-- 8 and 20 months (including both boundaries).

SELECT *
FROM COURSE
WHERE DURATION BETWEEN 8 AND 20;
-- AND DURATION is 8.

SELECT *
FROM COURSE
WHERE C_ID = 102 AND DURATION = 8;

-- CONCEPT: MEMBERSHIP OPERATOR
-- OPERATOR: IN
-- PURPOSE: Displays courses belonging to any of the
-- three specified technologies.

SELECT *
FROM COURSE
WHERE TECHNOLOGY IN
('PROGRAMMING', 'DEVELOPMENT', 'ANALYTICS');



-- CONCEPT: MEMBERSHIP OPERATOR
-- OPERATOR: NOT IN
-- PURPOSE: Excludes courses belonging to the specified
-- technology names.

SELECT *
FROM COURSE
WHERE TECHNOLOGY NOT IN
('C_PROGRAMMING', 'B_DEVELOPMENT', 'D_ANALYTICS');


-- CONCEPT: MEMBERSHIP OPERATOR
-- OPERATOR: NOT IN
-- PURPOSE: Excludes Programming and Analytics technologies.

SELECT *
FROM COURSE
WHERE TECHNOLOGY NOT IN ('Programming', 'Analytics');


-- CONCEPT: SEARCH OPERATOR
-- OPERATOR: LIKE
-- PATTERN: '%%'
-- PURPOSE: Matches all non-NULL course names.

SELECT *
FROM COURSE
WHERE C_NAME LIKE '%%';


or meaningful search practice, also try:
-- CONCEPT: SEARCH OPERATOR
-- OPERATOR: LIKE
-- PATTERN: 'D%'
-- PURPOSE: Displays course names STARTING with D.

SELECT *
FROM COURSE
WHERE C_NAME LIKE 'D%';


-- CONCEPT: SEARCH OPERATOR
-- OPERATOR: LIKE
-- PATTERN: '%Development%'
-- PURPOSE: Displays course names CONTAINING Development.

SELECT *
FROM COURSE
WHERE C_NAME LIKE '%Development%';



12. Complete SQL operator classification – Quick reference
This is the most important section to save in your SQL notes.
No.	Query category	Operator / command	Purpose
1	Basic filtering	WHERE	Filters records
2	Comparison	=, <>, >, <, >=, <=	Compares values
3	Logical	AND	Both conditions TRUE
4	Logical	OR	At least one TRUE
5	Logical	NOT	Reverses condition
6	Range	BETWEEN	Within a range
7	Range	NOT BETWEEN	Outside a range
8	Membership	IN	Matches values in a list
9	Membership	NOT IN	Excludes values in a list
10	Search	LIKE	Searches text patterns
11	Search	%	Zero or more characters
12	Search	_	Exactly one character















