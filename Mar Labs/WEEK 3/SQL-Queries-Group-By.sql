Use sakila;

-- 1 Query
-- In the table actor, what last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1; #(i.e., have a count of 1). The output will be a list of unique last names that are not repeated in the table.

-- 2 Query
-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 3 Query
-- Using the rental table, find out how many rentals were processed by each employee. 
SELECT staff.staff_id, staff.first_name, staff.last_name, COUNT(rental.rental_id) AS num_rentals
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY staff.staff_id, staff.first_name, staff.last_name;

-- 4 Query
-- Using the film table, find out how many films there are of each rating.
SELECT rating, COUNT(*) AS num_films
FROM film
GROUP BY rating;
