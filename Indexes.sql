#Indexes 
SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);

SELECT *
FROM employees
WHERE first_name = 'Georgi' AND last_name = 'Facello';

CREATE INDEX i_composite ON employees(first_name, last_name);

SHOW INDEX FROM employees FROM employees;

ALTER TABLE employees
DROP INDEX i_hire_date;

#Excercise: Select all records from the ‘salaries’ table of people whose 
#salary is higher than $89,000 per annum.
#Then, create an index on the ‘salary’ column of that table, and check if 
#it has sped up the search of the same SELECT statement.
SELECT *
FROM salaries
WHERE salary > 89000;

CREATE INDEX i_salary ON salaries(salary);