## Procesamiento de Trendings Topics de Twitter

Proceso en **Spark** que lee un fichero **JSON** con Trending Topics de **Twitter** y los almacena en una base de datos **MongoDB**

## Ingesta de la información

```
cd $HOME/Hadoop/trends

gunzip data/twitter-trends.json.gz

hadoop fs -rm -r /raw/trends
hadoop fs -mkdir -p /raw/trends
hadoop fs -put data/twitter-trends.json /raw/trends
```

## Procesamiento con Spark

```
cd $HOME/Hadoop/trends

spark-submit  \
        --conf "spark.mongodb.output.uri=mongodb://127.0.0.1/twitter.trends" \
        --packages org.mongodb.spark:mongo-spark-connector_2.11:2.2.1 \
        export_trends.py
```