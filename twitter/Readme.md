# Ingesta de datos de Twitter en tiempo real

Proceso que ingesta datos de **Twitter** tiempo real y almacenados en un fichero en **HDFS**. Más tarde se accede a esta información a través de tablas **Hive**

## Ingesta de datos

```
cd $HOME/Hadoop/twitter

flume-ng agent -f ingest-twitter.conf -n TwitterAgent
```

## Estructura en Hive

```
cd $HOME/Hadoop/twitter

beeline -u jdbc:hive2:// -f tablas.hql

```

## Acceso a la información

```
cd $HOME/Hadoop/twitter

beeline -u jdbc:hive2:// -f most_influent.hql
```