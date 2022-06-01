#Variables 
SET @v_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300, @v_avg_salary);
SELECT @v_avg_salary;
#result @v_avg_salary is 48193.80

#Create a variable, called ‘v_emp_no’, where you will store the output 
#of the procedure you created in the last exercise.
#Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as 
#a first and last name respectively.
#Finally, select the obtained output.
SET @v_emp_no = 0;
CALL emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;
#result @v_emp_no is 10789

#Local Variables example - v_avg_salary
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

#Session Variables - how to establish a session variable 
SET @s_var1 = 3;
SELECT @s_var1;

#Global Variables - apply to all connections related to a specific server - system variables
SET GLOBAL max_connections = 1000;
#or
SET @@global.max_connections = 1; 


