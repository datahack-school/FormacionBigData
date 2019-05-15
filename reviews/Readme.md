# Tratamiento de datos en formato JSON

Flujo donde se lee un fichero en formato **JSON**, se procesa con **Spark SQL**, y se almacena el resultado en un fichero con formato **Parquet**, al cuál se accede desde **Hive** / **Impala**

## Ingesta

```
cd $HOME/Hadoop/reviews

hadoop fs -rm -r /raw/reviews
hadoop fs -mkdir -p /raw/reviews
hadoop fs -put data/trustpilot_reviews_Tue.json /raw/reviews
```

## Estructura

```
cd $HOME/Hadoop/reviews

spark-submit show_struct.py /raw/reviews
```

## Procesamiento mediante Spark SQL

```
cd $HOME/Hadoop/reviews

spark-submit reviews.py 
``` 

## Lectura de la información en Hive

```
cd $HOME/Hadoop/reviews

beeline -u jdbc:hive2:// -f tabla.hql
```

## Lectura de la información en Impala

```
cd $HOME/Hadoop/reviews

impala-shell -f query.hql
```


## Extra

Datos de cambio climático en la web https://www.ncdc.noaa.gov/

El trabajo extra consiste en descargarse los datos en formato JSON y procesarlos con Spark y Hive 

En este [enlace](https://www.ncdc.noaa.gov/cdo-web/webservices/v2) podemos ver la descripción de su API