# Ejemplo de uso de HIVE

- Crear el archivo cars.csv:

```
cat <<EOF >cars.csv
Name,Miles_per_Gallon,Cylinders,Displacement,Horsepower,Weight_in_lbs,Acceleration,Year,Origin
chevrolet chevelle malibu,18,8,307,130,3504,12,1970-01-01,A
buick skylark 320,15,8,350,165,3693,11.5,1970-01-01,A
plymouth satellite,18,8,318,150,3436,11,1970-01-01,A
amc rebel sst,16,8,304,150,3433,12,1970-01-01,A
ford torino,17,8,302,140,3449,10.5,1970-01-01,A
EOF

```

- Quitar primera linea

```
sed -i 1d cars.csv
```

- Subir el archivo a HDFS

```
hadoop fs -mkdir /user/cloudera/cars
hadoop fs -put cars.csv /user/cloudera/cars
```

- Abrir la consola de Hive 

```
hive
```

Para salir introduce el comando `quit;`

- Crear una tabla externa:

```
CREATE EXTERNAL TABLE IF NOT EXISTS CARS_RAW (
    Name STRING,
    Miles_per_Gallon INT,
    Cylinders INT,
    Displacement INT,
    Horsepower INT,
    Weight_in_lbs INT,
    Acceleration DECIMAL,
    Year DATE,
    Origin CHAR(1))
COMMENT 'Data about cars from a public database'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/cloudera/cars';
```

- Crear una tabla interna:

```
CREATE TABLE IF NOT EXISTS CARS (
    Name STRING,
    Miles_per_Gallon INT,
    Cylinders INT,
    Displacement INT,
    Horsepower INT,
    Weight_in_lbs INT,
    Acceleration DECIMAL,
    Year DATE,
    Origin CHAR(1))
COMMENT 'Data about cars from a public database'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC;
```

- Insertar datos:

```
INSERT OVERWRITE TABLE CARS
SELECT * FROM CARS_RAW;
```

- Mostrar el script de creación de la tabla

```
SHOW CREATE TABLE CARS;
```


- Borrar una tabla

```
DROP TABLE CARS;
DROP TABLE CARS_RAW;
```

## Metadatos

```
mysql -u hive -pcloudera metastore
```

Escribe `show tables;` para ver las tablas de la base de datos

Para ver que tablas están creadas en Hive puedes ejecutar el siguiente comando:

```
select TBL_ID, CREATE_TIME, OWNER, TBL_NAME
from TBLS;
```

Escribe `quit;` para salir.