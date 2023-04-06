USE sakila;

-- 1 Subquery
-- List all films whose length is longer than the average of all the films.               
SELECT title
FROM film 
WHERE length > (SELECT AVG(length) 
					FROM film);
   
-- 2 Subquery
-- How many copies of the film Hunchback Impossible exist in the inventory system?alter
SELECT COUNT(inventory_id) # COUNT(*) es lo mismo que COUNT(inventory_id) para suma
FROM inventory
WHERE film_id IN (SELECT film_id
					FROM film
					WHERE title = 'Hunchback Impossible');

-- 3 Subquery
-- Use subqueries to display all actors who appear in the film Alone Trip.
SELECT First_name, Last_name
FROM actor
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
                    WHERE film_id IN (SELECT film_id
										FROM film
                                        WHERE title = 'Alone Trip'));

-- 4 Subquery                                      
-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title
FROM film
WHERE film_id IN (SELECT film_id
					FROM film_category
                    WHERE category_id IN (SELECT category_id
											FROM category
                                            WHERE name = 'family'));

-- 5 Subquery
-- Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT First_name, Last_name, email
FROM customer
WHERE address_id IN (
					SELECT address_id
					FROM address
                    WHERE city_id IN (
										SELECT city_id
                                        FROM city
                                        WHERE country_id IN (
															SELECT country_id
                                                            FROM country
                                                            WHERE country = 'Canada')));

# Same with JOINS.  
SELECT a.first_name, a.last_name, a.email 
FROM customer as a 
	INNER JOIN address 
	USING (address_id)     
		INNER JOIN city 
		USING (city_id)          
			INNER JOIN country USING (country_id)             
			WHERE country = 'Canada';

# Using LEFT JOIN
SELECT a.first_name, a.last_name, a.email 
FROM customer AS a 
LEFT JOIN address AS ad ON a.address_id = ad.address_id
LEFT JOIN city AS c ON ad.city_id = c.city_id
LEFT JOIN country AS ct ON c.country_id = ct.country_id
WHERE ct.country = 'Canada';

# Using INNER JOIN
SELECT a.first_name, a.last_name, a.email 
FROM customer AS a 
INNER JOIN address AS ad ON a.address_id = ad.address_id
INNER JOIN city AS c ON ad.city_id = c.city_id
INNER JOIN country AS ct ON c.country_id = ct.country_id
WHERE ct.country = 'Canada';

