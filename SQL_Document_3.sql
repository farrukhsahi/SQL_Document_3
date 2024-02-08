-- 1. List all customers who live in Texas (use JOINs)
SELECT customer.*
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT payment.amount, CONCAT(customer.first_name, ' ', customer.last_name) AS full_name
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);

-- 4. List all customers that live in Nepal (use the city table)
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT CONCAT(s.first_name, ' ', s.last_name) AS staff_name, COUNT(*) AS transaction_count
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id
ORDER BY transaction_count DESC
LIMIT 1;

-- 6. How many movies of each rating are there?
SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT p.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS full_name, p.payment_id, p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
WHERE p.amount > 6.99
AND p.customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(*) = 1
    AND SUM(amount) > 6.99
);

-- 8. How many free rentals did our stores give away?
-- I could not find a table with rental amount.












