/* The Complete SQL Bootcamp 2022: Go from Zero to Hero */
/* Practice Challenges*/ 
/* Business Situation: 
We want to send out a promotional email to our existing customers!*/
SELECT first_name, last_name, email
FROM customer;

/* Visitor from outside the US isn't familiar with MPAA movie ratings. 
What types of ratings we have in our database. What ratings do we have available?*/
SELECT DISTINCT rating
FROM film;

/* A customer forgot their wallet at our store! We need to track down their email
to inform them. What is the email for the customer with the name Nancy Thomas?*/
SELECT email
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

/* A customer wants to know what the movie “Outlaw Hanky” is about. 
Could you give them the description for the movie “Outlaw Hanky”?*/
SELECT description 
FROM film
WHERE title = 'Outlaw Hanky';

/*A customer is late on their movie return, we’ve mailed them a letter to their 
address at ‘259 Ipoh Drive’. We should also call them on the phone to let them know. 
Can you get the phone number for the customer who lives at ‘259 Ipoh Drive’?*/
SELECT *
FROM address
LIMIT 10;

SELECT phone 
FROM address
WHERE address = '259 Ipoh Drive';

/*We want to reward our first 10 paying customers. 
What are the customer IDs of the first 10 customers who created a payment?*/
SELECT *
FROM payment
LIMIT 10;

SELECT customer_id
FROM payment 
ORDER BY payment_date
LIMIT 10;

SELECT p.customer_id, c.email 
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
ORDER BY p.payment_date
LIMIT 10;

/*A customer wants to quickly rent a video to watch over their short lunch break. 
What are the titles of the 5 shortest (in length of runtime) movies?*/
SELECT *
FROM film
LIMIT 10;

SELECT title, length
FROM film 
ORDER BY length ASC
LIMIT 5;

/*If the previous customer can watch any movie that is 
50 minutes or less in run time, how many options does she have?*/
SELECT title, length 
FROM film
WHERE length <= 50
ORDER BY length ASC;
/*37 options*/

/*General Challenge 1*/ 
/*How many payment transactions were greater than $5.00?*/
SELECT *
FROM payment
LIMIT 5;

SELECT COUNT(amount)
FROM payment
WHERE amount > 5.00;

/*How many actors have a first name that starts with the letter P?*/
SELECT COUNT(first_name)
FROM actor 
WHERE first_name LIKE 'P%'

/*How many unique districts are our customers from?*/
SELECT COUNT(DISTINCT (district))
FROM address;

/*Retrieve the list of names for those distinct districts from the 
previous question*/
SELECT DISTINCT(district)
FROM address;

/*How many films have a rating of R and a replacement cost 
between $5 and $15?*/
SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;
/*52*/

/*How many films have the word Truman somewhere in the title*/
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';
/*5*/

/* Practice Challenges*/ 
/*We have two staff members, with Staff IDs 1 and 2. We want to give a bonus 
to the staff member that handled the most payments. (Most in terms of number of 
payments processed, not total dollar amount). How many payments did each staff 
member handle and who gets the bonus?*/
SELECT *
FROM payment
LIMIT 10;

SELECT staff_id, COUNT(amount)
FROM payment
GROUP BY staff_id;

/*Corporate HQ is conducting a study on the relationship between replacement cost 
and a movie MPAA rating (e.g. G. PG, R, etc…). What is the average replacement cost 
per MPAA rating?*/
SELECT rating, ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

/*We are running a promotion to reward our top 5 customers with coupons. 
What are the customer IDs of the top 5 customers by total spend?*/
SELECT customer_id, SUM(amount) AS total_spend
FROM payment 
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 5;

/*We are launching a platinum service for our most loyal customers. We will assign
platinum status to customers that have had 40 or more transaction payments. 
What customer_ids are eligible for platinum status?*/
SELECT customer_id, COUNT(*)
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40;

/*What are the customer IDs of customers who have spent more than $100 in payment 
transactions with our staff_id member 2?*/
SELECT customer_id, SUM(amount) AS total_amount
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;

/*Assessment Test 1 
1. Return the customer IDs of customers who have spent at least $110 with 
the staff member who has an ID of 2.
The answer should be customers 187 and 148.
2. How many films begin with the letter J?
The answer should be 20.
3. What customer has the highest customer ID number whose name starts with 
an 'E' and has an address ID lower than 500?
The answer is Eddie Tomlin*/
/*1.*/
SELECT customer_id, SUM(amount) AS total_amount
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

/*2.*/
SELECT COUNT(*)
FROM film
WHERE title LIKE 'J%';

/*3.*/
SELECT customer_id, first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

/*JOINS Challenges*/
/*California sales tax laws have changed and we need to alert our customers 
to this through email. What are the emails of the customers who live in California?*/
SELECT c.email
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE a.district = 'California';

/*A customer walks in and is a huge fan of the actor “Nick Wahlberg” and wants 
to know which movies he is in. Get a list of all the movies “Nick Wahlberg”
has been in.*/
SELECT f.title, a.first_name, a.last_name
FROM film_actor fa
JOIN actor a 
ON fa.actor_id = a.actor_id
JOIN film f
ON fa.film_id = f.film_id
WHERE a.first_name = 'Nick' AND a.last_name = 'Wahlberg';

/*CASE Challenge Task*/
/*We want to know and compare the various amounts of films we have per 
movie rating. Use CASE and the dvdrental database to re-create a table (example provided)*/
SELECT 
	SUM(
		CASE rating
			WHEN 'R' THEN 1 ELSE 0
	END) AS r,
	SUM(
		CASE rating
			WHEN 'PG' THEN 1 ELSE 0
	END) AS pg,
		SUM(
		CASE rating
			WHEN 'PG-13' THEN 1 ELSE 0
	END) AS pg_13
FROM film;

/*CAST Example*/ 
SELECT CAST(inventory_id AS VARCHAR)
FROM rental;

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR))
FROM rental;

/*VIEWS Example*/
SELECT first_name, last_name, address
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id;

CREATE VIEW customer_info_1 AS
SELECT first_name, last_name, address
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id;

SELECT *
FROM customer_info_1;

CREATE OR REPLACE VIEW customer_info_1 AS
SELECT first_name, last_name, address, district
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id;

SELECT *
FROM customer_info_1;

ALTER VIEW customer_info_1 RENAME to c_info;

DROP VIEW IF EXISTS c_info;


