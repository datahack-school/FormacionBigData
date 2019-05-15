# Proceso MapReduce con Python

Proceso **MapReduce** en **Python** que obtiene las temperaturas máximas anuales

## Ingesta de la información

```
cd $HOME/Hadoop/temperature

hadoop fs -mkdir -p /raw
hadoop fs -rm -r /raw/ncdc
hadoop fs -put data/ncdc /raw
```

## Procesamiento con MapReduce utilizando Java

```
cd $HOME/Hadoop/temperature

mvn package

```


## Procesamiento con Python en local

### Map

```
cd $HOME/Hadoop/temperature

cat data/ncdc/sample/sample.txt | \
    python python/max_temperature_map.py 
```

### Map y Reduce
hadoop jar target/temperature-1.0-SNAPSHOT.jar MaxTemperature /raw/ncdc/all max_temperatures_java

```
cd $HOME/Hadoop/temperature

cat data/ncdc/sample/sample.txt | \
    python python/max_temperature_map.py | \
    sort | \
    python python/max_temperature_reduce.py
```

## Procesamiento con MapReduce utilizando Python

```
cd $HOME/Hadoop/temperature

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -input /raw/ncdc/all \
    -output max_temperatures_python \
    -mapper python/max_temperature_map.py \
    -reducer python/max_temperature_reduce.py \
    -file ./python/max_temperature_map.py \
    -file ./python/max_temperature_reduce.py
```

## Acceso a los logs

Desde el servidor de MapReduce ...

```
http://localhost:8088/
```

Desde Hue ...

```
http://localhost:8888/jobbrowser
```

Desde Yarn ...

```
yarn logs --applicationId application_1551177288165_0009
```


