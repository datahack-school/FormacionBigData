## Respuestas a las preguntas del 'Recomentador de películas'


* ¿Cuál es la película más antigua en la base de datos?

```
select * from movielens.movie
where year <> 0
order by year asc
limit 1
```

* Lista el nombre y el año de todas las películas que no tienen calificación
    
```
select * 
from movielens.movie a
where a.id not in (select movieid from  movielens.movierating) 
```

* ¿Cuales son las 10 películas con mayor calificación?

```
with best as (
    select * from movielens.movierating
    order by rating desc
    limit 10
) 
select name 
from movielens.movie 
inner join best on (best.movieid = movie.id)
```

* Genera una nueva versión de la tabla movie con dos campos nuevos:
    numratings - El número de calificaciones por película
    avgrating - La media de calificaciones por película
    No incluyas las películas que no tienen calificaciones

```
create table movie2 as
with datos as (
    select movieid, 
    count(*) as numratings,
    avg(rating) as avgrating 
    from movielens.movierating
    group by movieid
)
select id, name, year, numratings, avgrating 
from movielens.movie 
inner join datos on (datos.movieid = movie.id)
```