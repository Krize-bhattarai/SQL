create database HR;
USE HR;
SHOW TABLES;
CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            
	SELECT* FROM employees;					

-- Questions: 
-- 1.	Retrieve all employees whose address is in Elgin,IL
SELECT* FROM employees where address like '%ELgin,IL%';

-- 2.	Retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT* FROM employees where Dep_ID = 5 and salary between 60000 and 70000;

-- 3.	Retrieve a list of employees ordered by department ID.
select* from employees order by dep_id;

-- 4.	For each department ID retrieve the number of employees in the department
select SUM(SALARY) FROM EMPLOYEES;
select MAX(SALARY) FROM EMPLOYEES;
select MIN(SALARY) FROM EMPLOYEES;
select AVG(SALARY) FROM EMPLOYEES;
select COUNT(EMP_ID) FROM EMPLOYEES;

SELECT DEP_ID, COUNT(DEP_ID) FROM EMPLOYEES
GROUP BY DEP_ID;

-- 5.	For each department retrieve the number of employees in the department, and the average employee salary in the department..
SELECT DEP_ID, COUNT(EMP_ID) AS Number_of_employees, avg(salary) as Average_Salary
from employees group by dep_id;

-- 6.	For each department retrieve the number of employees in the department, and the average employee salary in the department and limit the result to departments with fewer than 4 employees.
SELECT DEP_ID, COUNT(EMP_ID) AS Number_of_employees, avg(salary) as Average_Salary
from employees group by dep_id having count(emp_id) < 4;