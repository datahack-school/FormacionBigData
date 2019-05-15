# Ejemplo de Uso de HBase


- Lista de comandos de HBase

```
hbase
```


- Shell de HBase (para salir teclea `exit`)

```
cd
hbase shell
```

Escribe `exit` para salir de la shell


- Crear una tabla (desde el shell)

```
create 't1', 'fam1', 'fam2'
alter 't1', NAME=>'fam1', VERSIONS=>2
```

- Insercción de datos

```
put 't1', 'row1', 'fam1:c1', 'hello'
put 't1', 'row2', 'fam1:c1', 'world', 1274032629663
put 't1', 'row2', 'fam2:c2', 1314
```

- Actualización de datos

```
put 't1', 'row2', 'fam1:c1', 'hbase'
```

- Obtención de datos (Todas las columnas)

```
get 't1', 'row2'
```

- Obtención de datos (Columnas de una familia)

```
get 't1', 'row2', {COLUMN => 'fam1'}
```

- Obtención de datos (Una columna específica)

```
get 't1', 'row2', {COLUMN => 'fam1:c1'}
```

- Obtención de datos (Una columna específica)

```
get 't1', 'row2', {COLUMN => 'fam1:c1', VERSIONS => 2}
```

- Obtención de datos (Una columna específica en el tiempo)

```
get 't1', 'row2', {COLUMN => 'fam1:c1', TIMESTAMP => 1274032629663}
```


- Scan 

```
scan 't1'

scan 't1', {LIMIT=>1}

scan 't1', {STARTROW=>'row1', STOPROW=>'row3'}

scan 't1', {COLUMNS => ['fam1:c1', 'fam2:c2']}

```

- Scan con filtros

```
import org.apache.hadoop.hbase.filter.CompareFilter
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter
import org.apache.hadoop.hbase.filter.SubstringComparator
import org.apache.hadoop.hbase.filter.BinaryComparator
import org.apache.hadoop.hbase.util.Bytes

scan 't1', { FILTER => SingleColumnValueFilter.new(Bytes.toBytes('fam1'), Bytes.toBytes('c1'), CompareFilter::CompareOp.valueOf('EQUAL'), BinaryComparator.new(Bytes.toBytes('hello')))}

```

- Comprobar la existencia de una tabla

```
exists 't1'
```

- Borrar una tabla

```
disable 't1'
drop 't1'
```

- Reinicio del servicio

Desde la consola escribe:

```
service hbase-master restart
service hbase-regionserver restart
```