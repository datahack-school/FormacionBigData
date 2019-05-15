# Proceso de exportación de datos a una base de datos relacional

Proceso que ingesta datos desde **MySql**, se realiza un proceso en **Hive** y su resultado es exportado de nuevo a **MySql**

## Ingesta de datos
```
cd $HOME/Hadoop/retail

sqoop --options-file import-all-dbretail.conf
```

## Estructura en Hive
```
cd $HOME/Hadoop/retail

beeline -u jdbc:hive2:// -f top10.hql
```

## Proceso con Hive

```
cd $HOME/Hadoop/retail

beeline -u jdbc:hive2:// -f query.hql
```

## Exportación de datos con Sqoop
```
cd $HOME/Hadoop/retail

mysql -u retail_dba -pcloudera < mysql_top10.sql

sqoop --options-file truncate-table.conf
sqoop --options-file export-top10.conf
```

## Acceso a MySQL para verificar los datos

```
mysql -u retail_dba -pcloudera retail_db
```

Ejecuta la sentencia:

```
select * from top10;
```

Escribe `quit;` para salir
