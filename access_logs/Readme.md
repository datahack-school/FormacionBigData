# Acceso a los logs de un servidor web

Lectura en tiempo real de ficheros de **Log** de un servior web y visualización de datos a través del **cliente ODBC** en **Impala**

## Visualización de Logs

```
tail -f /opt/gen_logs/logs/access.log
```

## Generación de Logs


| Acción  | Comando |
| ------------- | ------------- | 
| Iniciar | start_logs |
| Verificar | tail_logs |
| Parar | stop_logs |

```
start_logs
```
## Ingesta

```
cd $HOME/Hadoop/access_logs

hadoop fs -rm -r /raw/logs
hadoop fs -mkdir -p /raw/logs
hadoop fs -put data/access_log /raw/logs

hadoop fs -ls /raw/logs

```

## Ingesta en tiempo real
```
cd $HOME/Hadoop/access_logs

flume-ng agent -f ingest-log-access.conf -n agent1
```

## Estructura en Hive 

```
cd $HOME/Hadoop/access_logs

beeline -u jdbc:hive2:// -f logs.hql
```

## Proceso de inserción de datos
```
cd $HOME/Hadoop/access_logs

beeline -u jdbc:hive2:// -f insert.hql
```

## Acceso a la información

```
cd $HOME/Hadoop/access_logs

impala-shell -f query.hql
```


## Expresiones Regulares

https://regexr.com/

```
([^ ]*) - - 
([^ ]*) - - \[([^\]]*)\]
([^ ]*) - - \[([^\]]*)\] "([^\ ]*)
([^ ]*) - - \[([^\]]*)\] "([^\ ]*) ([^\ ]*)
([^ ]*) - - \[([^\]]*)\] "([^\ ]*) ([^\ ]*) ([^\ ]*)"
([^ ]*) - - \[([^\]]*)\] "([^\ ]*) ([^\ ]*) ([^\ ]*)" (\d*)
([^ ]*) - - \[([^\]]*)\] "([^\ ]*) ([^\ ]*) ([^\ ]*)" (\d*) (\d*)
([^ ]*) - - \[([^\]]*)\] "([^\ ]*) ([^\ ]*) ([^\ ]*)" (\d*) (\d*) "([^"]*)" 
([^ ]*) - - \[([^\]]*)\] "([^\ ]*) ([^\ ]*) ([^\ ]*)" (\d*) (\d*) "([^"]*)" "([^"]*)
```

![Visualización de expresiones regulares](/images/RegEx.png)