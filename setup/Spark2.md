# Spark2 

## Instalación de Java 8
```
sudo yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

```

![](/images/Spark2-1.png)


## Descarga de Spark 2

```
cd
wget https://archive.apache.org/dist/spark/spark-2.2.2/spark-2.2.2-bin-hadoop2.7.tgz 

tar xvf spark-2.2.2-bin-hadoop2.7.tgz
sudo rm spark-2.2.2-bin-hadoop2.7.tgz

sudo ln -s spark-2.2.2-bin-hadoop2.7 spark2
sudo rm /home/cloudera/spark2/bin/beeline*

```

Las distintas versiones de Spark se encuentran en este [enlace](https://spark.apache.org/downloads.html)

![](/images/Spark2-2.png)

## Configuración

```
sudo ln -s /usr/lib/hive/conf/hive-site.xml \
    ~/spark2/conf/hive-site.xml

sudo cp ~/spark2/conf/log4j.properties.template \
    ~/spark2/conf/log4j.properties

sudo sed -i 's/log4j.rootCategory=INFO/log4j.rootCategory=WARN/' \
    ~/spark2/conf/log4j.properties

```

![](/images/Spark2-3.png)

## Versión de Java de SQOOP

```
sudo sed -i 's/export SQOOP_HOME=\/usr\/lib\/sqoop/export SQOOP_HOME=\/usr\/lib\/sqoop\
export JAVA_HOME=\/usr\/java\/jdk1.7.0_67-cloudera/' /usr/bin/sqoop

grep JAVA_HOME /usr/bin/sqoop

```

![](/images/Spark2-4.png)

## Variables de entorno 


```
cat <<EOF >>~/.bashrc

# Spark 2
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64
export PATH=\$JAVA_HOME/bin:\$PATH
export SPARK_DIST_CLASSPATH=\$(hadoop --config /etc/hadoop/conf/ classpath)
export SPARK_HOME=/home/cloudera/spark2
export PATH=\$SPARK_HOME/bin:\$PATH
export HADOOP_CONF_DIR=/etc/hadoop/conf
export HIVE_SKIP_SPARK_ASSEMBLY=true
EOF

source ~/.bashrc

spark-submit --version
```

![](/images/Spark2-5.png)