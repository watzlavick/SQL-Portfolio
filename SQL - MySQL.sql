/*SQL – MySQL for Data Analytics and Business Intelligence*/
/*Creating a Database & Tables Exercise*/

CREATE DATABASE IF NOT EXISTS Sales1;
CREATE SCHEMA IF NOT EXISTS Sales1;
USE Sales1;

CREATE TABLE customers1
(	customer_id INT,
	first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT);
    
CREATE TABLE sales1
(	purchase_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL);
    
DROP TABLE sales1;
DROP TABLE customers1;

CREATE TABLE customers1
(	customer_id INT,
	first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255), 
    number_of_complaints INT, 
    primary key (customer_id)
);
DROP TABLE IF EXISTS items1;
CREATE TABLE items1
(	item_code VARCHAR(255),
	item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255),
    primary key (item_code)
    );
    
CREATE TABLE companies1
(	company_id VARCHAR(255),
	company_name VARCHAR(255),
    headquarters_phone_number INT(12),
    primary key (company_id)
);

CREATE TABLE sales1
(	purchase_number INT AUTO_INCREMENT,
	date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
    PRIMARY KEY (purchase_number), 
    FOREIGN KEY (customer_id) REFERENCES customers1(customer_id) ON DELETE CASCADE
);

DROP TABLE sales1;
DROP TABLE customers1;
DROP TABLE items1;
DROP TABLE companies1;

DROP TABLE customers1;
CREATE TABLE customers1
(	customer_id INT,
	frist_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT, 
    PRIMARY KEY (customer_id)
);

ALTER TABLE customers1
ADD UNIQUE KEY (email_address);

ALTER TABLE customers1
DROP INDEX email_address;

DROP TABLE customers1;

CREATE TABLE customers1
(	customer_id INT AUTO_INCREMENT,
	first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255), 
    number_of_complaints INT, 
    primary key (customer_id)
);

ALTER TABLE customers1
ADD COLUMN gender ENUM('M','F') AFTER last_name;

