
--1.List the films where the yr is 1962 [Show id, title]
	SELECT id, title
    FROM movie
    WHERE yr=1962;
	
--2. Give year of 'Citizen Kane'.
	SELECT yr
	FROM movie
	WHERE title ='Citizen Kane';
	
--3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). 
--   Order results by year.
	SELECT id, title, yr
	FROM movie
	WHERE title LIKE 'Star Trek%'
	ORDER BY yr;
	
--4.What id number does the actor 'Glenn Close' have?
	SELECT id
    FROM actor
    WHERE name = 'Glenn Close';

--5. What is the id of the film 'Casablanca'
	SELECT id
	FROM movie
	WHERE title = 'Casablanca';

--6. Obtain the cast list for 'Casablanca'.Use movieid= (whatever value you got from the previous question)
	SELECT name
	FROM actor JOIN casting ON (actor.id = casting.actorid)
	WHERE movieid = 27;
	
--7. Obtain the cast list for the film 'Alien'
	SELECT name
	FROM actor JOIN casting ON (actor.id = casting.actorid) 
			   JOIN movie ON (casting.movieid = movie.id)
	WHERE title = 'Alien';

--8. List the films in which 'Harrison Ford' has appeared
	SELECT title
	FROM movie JOIN casting ON (movie.id = casting.movieid)
			   JOIN actor ON (actor.id = casting.actorid)
	WHERE name = 'Harrison Ford';

--9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. 
--   If ord=1 then this actor is in the starring role]
	SELECT title
	FROM movie JOIN casting ON (movie.id = casting.movieid)
			   JOIN actor ON (actor.id = casting.actorid)
	WHERE name = 'Harrison Ford' AND ord != 1;

--10. List the films together with the leading star for all 1962 films.
	SELECT title, name
	FROM movie JOIN casting ON movie.id = casting.movieid
	           JOIN actor ON casting.actorid = actor.id
	WHERE yr = 1962 AND ord = 1;

--11. Which were the busiest years for 'Rock Hudson', show the year and the number of 
--movies he made each year for any year in which he made more than 2 movies.
	SELECT yr,COUNT(title) FROM
	  movie JOIN casting ON movie.id = movieid
			JOIN actor   ON actorid = actor.id
	WHERE name=' Rock Hudson'
	GROUP BY yr
	HAVING COUNT(title) > 1;

--12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
--    Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).
--     Title is not a unique field, create a table of IDs in your subquery
	SELECT title, name
	FROM movie JOIN casting ON (movieid = movie.id AND ord=1)
			   JOIN actor ON (actorid = actor.id)
	WHERE movie.id IN (SELECT movieid FROM casting
				 WHERE actorid IN (SELECT id FROM actor 
					  WHERE name='Julie Andrews'))




