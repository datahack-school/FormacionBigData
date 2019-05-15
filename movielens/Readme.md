# Recomendación de películas: MovieLens

Flujo de información, donde se obtiene los datos de una base de datos relacional, y se procesan con **Hive**, **Mahout** y **Pig**, con el objetivo de recomendar películas para un conjunto de usuarios, definidos en un fichero de entrada.

## Acceso a MySQL

```
mysql -u root -pcloudera movielens
```

Puedes introducir el comando `show tables;` para ver las tablas que tiene la base de datos

Teclea `quit;` para salir de la consola

## Ingesta de la información con Sqoop

```
sqoop import \
--connect jdbc:mysql://localhost/movielens \
--table movie --fields-terminated-by '\t' \
--m 1 \
--username root \
--password cloudera \
--target-dir /raw/movielens/movie

sqoop import \
--connect jdbc:mysql://localhost/movielens \
--table movierating --fields-terminated-by '\t' \
--m 1 \
--username root \
--password cloudera \
--target-dir /raw/movielens/movierating
```

## Ejecución de algoritmo de recomendación con Mahout

```
cd $HOME/Hadoop/movielens

hadoop fs -put users users

mahout recommenditembased \
    --similarityClassname SIMILARITY_EUCLIDEAN_DISTANCE \
    --input /raw/movielens/movierating \
    --output recs \
    --usersFile users
```

## Proceso de los datos con Pig

```
cd $HOME/Hadoop/movielens
pig listrecommendations.pig
```


## Estructura en Hive

```
cd $HOME/Hadoop/movielens

beeline -u jdbc:hive2:// -f create_tables.hql
```

## Preguntas adicionales

- ¿Cuál es la película más antigua en la base de datos?
- Lista el nombre y el año de todas las películas que no tienen calificación
- ¿Cuales son las 10 películas con mayor calificación?
- Genera una nueva versión de la tabla movie con dos campos nuevos:
    - numratings - El número de calificaciones por película
    - avgrating - La media de calificaciones por película
    - No incluyas las películas que no tienen calificaciones

