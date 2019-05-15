# Ingesta de precios de combustible en tiempo real

Ingesta en tiempo real de datos de un servicio **REST**, almacenamiento en **HDFS**, proceso de los datos en **Hive** y acceso a través de **Impala**

## Obtención de datos

Comunidades autónomas 

```
cd $HOME/Hadoop/precios

get_data.sh \
    --name ccaa \
    --dir data \
    --format csv \
    --header \
    https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/\
PreciosCarburantes/Listados/ComunidadesAutonomas/ 

hadoop fs -rm -r /raw/ccaa
hadoop fs -mkdir -p /raw/ccaa
hadoop fs -put data/ccaa.csv /raw/ccaa/
```

Precios de combustible

```
cd $HOME/Hadoop/precios

./download_precios.sh
```

## Ingesta en tiempo real

```
cd $HOME/Hadoop/precios

flume-ng agent -f ingest-precios.conf -n agente
``` 


## Estructura en Hive

```
cd $HOME/Hadoop/precios

beeline -u jdbc:hive2:// -f $HOME/Hadoop/precios/tablas.hql
``` 

## Procesamiento con Spark

```
cd $HOME/Hadoop/precios

spark-submit count.py
```


# Planificación de la descarga de precios

```
cd

crontab -e
```

https://crontab.guru/   

```
0 * * * * /home/cloudera/Hadoop/precios/download_precios.sh
```