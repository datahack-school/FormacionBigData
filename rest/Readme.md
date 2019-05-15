# REST Api

Este proceso lee un fichero en el filesystem local y lo graba en una base de datos **MongoDB**. Los datos son accesibles a través de una **API Rest** y publicados en una web

## Ingesta de datos

En este caso la ingesta de datos se puede realizar utilizando 2 métodos distintos:

* Utilizar **Spark SQL** para exportar directamente una DataFrame a Mongo
* Utilizar **Spark básico** y procesar una RDD


### Opción 1 - Utilización de Spark SQL

```
cd $HOME/Hadoop/rest

spark-submit \
        --conf "spark.mongodb.output.uri=mongodb://127.0.0.1/data.executives" \
        --packages org.mongodb.spark:mongo-spark-connector_2.11:2.2.1,\
com.databricks:spark-csv_2.11:1.5.0 \
        export_mongo_df.py

```

### Opción 2 - Utilización de Spark Base con RDDs

```
cd $HOME/Hadoop/rest

spark-submit \
    --jars $HOME/Hadoop/lib/mongo-hadoop-spark-2.0.2.jar,\
$HOME/Hadoop/lib/mongo-java-driver-3.4.0.jar \
    --driver-class-path $HOME/Hadoop/lib/mongo-hadoop-spark-2.0.2.jar,\
$HOME/Hadoop/lib/mongo-java-driver-3.4.0.jar \
    export_mongo.py
``` 

## Api REST


```
cd $HOME/Hadoop/rest/api

python api_rest.py

curl -X GET http://localhost:5000/executive
curl -X GET http://localhost:5000/executive/Russell%20Jurney

curl -X GET http://localhost:5000/apidocs

```



## Servidor Web

```
cd $HOME/Hadoop/rest/web
python web_server.py
```

Puedes acceder a la página web en la siguiente [dirección](http://localhost:5001/)