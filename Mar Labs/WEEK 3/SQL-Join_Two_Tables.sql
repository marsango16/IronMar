USE sakila;

-- 1 Query 
-- Which actor has appeared in the most films?
SELECT CONCAT(actor.First_name, ' ', actor.Last_name) AS Full_name, COUNT(film.film_id) AS total_films
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
GROUP BY actor.actor_id, actor.First_name, actor.Last_name
ORDER BY total_films DESC
LIMIT 1;

-- 2 Query 
-- Most active customer (the customer that has rented the most number of films)
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS Full_name, COUNT(rental.rental_id) AS total_rentals
FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total_rentals DESC
LIMIT 1;

-- 3 Query 
-- List number of films per category.
SELECT category.name AS Category, COUNT(*) AS Number_of_films
FROM film_category
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

-- 4 Query
-- Display the first and last names, as well as the address, of each staff member.
SELECT CONCAT(staff.first_name, ' ', staff.last_name) AS Full_name, address.address AS Address
FROM staff
INNER JOIN address ON address.address_id = staff.address_id;

-- 5 Query
-- Get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT film.title AS Film, language.name AS Language
FROM film
INNER JOIN language ON film.language_id = language.language_id
WHERE language.name IN('English', 'Italian');

-- 6 Query
-- Display the total amount rung up by each staff member in August of 2005.
SELECT a.first_name, a.last_name, sum(b.amount)
FROM staff AS a 
INNER JOIN payment AS b
USING (staff_id)
WHERE payment_date > "2005-08-01" AND payment_date < "2005-08-31"
GROUP BY staff_id
ORDER BY staff_id DESC;

-- 7 Query
-- List each film and the number of actors who are listed for that film.
SELECT film.title AS Film, COUNT(*) AS Actor_count 
FROM film 
INNER JOIN film_actor ON film.film_id = film_actor.film_id 
GROUP BY film.title;

-- 8 Query
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT customer.last_name AS Last_name, COUNT(payment.payment_id) AS Total_amount
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY Last_name ASC;

-- 9 Query
-- Write sql statement to check if you can find any actor who never participated in any film.
SELECT ac.first_name, ac.last_name AS Full_name
FROM actor; 