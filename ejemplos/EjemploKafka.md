# Ejemplo de uso de Kafka

## Comandos básicos en Kafka

- Iniciar el servidor

``` 
kafka-server-start.sh $KAFKA_HOME/config/server.properties
```

- Crear un tópico

```
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 \
    --partitions 1 --topic prueba
```

- Borrar un tópico

```
kafka-topics.sh --delete --zookeeper localhost:2181 --topic prueba
```

- Listar los tópicos

```
kafka-topics.sh --list --zookeeper localhost:2181
```

- Ejemplo de productor

```
kafka-console-producer.sh --broker-list localhost:9092 --topic prueba
```

- Ejemplo de consumidor

```
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic prueba \
    --from-beginning
```


- Ejemplo de consumidor dentro de un grupo

```
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic prueba \
    --consumer-property group.id=grupo
```


## Productor de mensajes

- Generando mensajes cada 3 segundos ...

```
producer.sh prueba --time 3
```

- Generando mensajes en formato json ...

```
producer.sh prueba --time 3 --json
```

## Consumidor de mensajes

- Obteniendo mensajes a través de un grupo de consumidores

```
consumer.sh prueba --groupid grupo
```

- Obteniendo todos los mensajes desde el principio

```
consumer.sh prueba --groupid grupo --inicio
```

- Obteniendo mensajes desde una determinada partición

```
consumer.sh prueba-2p --groupid grupo --inicio --partition 1
```

- Obteniendo mensajes desde un determinado offset

```
consumer.sh prueba--groupid grupo --offset 10
```
