# Análisis de sentimiento con MapReduce

Ejemplo de proceso **MapReduce** en **Java** donde se procesa un archivo para contar el número de ocurrencias de las distintas palabras. Adicionalmente se generar un indicador con el sentimiento de los términos

## Compilación de las clases java y configuración inicial

Guardamos en **HDFS** los archivos de configuración ...
```
cd $HOME/Hadoop/sentiment/data/config

hadoop fs -rm -r /config/sentiment
hadoop fs -mkdir -p /config/sentiment
hadoop fs -put * /config/sentiment
```

... y el archivo de entrada al proceso
```
cd $HOME/Hadoop/sentiment/data

hadoop fs -rm -r /raw/sentiment
hadoop fs -mkdir -p /raw/sentiment
hadoop fs -put input.txt /raw/sentiment
```

Por último compilamos las clases **Java**
```
cd $HOME/Hadoop/sentiment

mvn package
```

## Procesado de la información
```
hadoop fs -rm -r /data/sentiment

hadoop jar target/sentiment-1.0-SNAPSHOT.jar org.myorg.MrManager \
    /raw/sentiment \
    /data/sentiment \
    -skip /config/sentiment/stop-words.txt \
    -pos /config/sentiment/pos-words.txt \
    -neg /config/sentiment/neg-words.txt \
    -no_case
```