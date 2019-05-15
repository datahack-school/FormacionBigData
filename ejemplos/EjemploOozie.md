# Oozie

Ejemplos de ejecuciones de flujos orquestados por Oozie


## Ejecución del job

```
cd $HOME/Hadoop/oozie
./run.sh lab1-java-mapreduce
```

Observa que la única salida de este comando es el identificador de job o **job_id**

## Verificación del estado del job

Sustituye el identificador de job `0000000-190223210144306-oozie-oozi-W` por el **job_id** del trabajo que se acaba de lanzar

```
oozie job -oozie http://localhost:11000/oozie -info 0000000-190223210144306-oozie-oozi-W
```