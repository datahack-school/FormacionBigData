# Exportación de datos a MongoDB en tiempo real

Proceso donde se envían mensajes a una tópico **Kafka**, y se procesan en tiempo real por un proceso **Spark Streaming** que graba los mensajes en **MongoDB**, utilizando la librería pymongo

En esta práctica vamos a utilizar **4 terminales** distintos

## Infraestructura

### Inicio del servidor de Kafka 

En el **terminal 1** arrancamos el servidor de Kafka

```
kafka-server-start.sh $KAFKA_HOME/config/server.properties
```

### Creación de tópicos y consumo de mensajes por pantalla

En el **terminal 2** creamos el tópico que vamos a utilizar en la práctica

```
#  kafka-topics.sh --delete --zookeeper localhost:2181 --topic mongo
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 \
    --partitions 1 --topic mongo
```

Además vamos a utilizar este terminal para observar los mensajes que se generan en la cola 

```
consumer.sh mongo
```

## Ingesta de la información 

En el **terminal 3**, vamos a enviar palabras a la cola kafka

```
producer.sh mongo --words 3 --time 0.1 --json
```

## Procesado de mensajes en tiempo real con Spark Streaming

Vamos a utilizar el **terminal 4** para consumir la información por Spark Streaming.

```
cd $HOME/Hadoop/realtime
spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.1 \
    kafka_mongo.py mongo
```