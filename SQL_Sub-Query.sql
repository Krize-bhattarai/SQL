# SUB-QUERY
-- A Query inside another query
-- Accessing multiple tables with sub-queries

-- Below questions are based on different Data Bases like hr, movenmovies and so on
-- Question: Retrieve only the employees records that correspond to jobs in the JOBS table
use hr;
select* from employees;
select* from jobs;

select* from employees where JOB_ID
IN(SELECT JOB_IDENT FROM jobs);

-- Question Retrieve only the list of employees whose JOB_TITLE is Jr. Designer
SELECT* FROM employees where JOB_ID IN(select JOB_IDENT FROM JOBS where JOB_TITLE = 'Jr. Designer');

-- Question: Retrieve JOB information and who earn more than $70,000
select* from jobs;
select* from employees;
select * from jobs where MIN_SALARY > 70000;

select* from JOBS where job_ident IN(SELECT JOB_ID from employees where salary > 70000);

-- Question: Retrieve JOB INFORMATION and whose birth year is after 1976
select* from employees;
select* from jobs;

select* from jobs where JOB_IDENT IN(SELECT JOB_ID from employees where year(B_DATE) > 1976);

-- Question Retrieve JOB INFORMATION for female employees and whose birth year is after 1976
select* from employees;
select* from jobs;
select* from jobs where JOB_IDENT IN(SELECT JOB_ID from employees where year(B_DATE) > 1976 and sex = 'F');

-- Question: Retrieve the first name and last name if customers who have rented films that belong to the category 'Action'

USE MAVENMOVIES;
select* from customer; # customer_id
select* from rental; # customer_id, inventory_id
select* from inventory; # inventory_id, film id
select* from film_category; # film_id, category_id
select* from category; # category_id

SELECT first_name, last_name from customer where customer_id
IN(SELECT customer_id from rental where inventory_id
IN(SELECT inventory_id from inventory where film_id
IN(SELECT film_id from film_category where category_id
IN(SELECT category_id from category where name = 'Action'))));

-- Question: Execute a working query using a sub select to retrieve all employees records whose salary is lower than the average salary

use hr;
select* from employees;
select avg(salary) from employees;


select* from employees 
where salary < (select avg(salary) from employees);

-- Question Execute a column expression that retrieves akk employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY IN EVERY ROW
select* from employees;
SELECT max(salary) from employees as MAX_SALARY;

select EMP_ID, SALARY, (SELECT max(salary) from employees) as MAX_SALARY FROM employees;