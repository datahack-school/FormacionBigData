# WordCount con MapReduce

Proceso que ejecutar el algoritmo **WordCount** tanto en **Java** como en **Python**

## Setup

```
cd $HOME/Hadoop/wordcount
tar xvf data/shakespeare.tar.gz
```

## Ingesta de la información
```
cd $HOME/Hadoop/wordcount

hadoop fs -put shakespeare shakespeare
```

## Proceso con MapReduce utilizando Java

```
cd $HOME/Hadoop/wordcount

mvn package

hadoop jar target/wordcount-1.0-SNAPSHOT.jar MyWordCount shakespeare output_java
```

## Proceso con MapReduce utilizando Python

```
cd $HOME/Hadoop/wordcount/python

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -input shakespeare \
    -output output_python \
    -mapper mapper.py \
    -reducer reducer.py \
    -file ./mapper.py \
    -file ./reducer.py
```
