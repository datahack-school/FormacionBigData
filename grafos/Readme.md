# Analítica con Grafos

Ejemplo de proceso utilizando **Spark GraphX**

Se lee un fichero con metadatos de llamadas de teléfono, se crea un grafo y se determina el nodo más importante a través del algoritmo PageRank


## Ingesta de datos
```
cd $HOME/Hadoop/grafos

hadoop fs -rm -r /raw/graph
hadoop fs -mkdir -p /raw/graph
hadoop fs -put data/metadata-raw.txt /raw/graph
```

## Compilado de los fuentes
```
cd $HOME/Hadoop/grafos

mvn package
```

## Procesado de información
```
cd $HOME/Hadoop/grafos

spark-submit --master local \
  --class scala.GraphExample \
  --packages com.databricks:spark-csv_2.11:1.5.0 \
  /home/cloudera/Hadoop/grafos/target/graphx-example-1.0-SNAPSHOT.jar 

``` 
