DROP TABLE reparto;
DROP TABLE peliculas;

--1--
-- sebastianandres=# CREATE DATABASE peliculas;
-- \c peliculas;

--2--

CREATE TABLE peliculas(
    id INT, 
    PRIMARY KEY(id), 
    Pelicula varchar(70),
    Año_estreno INT,
    Director varchar(25)
);

CREATE TABLE reparto(
    Id INT,
    FOREIGN KEY(id) REFERENCES peliculas(id),
    Actores varchar(50)

);

--3--
\copy peliculas from '/Users/sebastianandres/Desktop/data_base_movies/peliculas.csv' csv header;
\copy reparto FROM '/Users/sebastianandres/Desktop/data_base_movies/reparto.csv' csv;

--4--

SELECT pelicula, año_estreno, director, reparto.actores 
FROM peliculas 
INNER JOIN reparto 
ON peliculas.id = reparto.id 
where pelicula = 'Titanic';
--5--

SELECT pelicula, reparto.actores from peliculas
inner join reparto
on peliculas.id = reparto.id
where actores = 'Harrison Ford';

--6--

SELECT peliculas.director, count(*)
from peliculas
group by director 
ORDER BY count(*) DESC LIMIT 10;

--7--


SELECT count (DISTINCT reparto.actores) as total_row 
from reparto;

--8--

SELECT pelicula, año_estreno from peliculas 
WHERE
peliculas.año_estreno >=1990 and peliculas.año_estreno<= 1999
ORDER by peliculas.año_estreno ASC;

--9-- 

SELECT peliculas.pelicula as Taquilla_2001, reparto.actores FROM peliculas 
JOIN reparto
ON peliculas.id= reparto.id
where peliculas.año_estreno ='2001';

--10--

SELECT peliculas.pelicula,peliculas.año_estreno, reparto.actores from peliculas
JOIN reparto
on peliculas.id = reparto.id
where peliculas.año_estreno IN
(SELECT MAX(peliculas.año_estreno)FROM peliculas);