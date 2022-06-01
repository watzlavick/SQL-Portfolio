#Views in MySQL
SELECT emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM dept_emp
GROUP BY emp_no
HAVING Num > 1;

#employees have multiple contracts, we will create a view that encompasses 
#only the last contract of each employee 
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM dept_emp
GROUP BY emp_no;

SELECT *
FROM employees.v_dept_emp_latest_date;

#exercise: Create a view that will extract the average salary of all managers 
#registered in the database. Round this value to the nearest cent.
CREATE OR REPLACE VIEW v_manager_avg_salary AS 
SELECT ROUND(AVG(salary),2) 
FROM salaries s
JOIN dept_manager m
ON s.emp_no = m.emp_no;

SELECT * 
FROM employees.v_manager_avg_salary;
