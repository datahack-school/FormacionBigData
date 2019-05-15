# Ejemplo de Uso de Sqoop


- Acceso a **MySQL**

```
mysql -u retail_dba -pcloudera retail_db
```

Puedes introducir el comando `show tables;` para ver las tablas que tiene la base de datos

También podrías escribir una query en SQL para ver el contenido de la tabla productos ...

```
select * from products limit 10;
```

Teclea `quit;` para salir de la consola

- Listado de las bases de datos de un servidor

```
sqoop list-databases \
--connect jdbc:mysql://localhost \
--username retail_dba \
--password cloudera
```

- Listado de las tablas de una base de datos

```
sqoop list-tables \
--connect jdbc:mysql://localhost/retail_db \
--username retail_dba \
--password cloudera
``` 

- Importación de datos 

```
sqoop import \
--connect jdbc:mysql://localhost/retail_db \
--table products \
--fields-terminated-by '|' \
--m 1 \
--username retail_dba \
--password cloudera \
--target-dir /raw/sqoop/products
``` 