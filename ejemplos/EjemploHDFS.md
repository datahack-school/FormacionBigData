# Ejemplo de Uso de HFDS

- Creación de ficheros

```
cd

cat <<EOF > texto1.txt
1,alumno1
2,alumno2
EOF

cat <<EOF > texto2.txt
3,alumno3
4,alumno4
EOF

ls texto*

cat texto1.txt
```


- Ayuda

```
hadoop fs
```

- Mostrar un directorio (Rutas absolutas)

```
hadoop fs -ls /

hadoop fs -ls /user

hadoop fs -ls /user/cloudera
```

- Mostrar un directorio (Ruta relativa). Si después de ```-ls``` no se especifica ruta alguna, se mostrará el contenido del directorio home del usuario en HDFS, en este caso de ```/user/cloudera```. Cualquier ruta relativa será considerada con respecto al directorio home del usuario en HDFS.
```
hadoop fs -ls
```

- Crear un directorio (Ruta relativa)

```
hadoop fs -mkdir datos
```

- Crear un directorio (Ruta absoluta)

```
hadoop fs -mkdir /datos
```

- Subir un fichero a HDFS 

```
hadoop fs -put texto1.txt datos

hadoop fs -put texto2.txt /datos
```

- Descargar un fichero de HDFS 

```
hadoop fs -get datos/texto1.txt 

hadoop fs -get /datos/texto2.txt
```


- Mostrar el contenido de un fichero en HDFS

```
hadoop fs -cat datos/texto1.txt

hadoop fs -cat /datos/texto2.txt
```

- Borrar un directorio y todo su contenido

```
hadoop fs -rm -r datos

hadoop fs -rm -r /datos
```

- Dependiendo de la versión de Hadoop es frecuente utilizar ```hdfs dfs``` en lugar de ```hadoop fs```.



<!--
## Acceso a HDFS a través de Python

UTilizamos un script en **Python** que utiliza la librería [hdfs3](http://hdfs3.readthedocs.io/en/latest/api.html)

```
cd $HOME/Hadoop/hdfs

python hdfs.py /
```
-->
