# Ejemplo de Flume

En esta práctica vamos a utilizar **2 terminales** distintos

## Agente Flume - Logger

En este ejemplo se muestran las palabras que se reciben en el puerto 9999 en un log

En el **terminal 1** ejecutamos el agente Flume

```
cd $HOME/Hadoop/flume
flume-ng agent -f flume_logger.conf -n agente
```

En el **terminal 2** ejecutamos un cliente en Python que envía palabras al puerto donde el agente Flume está escuchando

```
cd $HOME/Hadoop/flume

python client.py
```

## Agente Flume + Interceptors

Este ejemplo es parecido al anterior, pero añadiendo información al mensaje

En el **terminal 1** ejecutamos el agente Flume

```
cd $HOME/Hadoop/flume
flume-ng agent -f flume_interceptor.conf -n agente
```

En el **terminal 2** enviamos palabras con el cliente Python


## Agente Flume - Logger + HDFS

En este ejemplo además de mostrar las palabras en un log, se escriben en un fichero de **HDFS**

En el **terminal 1** ejecutamos el agente Flume cambiando el fichero de configuración.

```
cd $HOME/Hadoop/flume
flume-ng agent -f flume_hdfs.conf -n agente
```

En el **terminal 2** enviamos palabras con el cliente Python