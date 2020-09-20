
select * from peliculas;
SELECT * from reparto;

SELECT pelicula, año_estreno, director from peliculas INNER JOIN reparto on peliculas.id=reparto.id WHERE pelicula ='Titanic';

--4--
SELECT * from peliculas LIMIT 5;
SELECT pelicula, año_estreno, director,reparto.actores FROM peliculas 
INNER JOIN reparto 
on peliculas.id = reparto.id 
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

SELECT reparto.actores
from reparto
GROUP by actores;



--8--

SELECT pelicula, año_estreno from peliculas 
where 
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

