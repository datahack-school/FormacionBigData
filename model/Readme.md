# Ingesta Batch / Tiempo real utilizando un modelo de machine learning

Ejemplo de [arquitectura lambda](https://www.wikiwand.com/en/Lambda_architecture) donde la información se procesa vía Batch y RealTime. En la parte Realtime se ejecuta un modelo de Machine Learning y se almacena el resultado a una base de datos **MongoDB**

En esta práctica vamos a utilizar **6 terminales** distintos

## Infraestructura - Inicio del servidor de Kafka 

En el **terminal 1** arrancamos el servidor de Kafka

```
kafka-server-start.sh $KAFKA_HOME/config/server.properties
```

## Creación de tópicos y agente Flume

En el **terminal 2** creamos el tópico que vamos a utilizar en la práctica

```
#  kafka-topics.sh --delete --zookeeper localhost:2181 --topic msmk
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 \
    --partitions 1 --topic msmk
```

Además vamos a utilizar este terminal para observar los mensajes que se generan en la cola 

```
consumer.sh msmk
```

o si queremos ver el número de mensajes en el tópico ...
```
partitions.sh msmk
```

## Agente Flume


En el **terminal 3** arrancamos el agente Flume que estará encargado de leer los tweets y enviarlos tanto a HDFS como a un tópico Kafka para su ingesta en tiempo real

```
cd $HOME/Hadoop/model

flume-ng agent -f kafka-twitter.conf -n TwitterAgent
```

Esperamos el tiempo suficiente para que tengamos suficientes tweets (10 minutos)

## Modelo de Machine Learning 

Vamos a utilizar el **terminal 4** para construir el modelo de Machine Learning y evaluarlo, utilizando como base los datos que tenemos en HDFS

```
cd $HOME/Hadoop/model

spark-submit model.py
```

## Proceso de la información vía Batch

Vamos a utilizar el **terminal 5** para vamos a ejecutar un script que consuma la información vía batch

```
cd $HOME/Hadoop/model

spark-submit  \
    --packages org.mongodb.spark:mongo-spark-connector_2.11:2.2.1 \
    proceso_batch.py
```

## Proceso de la información en tiempo real

Vamos a utilizar el **terminal 5** para consumir la información con Spark Streaming.

```
hadoop fs -rm -r /tmp/TwitterStreamML

cd $HOME/Hadoop/model

spark-submit \
    --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.1,\
org.mongodb.spark:mongo-spark-connector_2.11:2.2.1 \
    proceso_realtime.py msmk
```