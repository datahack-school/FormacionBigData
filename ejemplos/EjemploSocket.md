# Ejemplo de sockets

En esta práctica vamos a utilizar **2 terminales** distintos


## Ejemplo utilizando `nc`

En el **terminal 1** ejecutamos un proceso que escucha por el puerto 9000

```
nc -l 9000
```

Mientras que el **terminal 2** ejecutamos el proceso que envía todo lo que escribamos al puerto 9000

```
nc localhost 9000
```


## Ejemplo utilizando python

### Servidor

En el **terminal 1** ejecutamos el servidor para que escuche por el puerto 8009

```
cd $HOME/Hadoop/socket
python server.py 8009
```


### Cliente


En el **terminal 2** ejecutamos el cliente para que envíe un mensaje al al puerto 8009

```
cd $HOME/Hadoop/socket
python client.py 8009 --mensaje "Hola"
```

El cliente también puede enviar todas las palabras que escribamos en consola 

```
cd $HOME/Hadoop/socket
python client.py 8009
```

