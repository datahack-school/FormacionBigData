# Ejemplo de uso de Avro


## Generación de información en formato Avro (Python)

- Generación de ficheros Avro en Python en función de un esquema determinado (fichero `product.avsc`):

```
cd ~/Hadoop/avro

rm -f product.avro
python avro_write.py
```


- Lectura de ficheros Avro en Python


```
cd ~/Hadoop/avro

python avro_read.py
```

## Utilidades

- Utilidades Java

```
cd ~/Hadoop/avro

wget http://central.maven.org/maven2/org/apache/avro/avro-tools/1.8.2/avro-tools-1.8.2.jar
java -jar avro-tools-1.8.2.jar
```

- Generación de un fichero JSON a partir de un fichero AVRO

```
java -jar avro-tools-1.8.2.jar tojson product.avro > product.json
```

- Generación de un fichero AVRO a partir de un fichero JSON

```
java -jar avro-tools-1.8.2.jar fromjson \
    --schema-file product.avsc product.json > product_from_json.avro
```

- Utilidades Python - Generación de un fichero CSV a partir de un fichero

```
avro cat product.avro --format csv
```


## Utilización de Avro con Kafka

- Iniciar el servidor

``` 
kafka-server-start.sh $KAFKA_HOME/config/server.properties
```

- Crear el tópico avro-topic

```
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 \
    --partitions 1 --topic avro-topic
```


- Productor de mensajes en Kafka

```
cd ~/Hadoop/avro

python producer_avro.py
```


- Consumidor de mensajes en Kafka

```
cd ~/Hadoop/avro

python consumer_avro.py
```