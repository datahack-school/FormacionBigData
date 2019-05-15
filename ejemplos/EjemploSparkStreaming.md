# Procesamiento de datos en tiempo real

Ejemplo de proceso en tiempo real con **Spark Streaming**

## Procesado de mensajes

En el **terminal 1** vamoa a ejecutar un proceso que envia todo lo que escribamos al puerto 9999 ...

```
nc -lk 9999
```

En el **terminal 2** ejecutamos un programa de **Spark Streaming** que procesa la información recibida por el puerto 9999 ...

```
cd $HOME/Hadoop/realtime
spark-submit socket_sample.py
```
