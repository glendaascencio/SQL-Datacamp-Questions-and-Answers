/* Get all details for Spanish language films released after 2000, but before 2010.
*/
select *
from films
where language = 'Spanish'
    and release_year > 2000 
    and release_year < 2010;

/* Write a query to get the title and release year of films released in the 90s which were in French or Spanish and which took in more than $2M gross.*/

SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish')
AND (gross >= 2000000);

/* Get the title and release year for films released in the 90s.*/
select title, release_year
from films
where release_year >= 1900 AND release_year < 2000;


/* Take a go at using BETWEEN with AND on the films data to get the title and release year of all Spanish language films released between 1990 and 2000 (inclusive) with budgets over $100 million. We have broken the problem into smaller steps so that you can build the query as you go along!*/
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND (language = 'Spanish' or language = 'French');


/* Get the names of all people whose names begin with 'B'. The pattern you need is 'B%' */
select name
from people
where name like 'B%';

/* Get the names of people whose names have 'r' as the second letter. The pattern you need is '_r%'*/
select name
from people
where name like '_r%';

/* Get the names of people whose names don't start with A. The pattern you need is 'A%'*/
select name
from people
where name not like 'A%';

/* Get the amount grossed by the worst performing film in 1994.*/
select min(gross)
from films
where release_year = 1994;

/* Get the amount grossed by the best performing film between 2000 and 2012, inclusive.*/
select max(gross)
from films
where release_year between 2000 and 2012;

/* Get the title and net profit (the amount a film grossed, minus its budget) for all films. Alias the net profit as net_profit.*/
select title, (gross - budget) as net_profit
from films;

/* Get the title and duration in hours for all films. The duration is in minutes, so you'll need to divide by 60.0 to get the duration in hours. Alias the duration in hours as duration_hours.*/
select title, duration/60.0 as duration_hours
from films;

/*Get the average duration in hours for all films, aliased as avg_duration_hours. */
select avg(duration)/60.0 as avg_duration_hours
from films;


/*Get the percentage of people who are no longer alive. Alias the result as percentage_dead. Remember to use 100.0 and not 100! */
-- get the count(deathdate) and multiply by 100.0
-- then divide by count(*)
select count(deathdate)*100.0 / count(*) as percentage_dead
from people;


/* Get the number of years between the newest film and oldest film. Alias the result as difference.*/
select max(release_year) - min(release_year) as difference
from films;

/* Get the number of decades the films table covers. Alias the result as number_of_decades. The top half of your fraction should be enclosed in parentheses. */
select (max(release_year) - min(release_year))/10 as number_of_decades
from films;

/* Get the names of people from the people table, sorted alphabetically. */
select name
from people
order by name;

/* Get the birth date and name for every person, in order of when they were born. */
select birthdate, name
from people
order by birthdate;

/* Get the title of films released in 2000 or 2012, in the order they were released. */
select title
from films
where release_year = 2000 or release_year = 2012
order by release_year;

/* Get all details for all films except those released in 2015 and order them by duration. */
select *
from films
where release_year != 2015
order by duration;


/* Get the title and gross earnings for movies which begin with the letter 'M' and order the results alphabetically. */
select title, gross
from films
where title like 'M%'
order by title asc;

/* Get the IMDB score and film ID for every film from the reviews table, sorted from highest to lowest score. */
select imdb_score, film_id
from reviews
order by imdb_score desc;


/* Get the title for every film, in reverse order. */
select title
from films
order by title desc;

/*Get the title and duration for every film, in order of longest duration to shortest. */
select title, duration
from films
order by duration desc;


/* Get the birth date and name of people in the people table, in order of when they were born and alphabetically by name.*/
select birthdate, name
from people
order by birthdate, name;


/* Get the release year, duration, and title of films ordered by their release year and duration. */
select release_year, duration, title 
from films
order by release_year, duration;



/*Get certifications, release years, and titles of films ordered by certification (alphabetically) and release year. */
select certification, release_year, title
from films
order by certification, release_year;



/* Get the names and birthdates of people ordered by name and birth date.*/
select name, birthdate
from people
order by name, birthdate;


/* Get the release year and count of films released in each year. */
select release_year, count(*)
from films
group by release_year
order by count desc;


/*Get the release year and average duration of all films, grouped by release year. */
select release_year, avg(duration)
from films
group by release_year
order by avg desc;

/*Get the release year and largest budget for all films, grouped by release year. */
select release_year, max(budget)
from films
group by release_year
order by max desc;


/* Get the IMDB score and count of film reviews grouped by IMDB score in the reviews table */
select imdb_score, count(*)
from reviews
group by imdb_score;

/* Get the release year and lowest gross earnings per release year. */
select release_year, min(gross)
from films
group by release_year
order by min desc;


/* Get the language and total gross amount films in each language made. */
select language, sum(gross)
from films
group by language
order by sum desc;

/* Get the country and total budget spent making movies in each country. */
select country, sum(budget)
from films
group by country
order by sum desc;

/* Get the release year, country, and highest budget spent making a film for each year, for each country. Sort your results by release year and country. */
select release_year, country, max(budget)
from films
group by release_year, country
order by release_year, country;

/* Sample: shows only those years in which more than 10 films were released.*/
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;

/*In how many different years were more than 200 movies released? */
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 200;


/* Now you're going to write a query that returns the average budget and average gross earnings for films in each year after 1990, if the average budget is greater than $60 million. */

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000;
/* */


/* Get the release year, budget and gross earnings for each film in the films table. */
select release_year, budget, gross
from films;

/* Modify your query so that only records with a release_year after 1990 are included. */
SELECT release_year, budget, gross
FROM films
WHERE  release_year > 1990;

/* Remove the budget and gross columns, and group your results by release year. */
SELECT release_year
FROM films
WHERE release_year > 1990
group by release_year;

/* Modify your query to include the average budget and average gross earnings for the results you have so far. Alias the average budget as avg_budget; alias the average gross earnings as avg_gross */
SELECT release_year, 
    avg(budget) as avg_budget, 
    avg(gross) as avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;

/* Modify your query so that only years with an average budget of greater than $60 million are included. */
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING avg(budget) > 60000000;

/*Get the country, average budget, and average gross take of countries that have made more than 10 films. Order the result by country name, and limit the number of results displayed to 5. You should alias the averages as avg_budget and avg_gross respectively. */
-- select country, average budget, 
--     and average gross
-- from the films table
-- group by country 
-- where the country has more than 10 titles
-- order by country
-- limit to only show 5 results
select country, avg(budget) as avg_budget, avg(gross) as avg_gross
from films
group by country
having count(title) >= 10
order by country
limit 5;

/* What is the IMDB score for the film To Kill a Mockingbird? */
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id = reviews.film_id
WHERE title = 'To Kill a Mockingbird';
-- Answer: 8.4















