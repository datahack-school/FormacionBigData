# Ejemplo de ZooKeeper


## Contadores

En este ejemplo se va a utilizar el servidor de ZooKeeper para almacenar un contador

Incrementamos el valor del contador 'contador1' en 100 ...

```
cd $HOME/Hadoop/zoo
python counter.py contador1 --value 100
```

... y volvemos a incrementarle en otros 100

```
cd $HOME/Hadoop/zoo
python counter.py contador1 --value 100
```