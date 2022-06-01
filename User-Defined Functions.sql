#User-Defined Functions
#example of user-defined function
USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL (10,2)
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
SELECT AVG(s.salary)
INTO v_avg_salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$
DELIMITER ;

#example: Create a function called ‘emp_info’ that takes for parameters 
#the first and last name of an employee, and returns the salary from the 
#newest contract of that employee
DROP FUNCTION IF EXISTS emp_info;
DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS DECIMAL(10,2)
BEGIN
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10,2);
SELECT MAX(from_date)
INTO v_max_from_date 
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
SELECT s.salary 
INTO v_salary 
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name AND s.from_date = v_max_from_date;
RETURN v_salary;
END$$
DELIMITER ;

SELECT emp_info('Aruna', 'Journel');

#example: function inside of a select statement
SET@v_emp_no = 11300;
SELECT emp_no, first_name, last_name, f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM employees
WHERE emp_no = @v_emp_no;

#Built in functions examples 
SELECT SYSDATE();

SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') as today;