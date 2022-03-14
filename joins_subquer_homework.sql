--Kimbreal Homework Week5_Day3 Joins, MultiJoins, subqueries

--Ques(1): list all customers who live in texas
--I cant find Texas in city list...
SELECT first_name,last_name,customer.customer_id,city
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
WHERE city LIKE 'T%';
--------------------------------------------


--Ques(2): Get all payments above $6.99 with Customer's Full Name
SELECT first_name, last_name,amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount >= 6.99;
----------------------------------------------

--Ques(3):Show all customers names who have made payments over $175(using subqueries)
--Answer:
SELECT first_name, last_name, SUM(amount) AS amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name
HAVING SUM(amount) >= 175;
-------------------------------This code shows how to get amount over 175
SELECT customer_id, SUM(amount) AS amount
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >= 175;
--------------------------------side note block of code

SELECT first_name, last_name
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id IN (
	SELECT payment_id, SUM(amount) AS amount
	FROM payment
	GROUP BY payment_id
	HAVING SUM(amount) >= 175
);
----------------idk what im doing with subqueries i do but im scrambled



--Ques(4):List all customers that live in Nepal a country (use the city table)
SELECT first_name, last_name,