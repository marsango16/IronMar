-- 1. Review the tables in the database. --
USE Sakila;
-- 2. Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT first_name, last_name FROM actor;
-- 3. Select one column from a table. Get film titles. --
SELECT title FROM film;
-- 4. Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future. --
SELECT language_id FROM language;
-- 5.1 Find out how many stores does the company have? --
SELECT store_id FROM store;
-- 5.2 Find out how many employees staff does the company have? --
SELECT staff_id FROM staff;
-- 5.3 Return a list of employee first names only? -- 
SELECT first_name FROM staff;


USE bank;

-- Query 1
-- Get the id values of the first 5 clients from district_id with a value equal to 1. --
SELECT client_id FROM client
ORDER BY district_id
LIMIT 5;

-- Query 2
-- In the client table, get an id value of the last client where the district_id is equal to 72. --
SELECT client_id FROM client
WHERE client_id = 72
ORDER BY client_id DESC;

-- Query 3
-- Get the 3 lowest amounts in the loan table. --
SELECT amount FROM loan
ORDER BY amount ASC
LIMIT 3;

-- Query 4
-- What are the possible values for status, ordered alphabetically in ascending order in the loan table? --
SELECT DISTINCT status
FROM loan
ORDER BY status ASC;

-- Query 5
-- What is the loan_id of the highest payment received in the loan table? -- 
SELECT loan_id 
FROM loan
ORDER BY amount DESC
LIMIT 1;

-- Query 6
-- What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount --
SELECT account_id, amount
FROM loan
ORDER BY account_id ASC
LIMIT 5;

-- Query 7
-- What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table? --
SELECT account_id, amount
FROM loan
WHERE duration = 60
ORDER BY amount ASC
LIMIT 5;

-- Query 8
-- What are the unique values of k_symbol in the order table? --
SELECT DISTINCT k_symbol
FROM bank.order;

-- Query 9
-- In the order table, what are the order_ids of the client with the account_id 34? --
SELECT account_id, order_id
FROM bank.order
WHERE account_id = 34;

-- Query 10
-- In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)? --
SELECT account_id, order_id
FROM bank.order
WHERE order_id BETWEEN 29540 AND 29560
ORDER BY order_id, account_id DESC;

-- Query 11
-- In the order table, what are the individual amounts that were sent to (account_to) id 30067122? --
SELECT amount
FROM bank.order
WHERE account_to = 30067122;

-- Query 12
-- In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest. --
SELECT trans_id, date, type, amount
FROM trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;

-- Query 13
-- In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order. --
SELECT district_id, COUNT(*) AS client
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;

-- Query 14
-- In the card table, how many cards exist for each type? Rank the result starting with the most frequent type. --
SELECT type, COUNT(*) AS card
FROM card
GROUP BY type
ORDER BY card DESC;

-- Query 15
-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts. --
SELECT account_id, SUM(amount) AS total_loan_amount
FROM loan
GROUP BY account_id
ORDER BY total_loan_amount DESC
LIMIT 10;








