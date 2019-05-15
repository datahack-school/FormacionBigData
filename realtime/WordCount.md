# Procesamiento de datos en tiempo real (WordCount)

Proceso donde se ingestan una serie de mensajes (palabras) en tiempo real, a través de un puerto de red, se almacenan en un tópico **Kafka**, y son procesadas por un programa **Spark Streaming**, encargado de ejecutar el algoritmo WordCount

En esta práctica vamos a utilizar **5 terminales** distintos

## Infraestructura

### Inicio del servidor de Kafka 

En el **terminal 1** arrancamos el servidor de Kafka

```
kafka-server-start.sh $KAFKA_HOME/config/server.properties
```

### Creación de tópicos y consumo de mensajes por pantalla

En el **terminal 2** creamos el tópico que vamos a utilizar en la práctica

```
#  kafka-topics.sh --delete --zookeeper localhost:2181 --topic flume
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 \
    --partitions 1 --topic flume
```

Además vamos a utilizar este terminal para observar los mensajes que se generan en la cola 

```
consumer.sh flume
```

### Agente Flume

En el **terminal 3** se arranca el agente Flume que estará escuchando del puerto de red 9999

```
cd $HOME/Hadoop/realtime
flume-ng agent -f kafka-sink.conf -n agente
```

## Ingesta de la información 

En el **terminal 4**, vamos a enviar palabras a la cola kafka

Existen 3 opciones distintas:
- Enviando información al puerto de red 9999 con el comando **nc** del sistema
- Enviando palabras al puerto 9999 con un script automático en python
- Enviando los mensajes directamente a una cola Kafka

### Comando nc

Bien de forma manual mediante la utilidad **nc**   
Para parar pulsa **Control + C**

```
nc localhost 9999
```

### Script python

... o de forma automática mediante un script en python:

```
cd $HOME/Hadoop/realtime
python send_words.py 10 --port 9999 --time 0.05
```

### Mensajes directos a Kafka

... o utilizando la utilizad **producer.sh** que envía mensajes directos a kafka 
Pulsa **Control+C** para dejar para el proceso

```
producer.sh flume --words 1 --time 0.1 --letter k
```

## Procesado de datos en tiempo real con Spark Streaming

Vamos a utilizar el **terminal 5** para consumir la información por Spark Streaming.

Existen 2 opciones distintas:

* En la primera opción se utiliza Spark básico

```
cd $HOME/Hadoop/realtime

spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.1 \
      kafka_wordcount.py flume
```

* En la segunda opción se utiliza Spark SQL

```
hadoop fs -rm -r /tmp/TwitterStreamSql

cd $HOME/Hadoop/realtime

spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.1 \
    kafka_sql_wordcount.py flume
```