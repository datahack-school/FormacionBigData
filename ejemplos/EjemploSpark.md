# Procesamiento con Spark

## Ingesta de la información

```
cd $HOME/Hadoop/spark

hadoop fs -rm -r shakespeare.txt
hadoop fs -put data/shakespeare.txt
```

## Procesamiento de forma interactiva con Spark / Scala

```
spark-shell
```

Prueba con el código del fichero `wordcount.scala`

```
val textFile = sc.textFile("hdfs://localhost:8020/user/cloudera/shakespeare.txt")

val counts = textFile.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _)

counts.saveAsTextFile("hdfs://localhost:8020/user/cloudera/spark_wordcount")

:q
```

## Procesamiento de forma interactiva con Spark / Python

```
pyspark
```

Prueba con el código del fichero `wordcount.py`

```
from operator import add

textFile = sc.textFile("hdfs://localhost:8020/user/cloudera/shakespeare.txt")

counts = textFile.flatMap(lambda x: x.split(' ')) \
                  .map(lambda x: (x, 1)) \
                  .reduceByKey(add)

counts.saveAsTextFile("hdfs://localhost:8020/user/cloudera/python_wordcount")

exit()
```

## Obtención de la temperatura maxima anual

```
cd ~/Hadoop/spark

spark-submit max_temperature.py /raw/ncdc/all spark_python_max_temp
```