INSERT INTO customers1(first_name, last_name, gender, email_address, number_of_complaints)
VALUES('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

INSERT INTO customers1(first_name, last_name, gender, email_address, number_of_complaints)
VALUES('Jordan', 'Watzlavick', 'F', 'jordan.watzlavick@example.com', 0);

SELECT *
FROM customers1;

ALTER TABLE customers1
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers1(first_name, last_name, gender)
VALUES('Peter', 'Figaro', 'M');

SELECT *
FROM customers1;

CREATE TABLE companies

(

    company_id VARCHAR(255),

    company_name VARCHAR(255) DEFAULT 'X',

    headquarters_phone_number VARCHAR(255),

PRIMARY KEY (company_id),

UNIQUE KEY (headquarters_phone_number)

);

DROP TABLE companies;

CREATE TABLE companies1
(	company_id INT AUTO_INCREMENT,
	headquarters_phone_number VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (company_id)
);

ALTER TABLE companies1
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies1
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

/*results in error because company_name cannot be null*/
INSERT INTO companies1(headquarters_phone_number)
VALUES ('+1 (202) 555-0196');

INSERT INTO companies1(headquarters_phone_number, company_name)
VALUES ('+1 (202) 555-0196','Company A');

SELECT *
FROM companies1;

ALTER TABLE companies1
MODIFY headquarters_phone_number VARCHAR(255) NULL;

ALTER TABLE companies1
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

/*SQL – MySQL for Data Analytics and Business Intelligence*/
/*Exercises in the Employee Database*/ 

/*Select the information from the “dept_no” column of the “departments” 
table. Select all data from the “departments” table.*/
SELECT dept_no
FROM departments;

SELECT *
FROM departments;

/*Select all people from the “employees” table whose first name is “Elvis”.*/
SELECT *
FROM employees
WHERE first_name = 'Elvis';

/*Retrieve a list with all female employees whose first name is Kellie.*/
SELECT *
FROM employees
WHERE first_name = 'Kellie' AND gender = 'F';

/*Retrieve a list with all employees whose first name is either Kellie or Aruna.*/
SELECT *
FROM employees
WHERE first_name = 'Kellie' OR first_name = 'Aruna';

/*Retrieve a list with all female employees whose first name is either Kellie or Aruna.*/
SELECT *
FROM employees
WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');

/*Use the IN operator to select all individuals from the “employees” table, whose first name 
is either “Denis”, or “Elvis”.*/
SELECT *
FROM employees
WHERE first_name IN('Denis', 'Elvis');

/*Extract all records from the ‘employees’ table, aside from those with employees 
named John, Mark, or Jacob.*/
SELECT *
FROM employees
WHERE first_name NOT IN('John', 'Mark', 'Jacob');

/*Working with the “employees” table, use the LIKE operator to select 
the data about all individuals, whose first name starts with “Mark”; 
specify that the name can be succeeded by any sequence of characters.
Retrieve a list with all employees who have been hired in the year 2000.
Retrieve a list with all employees whose employee number is written with 
5 characters, and starts with “1000”. */
SELECT *
FROM employees
WHERE first_name LIKE('Mark%');

SELECT *
FROM employees
WHERE hire_date LIKE ('%2000%');

SELECT *
FROM employees
WHERE emp_no LIKE ('1000_');
    
/*Extract all individuals from the ‘employees’ table whose first name 
contains “Jack”.
Once you have done that, extract another list containing the names of 
employees that do not contain “Jack”. */
SELECT *
FROM employees
WHERE first_name LIKE ('%JACK%');

SELECT *
FROM employees
WHERE first_name NOT LIKE ('%Jack%'); 
    
/*Select all the information from the “salaries” table regarding contracts 
from 66,000 to 70,000 dollars per year.
Retrieve a list with all individuals whose employee number is not between 
‘10004’ and ‘10012’.
Select the names of all departments with numbers between ‘d003’ and ‘d006’. */
SELECT *
FROM salaries;

SELECT *
FROM salaries
WHERE salary BETWEEN 66000 AND 70000;

SELECT *
FROM employees
WHERE emp_no NOT BETWEEN '10004' AND '10012';

SELECT dept_name
FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';
    
/*Select the names of all departments whose department number value is not null. */
SELECT dept_name
FROM departments
WHERE dept_no IS NOT NULL;

/*Retrieve a list with data about all female employees who were hired 
in the year 2000 or after. Hint: If you solve the task correctly, SQL 
should return 7 rows.
Extract a list with all employees’ salaries higher than $150,000 per annum. */
SELECT *
FROM employees
WHERE hire_date >= '2000-01-01' AND gender = 'F';

SELECT *
FROM salaries
WHERE salary > 150000;

SELECT first_name, last_name, gender
FROM salaries
JOIN employees 
ON salaries.emp_no = employees.emp_no
WHERE salary > 150000;

/*Obtain a list with all different “hire dates” from the “employees” table.*/
SELECT DISTINCT hire_date
FROM employees
LIMIT 1000;
    
/*How many annual contracts with a value higher than or equal to $100,000 
have been registered in the salaries table?
How many managers do we have in the “employees” database? Use the star 
symbol (*) in your code to solve this exercise. */
SELECT COUNT(*)
FROM salaries
WHERE salary >= 100000;

SELECT COUNT(*)
FROM dept_manager;
    
/*Select all data from the “employees” table, ordering it by “hire date” 
in descending order. */
SELECT *
FROM employees
ORDER BY hire_date DESC;

/*Write a query that obtains two columns. The first column must contain 
annual salaries higher than 80,000 dollars. The second column, renamed to 
“emps_with_same_salary”, must show the number of employees contracted to 
that salary. Lastly, sort the output by the first column. */
SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary;

/*Select all employees whose average salary is higher than $120,000 per annum. */
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

/*Select the employee numbers of all individuals who have signed more 
than 1 contract after the 1st of January 2000. */
SELECT emp_no
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

/*Select the first 100 rows from the ‘dept_emp’ table.*/
SELECT *
FROM dept_emp
LIMIT 100;

INSERT INTO employees
VALUES
(	999903,
	'1977-09-14',
	'Johnathan',
	'Creek',
	'M',
	'1999-01-01'
);

/*Select ten records from the “titles” table to get a better idea about its content.
Then, in the same table, insert information about employee number 999903. 
State that he/she is a “Senior Engineer”, who has started working in this position
 on October 1st, 1997.
At the end, sort the records from the “titles” table in descending order to 
check if you have successfully inserted the new record.*/
SELECT *
FROM titles
LIMIT 10;

insert into titles
(	emp_no,
	title,
	from_date)
values
(	 999903,
	'Senior Engineer',
	'1997-10-01');

SELECT *
FROM titles
ORDER BY emp_no DESC;

/*Insert information about the individual with employee number 999903 into the 
“dept_emp” table. He/She is working for department number 5, and has started work 
on  October 1st, 1997; her/his contract is for an indefinite period of time.*/
SELECT *
FROM dept_emp
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO dept_emp
(	emp_no,
    dept_no,
    from_date,
    to_date)
VALUES
( 	999903,
    'd005',
    '1997-10-01',
    '9999-01-01');

/*Create a new department called “Business Analysis”. Register it under
 number ‘d010’.*/
 INSERT INTO departments 
 VALUES ('d010', 'Business Analysis');
 
 UPDATE employees
 SET
	first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE emp_no = 999909;

/*Change the “Business Analysis” department name to “Data Analysis”.*/
UPDATE departments
SET dept_name = 'Data Analysis'
WHERE dept_no = 'd010';

/*Remove the department number 10 record from the “departments” table.*/
DELETE FROM departments
WHERE dept_no = 'd010';

/*How many departments are there in the “employees” database? Use the 
‘dept_emp’ table to answer the question.*/
SELECT COUNT(DISTINCT dept_no)
FROM dept_emp;

/*What is the total amount of money spent on salaries for all contracts 
starting after the 1st of January 1997?*/
SELECT SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';

/*1. Which is the lowest employee number in the database?
2. Which is the highest employee number in the database?*/
#1
SELECT MIN(emp_no)
FROM employees;

#2
SELECT MAX(emp_no)
FROM employees;

/*What is the average annual salary paid to employees who started after 
the 1st of January 1997?*/
SELECT AVG(salary)
FROM salaries
WHERE  from_date > '1997-01-01';

/*Round the average amount of money spent on salaries for all contracts that 
started after the 1st of January 1997 to a precision of cents.*/
SELECT ROUND(AVG(salary),2)
FROM salaries
WHERE from_date > '1997-01-01';

/*Select the department number and name from the ‘departments_dup’ table and 
add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
If ‘dept_no’ does not have a value, use ‘dept_name’.*/
SELECT dept_no, dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

/*Modify the code obtained from the previous exercise in the following way. 
Apply the IFNULL() function to the values from the first and second column, 
so that ‘N/A’ is displayed whenever a department number has no value, and 
‘Department name not provided’ is shown if there is no value for ‘dept_name’.*/
SELECT
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name,'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

/*Create departments_dup table. Let it contain two columns: dept_no and 
dept_name. Let the data type of dept_no be CHAR of 4, and the data type of 
dept_name be VARCHAR of 40. Both columns are allowed to have null values. 
Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)
Then, insert a record whose department name is “Public Relations”.
Delete the record(s) related to department number two.
Insert two new records in the “departments_dup” table. Let their values in 
the “dept_no” column be “d010” and “d011”.*/
DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup
(	dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL);

INSERT INTO departments_dup
(	dept_no,
    dept_name)
SELECT *
FROM departments;

INSERT INTO departments_dup (dept_name)
VALUES('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002'; 

INSERT INTO departments_dup(dept_no) 
VALUES ('d010'), ('d011');

/*DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.
Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.*/
ALTER TABLE departments_dup
DROP COLUMN dept_manager;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

/*Create and fill in the ‘dept_manager_dup’ table, using the following code:*/
DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 

SELECT *
FROM dept_manager_dup
ORDER BY dept_no;

/*JOINS activity*/
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
INNER JOIN departments_dup d
ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

/*Extract a list containing information about all managers’ employee number, 
first and last name, department number, and hire date.*/
SELECT dm.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM dept_manager dm
INNER JOIN employees e
ON dm.emp_no = e.emp_no
ORDER BY dm.emp_no;

INSERT INTO dept_manager_dup
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES('d009', 'Customer Service');

/*Check 'dept_manager_dup' and 'departmets_dup'*/
SELECT *
FROM dept_manager_dup
ORDER BY dept_no ASC;

SELECT *
FROM departments_dup
ORDER BY dept_no ASC; 

#Inner Join
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
JOIN departments_dup d 
ON m.dept_no = d.dept_no 
ORDER BY dept_no;

/*First I obtained the correction query to only full group by code from 
stackoverlow so that I can run the 'group by' query below correctly*/
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT m.emp_no, m.dept_no, d.dept_name
FROM dept_manager_dup m
JOIN departments_dup d 
ON m.dept_no = d.dept_no 
GROUP BY m.emp_no
ORDER BY dept_no;

#Left Join
#remove the duplicates from the two tables
DELETE FROM dept_manager_dup
WHERE emp_no = '110228';

DELETE FROM departments_dup
WHERE dept_no = 'd009';

#add back the inital records
INSERT INTO dept_manager_dup
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
JOIN departments_dup d
ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM departments_dup d
LEFT JOIN dept_manager_dup m
ON d.dept_no = m.dept_no
ORDER BY m.dept_no;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d
ON d.dept_no = m.dept_no
ORDER BY d.dept_no;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM departments_dup d
LEFT OUTER JOIN dept_manager_dup m
ON d.dept_no = m.dept_no
ORDER BY d.dept_no;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d
ON d.dept_no = m.dept_no
ORDER BY m.dept_no;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d
ON d.dept_no = m.dept_no
WHERE dept_name IS NULL
ORDER BY m.dept_no;

/*Join the 'employees' and the 'dept_manager' tables to return a subset 
of all the employees whose last name is Markovitch. See if the output 
contains a manager with that name.*/
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM employees e
LEFT JOIN dept_manager dm
ON e.emp_no = dm.emp_no
WHERE last_name = 'Markovitch'
ORDER BY dm.dept_no DESC;

#right join
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
RIGHT JOIN departments_dup d
ON d.dept_no = m.dept_no
ORDER BY m.dept_no;

SELECT d.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
RIGHT JOIN departments_dup d
ON d.dept_no = m.dept_no
ORDER BY d.dept_no;

#left join can give same results
SELECT d.dept_no, m.emp_no, d.dept_name
FROM departments_dup d
LEFT JOIN dept_manager_dup m
ON d.dept_no = m.dept_no
ORDER BY d.dept_no;

#new and old join syntax
SELECT m.dept_no, m.emp_no, d.dept_name
FROM 	dept_manager_dup m,
		departments_dup d
WHERE m.dept_no = d.dept_no
ORDER BY m.dept_no;

/*Extract a list containing information about all managers’ employee number, 
first and last name, department number, and hire date. Use the old type of 
join syntax to obtain the result.*/
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date, e.hire_date
FROM 	employees e,
		dept_manager dm
WHERE e.emp_no = dm.emp_no
ORDER BY dm.dept_no;

#new syntax
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date, e.hire_date
FROM employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no;

#join and where together
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE s.salary > 145000;

/*Select the first and last name, the hire date, and the job title of all 
employees whose first name is “Margareta” and have the last name “Markovitch”*/
SELECT e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
JOIN titles t
ON e.emp_no = t.emp_no
WHERE e.first_name = 'Margareta' AND e.last_name = 'Markovitch';

#cross join
SELECT dm.*, d.*
FROM dept_manager dm
CROSS JOIN departments d
ORDER BY dm.emp_no, d.dept_no;

/*Use a CROSS JOIN to return a list with all possible combinations between 
managers from the dept_manager table and department number 9.*/
SELECT dm.*, d.*  
FROM departments d  
CROSS JOIN dept_manager dm  
WHERE d.dept_no = 'd009'  
ORDER BY d.dept_no;

/*Return a list with the first 10 employees with all the departments they 
can be assigned to.*/
SELECT e.*, d.*
FROM employees e
CROSS JOIN departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;

#aggregate functions with joins
SELECT e.gender, AVG(s.salary) AS average_salary 
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY e.gender;

#join more than two tables
SELECT
	e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM employees e
JOIN dept_manager m 
ON e.emp_no = m.emp_no
JOIN departments d
ON m.dept_no = d.dept_no;

/*Select all managers’ first and last name, hire date, job title, start date, 
and department name.*/
SELECT e.first_name, e.last_name, e.hire_date, t.title, dm.from_date, d.dept_name
FROM employees e 
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
JOIN departments d 
ON dm.dept_no = d.dept_no
JOIN titles t
ON e.emp_no = t.emp_no
WHERE t.title LIKE '%Manager%'
ORDER BY e.emp_no;

SELECT d.dept_name, AVG(salary) AS average_salary
FROM departments d
JOIN dept_manager m 
ON d.dept_no = m.dept_no 
JOIN salaries s
ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY average_salary DESC;

/*How many male and how many female managers do we have in the 
‘employees’ database?*/
SELECT  e.gender, COUNT(dm.emp_no)
FROM employees e
JOIN dept_manager dm 
ON e.emp_no = dm.emp_no
GROUP BY gender;

SELECT *
FROM
(SELECT 	e.emp_no,
			e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM employees e
    WHERE last_name = 'Denis' UNION SELECT
			NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM dept_manager dm) as a
ORDER BY -a.emp_no DESC;

#subqueries with IN nested inside WHERE
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.emp_no IN (	SELECT dm.emp_no
					FROM dept_manager dm);
                    
/*Extract the information about all department managers who were hired 
between the 1st of January 1990 and the 1st of January 1995.*/
SELECT *
FROM dept_manager
WHERE emp_no IN (	SELECT emp_no
					FROM employees
					WHERE hire_date 
                    BETWEEN '1990-01-01' AND '1995-01-01');

#exists and not exists
SELECT e.first_name, e.last_name
FROM employees e
WHERE EXISTS(	SELECT *
				FROM dept_manager dm
				WHERE dm.emp_no = e.emp_no);
                
SELECT e.first_name, e.last_name
FROM employees e
WHERE EXISTS(	SELECT *
				FROM dept_manager dm
				WHERE dm.emp_no = e.emp_no)
                ORDER BY emp_no;

/*Select the entire information for all employees whose job title is 
“Assistant Engineer”*/
SELECT  *
FROM employees e
WHERE EXISTS( 	SELECT *
				FROM titles t
				WHERE t.emp_no = e.emp_no
				AND title = 'Assistant Engineer');

/*Starting your code with “DROP TABLE”, create a table called “emp_manager” 
(emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – 
integer of 11, not null). Fill emp_manager with data about employees, the 
number of the department they are working in, and their managers.
Your query skeleton must be:
Insert INTO emp_manager SELECT U.*
FROM (A)
UNION (B) UNION (C) UNION (D) AS U;
A and B should be the same subsets used in the last lecture (SQL Subqueries 
Nested in SELECT and FROM). In other words, assign employee number 110022 as 
a manager to all employees from 10001 to 10020 (this must be subset A), and 
employee number 110039 as a manager to all employees from 10021 to 10040 (this 
must be subset B).
Use the structure of subset A to create subset C, where you must assign employee 
number 110039 as a manager to employee 110022.
Following the same logic, create subset D. Here you must do the opposite - 
assign employee 110022 as a manager to employee 110039.
Your output must contain 42 rows.*/
DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager 
(	emp_no INT(11) NOT NULL,
   dept_no CHAR(4) NULL,
   manager_no INT(11) NOT NULL);
   
INSERT INTO emp_manager
SELECT u.*
FROM
(	SELECT a.*
	FROM
        (SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
            (	SELECT emp_no
                FROM dept_manager
                WHERE emp_no = 110022) AS manager_ID
    FROM  employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    WHERE e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT b.*
    FROM
        (SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
            (	SELECT emp_no
                FROM dept_manager
                WHERE emp_no = 110039) AS manager_ID
    FROM employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    WHERE e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT c.*
    FROM
        (SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
            (	SELECT emp_no
				FROM dept_manager
                WHERE emp_no = 110039) AS manager_ID
    FROM employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    WHERE e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT d.*
    FROM
        (SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
            (	SELECT emp_no
                FROM dept_manager
                WHERE emp_no = 110022) AS manager_ID
    FROM employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    WHERE e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
SELECT *
FROM emp_manager;

SELECT e1.*
FROM emp_manager e1
JOIN emp_manager e2
ON e1.emp_no = e2.manager_no;

SELECT e1.emp_no, e1.dept_no, e2.manager_no
FROM emp_manager e1
JOIN emp_manager e2
ON e1.emp_no = e2.manager_no;

SELECT e1.*
FROM emp_manager e1
JOIN emp_manager e2
ON e1.emp_no = e2.manager_no
WHERE e2.emp_no IN(SELECT manager_no
					FROM emp_manager);

/*Create a view that will extract the average salary of all managers 
registered in the database. Round this value to the nearest cent.*/
CREATE OR REPLACE VIEW v_manager_avg_salary AS
	SELECT ROUND(AVG(salary), 2)
	FROM salaries s
	JOIN dept_manager m ON s.emp_no = m.emp_no;
    
USE employees;
DROP PROCEDURE IF EXISTS select_employees;
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN	
	SELECT *
    FROM employees
    LIMIT 1000;
END$$
DELIMITER ;
call employees.select_employees();
call select_employees();

/*Create a procedure that will provide the average salary of all employees.
Then, call the procedure.*/
DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
	SELECT AVG(salary)
	FROM salaries;
END$$
DELIMITER ;
CALL avg_salary();

/*Create a procedure called ‘emp_info’ that uses as parameters the first and 
the last name of an individual, and returns their employee number.*/
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), 
in p_last_name varchar(255), out p_emp_no integer)
BEGIN
	SELECT e.emp_no INTO p_emp_no 
    FROM employees e
	WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
END$$
DELIMITER ;

/*Create a variable, called ‘v_emp_no’, where you will store the output of 
the procedure you created in the last exercise.
Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ 
as a first and last name respectively.
Finally, select the obtained output.*/
SET @v_emp_no = 0;
CALL emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

/*Create a function called ‘emp_info’ that takes for parameters the first 
and last name of an employee, and returns the salary from the newest contract 
of that employee.
Finally, select this function*/
DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), 
p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	DECLARE v_max_from_date date;
	DECLARE v_salary decimal(10,2);
    
SELECT MAX(from_date) INTO v_max_from_date 
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name;

SELECT s.salary INTO v_salary 
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name AND s.from_date = v_max_from_date;

	RETURN v_salary;
END$$
DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');

/*Create a trigger that checks if the hire date of an employee is higher 
than the current date. If true, set this date to be the current date. Format 
the output appropriately (YY-MM-DD).*/
DELIMITER $$
CREATE TRIGGER trig_hire_date  
BEFORE INSERT ON employees
FOR EACH ROW  
BEGIN  
IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') 
THEN 
SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     
END IF;  
END $$  
DELIMITER ;  

INSERT employees 
VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');

SELECT *  
FROM employees
ORDER BY emp_no DESC;

/*Drop the ‘i_hire_date’ index.
Select all records from the ‘salaries’ table of people whose salary is 
higher than $89,000 per annum.
Then, create an index on the ‘salary’ column of that table, and check 
if it has sped up the search of the same SELECT statement.*/
ALTER TABLE employees
DROP INDEX i_hire_date;

SELECT *
FROM salaries
WHERE salary > 89000;

CREATE INDEX i_salary ON salaries(salary);

SELECT *
FROM salaries
WHERE salary > 89000;

/*obtain a result set containing the employee number, first name, and last 
name of all employees with a number higher than 109990. Create a fourth column 
in the query, indicating whether this employee is also a manager, according to 
the data provided in the dept_manager table, or a regular employee. */
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM employees e
LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;

/*Extract a dataset containing the following information about the 
managers: employee number, first name, and last name. Add two columns 
at the end – one showing the difference between the maximum and minimum 
salary of that employee, and another one saying whether this salary raise 
was higher than $30,000 or NOT.*/
SELECT
    dm.emp_no,  
    e.first_name,  
    e.last_name,  
    MAX(s.salary) - MIN(s.salary) AS salary_difference,  
    CASE  
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 
        THEN 'Salary was raised by more then $30,000'  
        ELSE 'Salary was NOT raised by more then $30,000'  
    END AS salary_raise  
FROM dept_manager dm  
JOIN employees e 
ON e.emp_no = dm.emp_no  
JOIN salaries s 
ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;  

SELECT  
    dm.emp_no,  
    e.first_name,  
    e.last_name,  
    MAX(s.salary) - MIN(s.salary) AS salary_difference,  
    IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 'Salary was NOT raised by more then $30,000') AS salary_increase  
FROM dept_manager dm  
JOIN employees e 
ON e.emp_no = dm.emp_no  
JOIN salaries s 
ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;

/*Extract the employee number, first name, and last name of the first 100 
employees, and add a fourth column, called “current_employee” saying “Is 
still employed” if the employee is still working in the company, or “Not an 
employee anymore” if they aren’t.*/
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;

