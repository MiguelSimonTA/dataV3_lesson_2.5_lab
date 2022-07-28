/*
Instructions
- Select all the actors with the first name ‘Scarlett’.
- How many films (movies) are available for rent and how many films have been rented?
- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
- What's the average movie duration expressed in format (hours, minutes)?
- How many distinct (different) actors' last names are there?
- Since how many days has the company been operating (check DATEDIFF() function)?
- Show rental info with additional columns month and weekday. Get 20 results.
- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
- Get release years.
- Get all films with ARMAGEDDON in the title.
- Get all films which title ends with APOLLO.
- Get 10 the longest films.
- How many films include Behind the Scenes content?
*/
-- Select all the actors with the first name ‘Scarlett’.

SELECT *
FROM sakila.actor
WHERE first_name IN ('SCARLETT');

-- How many films (movies) are available for rent and how many films have been rented?

SELECT *
FROM sakila.film;


SELECT COUNT( DISTINCT rental_duration)
FROM sakila.film
GROUP BY rental_duration;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MIN(rental_duration) as min_duration, MAX(rental_duration) as max_duration
FROM sakila.film
ORDER BY rental_duration;

-- What's the average movie duration expressed in format (hours, minutes)?

SELECT AVG(rental_duration)
FROM sakila.film;

SELECT DATE_FORMAT(FROM_UNIXTIME(AVG(rental_duration)), "%k %i") as Average_movie_duration
FROM sakila.film;

-- How many distinct (different) actors' last names are there?

SELECT DISTINCT(last_name) 
FROM sakila.actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DISTINCT(DATEDIFF('2005-05-24','2006-02-14'))
FROM sakila.rental;

SELECT *
FROM sakila.rental
ORDER BY rental_date DESC;

-- Show rental info with additional columns month and weekday. Get 20 results.

SELECT DATE_FORMAT(rental_date, "%m") as Month_Name, DATE_FORMAT(rental_date, "%W") as Weekday_Name
FROM sakila.rental
ORDER BY rental_date DESC
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, DATE_FORMAT(rental_date, "%a %v") as day_type
FROM sakila.rental
ORDER BY rental_date DESC;

-- Get release years.

SELECT DISTINCT(release_year)
FROM sakila.film;


-- Get all films with ARMAGEDDON in the title.

SELECT *
FROM sakila.film
WHERE title LIKE "%ARMAGEDDON%";


-- Get all films which title ends with APOLLO.

SELECT *
FROM sakila.film
WHERE title LIKE "%APOLLO";

-- Get 10 the longest films.
SELECT DISTINCT(length)
FROM sakila.film
GROUP BY length
HAVING MAX(length) > 100
ORDER BY length DESC
LIMIT 10;

-- How many films include Behind the Scenes content?

SELECT DISTINCT(special_features)
FROM sakila.film
WHERE title REGEXP "beh"; 


