-- Lab SQL Queries 2.5

-- 1 select all the actors with the first name 'Scarlett'
USE sakila;

SELECT *
FROM sakila.actor
WHERE first_name = 'Scarlett';
-- Output two rows, Damon and Bening- lastnames

-- 2 how many movies are available for rent
SELECT SUM(ISNULL(return_date)) FROM sakila.rental;
-- Output: 183

-- 2.1 how many have been rented?
SELECT COUNT(rental_date-return_date) FROM sakila.rental;
-- Output: 15861

-- 3 shortest and longest movie durations
SELECT MAX(length) as max_duration FROM sakila.film;
-- Output: 185
SELECT MIN(length) as max_duration FROM sakila.film;
-- Output: 46

-- 4, average movie duration in format (hours,minutes)
SELECT AVG(CONVERT(length,TIME)) as avg_duration FROM sakila.film;
-- OUTPUT: 00:01:15

-- SELECT *, CONCAT(floor(film.length/60),':', 
-- CASE    
-- WHEN film.length - floor(film.length/60)*60 < 1 THEN '0'
-- ELSE FLOOR(film.length - floor(film.length/60)*60 )
-- END) AS hours
-- FROM sakila.film;

-- 5, Distinct actor's last names
SELECT COUNT(DISTINCT(last_name)) FROM sakila.actor;
-- Output: 121

-- 6. Since how many days has the company been oprating?

SELECT rental_date
FROM sakila.rental
ORDER BY rental_date ASC;
-- Output: 2006-02-14 the latest

SELECT last_update
FROM sakila.rental
ORDER BY last_update DESC;
-- Output: 2005-05-24

SELECT DATEDIFF(MAX(last_update),MIN(rental_date)) AS Datedifference
FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, DATE_FORMAT(rental_date,'%M') as month, DATE_FORMAT(rental_date,'%W') as weekday 
FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, DATE_FORMAT(rental_date,'%W'),
CASE
WHEN (rental_date = 'Monday') then 'workday'
WHEN (rental_date = 'Tuesday') then 'workday'
WHEN (rental_date = 'Wednesday') then 'workday'
WHEN (rental_date = 'Thursday') then 'workday'
WHEN (rental_date = 'Friday') then 'workday'
ELSE 'weekend'
END AS day_type
FROM sakila.rental;

-- 9. release years
SELECT DISTINCT(release_year) FROM sakila.film;
-- Output: 2006 (in all rows)

-- 10. films with title Armageddon

SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. films with Apollo (end title)
SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';

# 12. Get 10 the longest films.
SELECT DISTINCT length, title
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

# 13. How many films include Behind the Scenes content?
SELECT *
FROM sakila.film;

SELECT COUNT(film_id)
FROM sakila.film
WHERE special_features LIKE '%Behind_the_Scenes%';
-- Output: 538


