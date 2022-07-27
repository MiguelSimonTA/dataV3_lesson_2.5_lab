-- 1.Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2.How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(film_id) as film_number FROM sakila.inventory;

-- 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM sakila.film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?
SELECT * FROM sakila.film;
SELECT hour(length) FROM sakila.film;
SELECT CONCAT(FLOOR(avg(length)/60),'h ',round(MOD(avg(length),60)),'m') as mean_duration FROM sakila.film;


-- 5.How many distinct (different) actors' last names are there?
SELECT count(distinct last_name) FROM sakila.actor;

-- 6.Since how many days has the company been operating (check DATEDIFF() function)?
SELECT * FROM sakila.payment;
SELECT DATEDIFF('2005-08-23' ,'2005-05-25');

-- 7.Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM sakila.rental;
SELECT *,date_format(rental_date,'%M') AS month,date_format(rental_date,'%W') AS weekday FROM sakila.rental;

-- 8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,weekday(rental_date) as day_type FROM sakila.rental;

-- 9.Get release years.
SELECT release_year FROM sakila.film;

-- 10.Get all films with ARMAGEDDON in the title.
SELECT *,title FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11.Get all films which title ends with APOLLO.
SELECT *,title FROM sakila.film
WHERE title LIKE '%APOLLO';


-- 12.Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13.How many films include Behind the Scenes content?
SELECT COUNT(film_id) FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';







