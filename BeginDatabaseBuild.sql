/*Process of building a database with tables containing semester enrollment data, 
I've inported csv files of the semester data for 14 semesters to build this 
database, creating a table for each, the following process is the beginning
stages of me cleaning the data*/
SELECT * 
FROM course_schedule_data.fall_2015;

SELECT *
FROM course_schedule_data.fall_2015
WHERE Course_Number = ' 301H';

SELECT *
FROM course_schedule_data.fall_2015
WHERE Course_Number = ' 320M' OR Course_Number = ' 328M';
/*Testing table joins to see results*/
SELECT *
FROM course_schedule_data.fall_2015 c5
JOIN course_schedule_data.spring_2016 c6
ON c5.Course_Number = c6.Course_Number
GROUP BY c6.Term_Code;
/*Beginning process of cleaning data, in this section I am altering the 
table to change the data type for a column “Course_Number” from an integer 
to a VARCHAR, these course numbers contain both numbers and letters, so this 
change was necessary to return results that contained non-numerical data*/
ALTER TABLE `course_schedule_data`.`fall_2017` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`fall_2018` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`fall_2019` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`fall_2020` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`fall_2021` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`spring_2016` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`spring_2017` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`spring_2018` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`spring_2019` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`spring_2020` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`spring_2021` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

ALTER TABLE `course_schedule_data`.`spring_2022` 
CHANGE COLUMN `Course_Number` `Course_Number` VARCHAR(10) NULL DEFAULT NULL ;

SELECT LTRIM(' 320M')
FROM course_schedule_data.fall_2015;

SELECT Term_Code, FOS, LENGTH(Course_Number), LTRIM(Course_Number) AS Left_Trim_String
FROM course_schedule_data.fall_2015
;

UPDATE `course_schedule_data`.`fall_2015` SET Course_Number = REPLACE(Course_Number, ' ', '');

SELECT *
FROM course_schedule_data.fall_2015;
/*Continuing process of cleaning data, in this section I am working 
through solutions to trim the blank space from the “Course_Number” column*/
SELECT *
FROM course_schedule_data.fall_2015
WHERE Course_Number = '328M' OR Course_Number = '301';

SELECT CSN, UNQ_number, FOS, Course_Number, SUM(12THDAY_Enrollment)
FROM course_schedule_data.fall_2015
WHERE Course_Number = '328M';

UPDATE `course_schedule_data`.`spring_2022` SET Course_Number = REPLACE(Course_Number, ' ', '');

SELECT *
FROM course_schedule_data.spring_2022;

UPDATE `course_schedule_data`.`spring_2021` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`spring_2020` SET Course_Number = REPLACE(Course_Number, ' ', '');

UPDATE `course_schedule_data`.`spring_2019` SET Course_Number = REPLACE(Course_Number, ' ', '');

SELECT *
FROM course_schedule_data.spring_2021
WHERE Course_Number = '220C';

UPDATE `course_schedule_data`.`spring_2018` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`spring_2017` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`spring_2016` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`fall_2021` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`fall_2020` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`fall_2019` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`fall_2018` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`fall_2017` SET Course_Number = REPLACE(Course_Number, ' ', '');
UPDATE `course_schedule_data`.`fall_2016` SET Course_Number = REPLACE(Course_Number, ' ', '');

/*Continuing process of cleaning data, in this section I am working to remove 
a trailing “;” from the instructor name column (names anonymized in this example)*/
SELECT 
	CSN, 
    UNQ_number, 
    FOS, 
    Course_Number, 
    INST_NAME, 
    12THDAY_Enrollment, 
    Total_12THDAY_Enrollment
FROM course_schedule_data.spring_2022
WHERE INST_NAME = 'SMITH, J;';

SELECT 
	CSN, 
    UNQ_number, 
    FOS, 
    Course_Number, 
    INST_NAME, 
    12THDAY_Enrollment, 
    Total_12THDAY_Enrollment
FROM course_schedule_data.spring_2022
WHERE INST_NAME = 'SMITH, J;';

UPDATE `course_schedule_data`.`fall_2015` SET INST_NAME = TRIM(TRAILING ';' FROM INST_NAME);

SELECT *
FROM course_schedule_data.fall_2015;

SELECT 
	CSN, 
    UNQ_number, 
    FOS, 
    Course_Number, 
    INST_NAME, 
    12THDAY_Enrollment, 
    Total_12THDAY_Enrollment
FROM course_schedule_data.fall_2015
WHERE INST_NAME = 'SMITH, J';

SELECT 
	CSN, 
    UNQ_number, 
    FOS, 
    Course_Number, 
    12THDAY_Enrollment, 
    Total_12THDAY_Enrollment
FROM course_schedule_data.fall_2015
WHERE INST_NAME LIKE '%B%';

SELECT c5.*, c6.*
FROM fall_2015 c5
CROSS JOIN fall_2016 c6;

SELECT c5.*, c6.*
FROM fall_2015 c5
CROSS JOIN fall_2016 c6
WHERE c6.Course_Number = '301H';

SELECT *
FROM spring_2022;

/*Example of a query that would be used to help answer a business question, 
how many students were enrolled on the 12th day in courses 301 and 302 in 
spring 2022 – this data may be used as a point of reference in predicting the 
number of seats needed in spring 2023*/
SELECT SUM(12THDAY_Enrollment), Course_Number
FROM spring_2022
WHERE Course_Number = '301' OR Course_Number = '302'
GROUP BY Course_Number; 