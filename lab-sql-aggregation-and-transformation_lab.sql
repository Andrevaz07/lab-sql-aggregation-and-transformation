USE sakila;
#1.1 Determine the shortest and longest movie durations:
SELECT 
    MIN(duration) AS min_duration,
    MAX(duration) AS max_duration
FROM 
    film;
#1.2 Express the average movie duration in hours and minutes:
SELECT 
    CONCAT(
        FLOOR(AVG(duration) / 60), 
        'hours', 
        ROUND(AVG(duration) % 60), 
        'minutes'
    ) AS average_duration
FROM 
    film;
#2.1 Calculate the number of days that the company has been operating:
SELECT 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM 
    rental;
#2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental:
SELECT 
    rental_id, 
    rental_date, 
    MONTHNAME(rental_date) AS rental_month, 
    DAYNAME(rental_date) AS rental_weekday
FROM 
    rental
LIMIT 20;
#2.3 Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week:
SELECT 
    rental_id, 
    rental_date, 
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' 
        ELSE 'workday' 
    END AS day_type
FROM 
    rental
LIMIT 20;
#3 Retrieve the film titles and their rental duration, replacing NULL values with 'Not Available' and sorting the results by film title in ascending order:
SELECT 
    title, 
    COALESCE(duration, 'Not Available') AS rental_duration
FROM 
    film
ORDER BY 
    title ASC;
#4.1 The total number of films that have been released:
SELECT COUNT(*) AS total_films_released
FROM film;
#4.2 The number of films for each rating:

SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating;

#4.3 The number of films for each rating, sorting the results in descending order of the number of films:


SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating
ORDER BY number_of_films DESC;

#5.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. Round off the average lengths to two decimal places:
SELECT 
    rating, 
    ROUND(AVG(duration), 2) AS mean_duration
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    mean_duration DESC;
#5.2 Identify which ratings have a mean duration of over two hours:
SELECT 
    rating, 
    ROUND(AVG(duration), 2) AS mean_duration
FROM 
    film
GROUP BY 
    rating
HAVING 
    mean_duration > 120;
