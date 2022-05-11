/*The Complete SQL Bootcamp 2022: Go from Zero to Hero*/
/*Assessment Test 3 Creating a Database and Tables*/
/*Create a new database called "School" this database should have two tables: 
teachers and students.

The students table should have columns for student_id, 
first_name,last_name, homeroom_number, phone,email, and graduation year.

The teachers table should have columns for teacher_id, first_name, last_name,
homeroom_number, department, email, and phone.

The constraints are mostly up to you, but your table constraints do have 
to consider the following:
We must have a phone number to contact students in case of an emergency.
We must have ids as the primary key of the tables
Phone numbers and emails must be unique to the individual.

Once you've made the tables, insert a student named Mark Watney 
(student_id=1) who has a phone number of 777-555-1234 and doesn't have an 
email. He graduates in 2035 and has 5 as a homeroom number.

Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom 
number of 5 and is from the Biology department. His contact info is: 
jsalk@school.org and a phone number of 777-555-4321.*/

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	homeroom_number INTEGER,
	phone VARCHAR(20) UNIQUE NOT NULL,
	email VARCHAR(115) UNIQUE,
	grade_year INTEGER);
	
CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	homeroom_number INTEGER,
	department VARCHAR(45),
	email VARCHAR(20) UNIQUE,
	phone VARCHAR(20) UNIQUE);
	
INSERT INTO students(first_name, last_name, homeroom_number,phone, grade_year) 
VALUES ('Mark', 'Watney', 5, '7755551234', 2035);

SELECT *
FROM students;

ALTER TABLE students
RENAME COLUMN grade_year TO grad_year;

INSERT INTO teachers(first_name, last_name, homeroom_number,department, email, phone)
VALUES ('Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '7755554321');

SELECT *
FROM teachers;

/*NULLIF Example*/
CREATE TABLE depts(
	first_name VARCHAR(50),
	departmet VARCHAR(50)
);

ALTER TABLE depts
RENAME COLUMN departmet TO department;

INSERT INTO depts(first_name, department)
VALUES ('Vinton', 'A'),
	('Lauren', 'A'),
	('Claire', 'B');
	
SELECT *
FROM depts;

SELECT (
	SUM(
		CASE WHEN
			department = 'A' THEN 1 ELSE 0 END)/
	SUM(
		CASE WHEN 
			department = 'B' THEN 1 ELSE 0 END) 
) AS department_ratio
FROM depts;

DELETE FROM depts
WHERE department = 'B';

SELECT (
	SUM(
		CASE WHEN
			department = 'A' THEN 1 ELSE 0 END)/
	NULLIF(
	SUM(
		CASE WHEN 
			department = 'B' THEN 1 ELSE 0 END),0) 
) AS department_ratio
FROM depts;

