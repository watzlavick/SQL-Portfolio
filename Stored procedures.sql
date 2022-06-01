#Stored procedures in MySQL
USE employees;

#create a stored procedure that will select the first 1000 employees
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

#Create a procedure that will provide the average salary of all employees
DROP PROCEDURE IF EXISTS avg_salary;

DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
SELECT AVG(salary)
FROM salaries;
END$$
DELIMITER ;

call employees.avg_salary();

#Stored procedures with an input parameter
#created a stored procedure that returns the name, salary, start date, and 
#end date of a specific employee you choose
USE employees;
DROP PROCEDURE IF EXISTS emp_salary;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
	e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM employees e
JOIN salaries s
ON e.emp_no = s. emp_no
WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

#what is the employees average salary?
DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
	e.first_name, e.last_name, s.salary, AVG(s.salary)
FROM employees e
JOIN salaries s
ON e.emp_no = s. emp_no
WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

call emp_avg_salary(11300);

#procedures with an out parameter
USE employees;
DROP PROCEDURE IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT AVG(s.salary)
INTO p_avg_salary 
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

#Create a procedure called ‘emp_info’ that uses as parameters the first and 
#the last name of an individual, and returns their employee number
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN
SELECT e.emp_no
INTO p_emp_no 
FROM employees e
WHERE e.first_name = p_first_name
	AND e.last_name = p_last_name;
END$$
DELIMITER ;