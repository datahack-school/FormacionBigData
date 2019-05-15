# Hadoop Clúster - Centos 7

https://hostpresto.com/community/tutorials/how-to-install-apache-hadoop-on-a-single-node-on-centos-7/
https://www.tecmint.com/install-configure-apache-hadoop-centos-7/

Virtual Box

Modo de Red Bridge
Memoria 4GB
Disco Duro 55Gb
Sistema Operativo Centos 7 - minimal

Configuración

Lenguaje: Ingles Americano
TimeZone: Madrid
Teclado: Spanish (Castilian)
Red: Tarjeta de red conectada
Destino: Toda la partición

Root Password: Establecer una password de root
Crear usuario: Crear un usuario y hacerlo administrador

Reboot

---

Entrar al sistema 
Mirar la dirección ip
ip a

192.168.1.132

[Network Configuration]

sudo nmtui

nombre de host "server.bigdata"

address 192.168.1.215
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers 8.8.8.8 192.168.1.1
searchs domains: bigdata

+  Require IPv4 addressing for this connection

sudo systemctl restart network

/etc/hosts

192.168.1.215 server.bigdata server
192.168.1.216 node1.bigdata node1
192.168.1.217 node2.bigdata node2
192.168.1.218 node3.bigdata node3


Iniciar sin pantalla y conectarse a través de ssh

--- ufw

Desactivar firewalld y activar ufw 

sudo systemctl disable firewalld
sudo yum install epel-release -y
sudo yum install –enablerepo=”epel” ufw -y
sudo systemctl enable ufw
sudo ufw status

sudo systemctl disable ufw
sudo systemctl stop ufw

---- wgeg

sudo yum install wget

---- java
http://www.oracle.com/technetwork/java/javase/downloads/index.html

wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.rpm"

sudo yum localinstall jdk-8u161-linux-x64.rpm
java -version

rm jdk-8u161-linux-x64.rpm

--- Añadir el usuario hadoop
sudo useradd hadoop
sudo passwd hadoop

usermod -aG wheel hadoop

--- Claves ssh

su - hadoop
cd
ssh-keygen -t rsa

cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

~/.ssh/authorized_keys

ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAgjraQIXlGirgbhX3lqW6PDZTzCbxnOWjyRBaw8nKz1RsiPRwxzzlAywxUdLNAWW/Vj1eOwMTAEXnjCVBPZ5g/b4NXBvg+SXwufvbhEJ/4mBgpBWZgwe3tjiaPz01CzjgZLgHRz5DzGkZFuHs8gj8Srq/5LqP0aFXUWJOB1Ar8ky/jaygYEpID106kvpwUztRd6NtSCw8dMnjVDVZVu5+2USA96KP+3V20JNq0Kr5pCipT8p0ywngWbZS0Q/aJhA6RfCTviKDioB1CMgvcyJk5lVeWJnlveC4J0UnMBEHivF3zjSuqLWRKU1m1VTmF/cmtACoqwJEX0T+8vfgSWuYONr8tjRQHPGjLhnEaHIgT8DxG9mkhuut4UoFfmz3+LkkYxd6ySLsj2UkoDJ3nzOY+FxEeEB0Pd6rxSfEgnaf12BXCjU3IpBxnw3L/ZuCF2LRyAQIVFr/ySI1g+rad4fSNs2ggQmRkr2M+jxG8WLNR825hYGVHzXYLvVOIer4z3ert35aPq6bG0HnuKxsHnYLjTeAZ/Pw4iw/x5BhdmDj9WnfWSzzJHbh/42jt72O5n0IEVmykE4m8la8L6GKQue5y24c06YuxjYO29XySmgHSt7PaxqcvZrzZIFeNgowfU4RthJ4FpwqHUkto5EVIwDvZ4jprUxEnkWy8hjeUkjMZ6M= rsa-key-20140928

exit

-- Instalación de Hadoop

http://hadoop.apache.org/releases.html#Download


wget http://apache.uvigo.es/hadoop/common/hadoop-2.8.3/hadoop-2.8.3.tar.gz
tar xvf hadoop-2.8.3.tar.gz

sudo mv hadoop-2.8.3 /opt
sudo ln -s /opt/hadoop-2.8.3 /opt/hadoop
sudo chown -R hadoop:hadoop /opt/hadoop

--- Variables de entorno

su - hadoop

vi  .bash_profile

```
# Java
export JAVA_HOME=/usr/java/default
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar

# Hadoop
export HADOOP_HOME=/opt/hadoop
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib/native"
export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop

# Kafka
export KAFKA_HOME=/opt/kafka_2.11-1.0.0
export PATH=$KAFKA_HOME/bin:$PATH

# Flume
export FLUME_HOME=/opt/apache-flume-1.8.0-bin
export PATH=$FLUME_HOME/bin:$PATH

# Hive
export HIVE_HOME=/opt/apache-hive-2.3.2-bin
export PATH=$HIVE_HOME/bin:$PATH

# ZooKeeper
export ZOOKEEPER_HOME=/opt/zookeeper-3.4.10/bin
export PATH=$ZOOKEEPER_HOME:$PATH

# Sqoop
export SQOOP_HOME=/opt/sqoop-1.4.7.bin__hadoop-2.6.0
export PATH=$SQOOP_HOME/bin:$PATH

# Spark 2
export SPARK_DIST_CLASSPATH=$(hadoop --config /opt/hadoop/etc/hadoop classpath)
export SPARK_HOME=/opt/spark-2.2.1-bin-hadoop2.7
export PATH=$SPARK_HOME/bin:$PATH

# Python
export PYTHONIOENCODING=utf8
export PATH=$HOME/miniconda2/bin:$PATH

```

source .bash_profile

---- Configurar Hadoop

cd $HADOOP_HOME/etc/hadoop/

----
vi hadoop-env.sh

export JAVA_HOME=/usr/java/default/

---

vi core-site.xml

<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://server.bigdata:9000/</value>
    </property>
</configuration>

----

vi hdfs-site.xml

<configuration>

    <property>
        <name>dfs.namenode.name.dir</name>
        <value>file:///opt/hadoop/hadoopdata/namenodedfs.data.dir</value>
    </property>

    <property>
        <name>dfs.datanode.data.dir</name>
        <value>file:///opt/hadoop/hadoopdata/datanode</value>
    </property>

    <property>
       <name>dfs.replication</name>
       <value>1</value>
    </property>

</configuration>

---
cp mapred-site.xml.template mapred-site.xml

vi mapred-site.xml 

<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>

<!--
    <property>
        <name>yarn.app.mapreduce.am.resource.mb</name>
        <value>512</value>
    </property>

    <property>
        <name>mapreduce.map.memory.mb</name>
        <value>256</value>
    </property>

    <property>
        <name>mapreduce.reduce.memory.mb</name>
        <value>256</value>
    </property>
-->

</configuration>


----


vi  yarn-site.xml

<configuration>
    <property>
            <name>yarn.acl.enable</name>
            <value>0</value>
    </property>

    <property>
            <name>yarn.resourcemanager.hostname</name>
            <value>server.bigdata</value>
    </property>

    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>

<!--
    <property>
        <name>yarn.nodemanager.resource.memory-mb</name>
        <value>1536</value>
    </property>

    <property>
        <name>yarn.scheduler.maximum-allocation-mb</name>
        <value>1536</value>
    </property>

    <property>
        <name>yarn.scheduler.minimum-allocation-mb</name>
        <value>128</value>
    </property>

    <property>
        <name>yarn.nodemanager.vmem-check-enabled</name>
        <value>false</value>
   </property>
-->

</configuration>


----
slaves
----

hdfs namenode -format

start-dfs.sh
jps

21722 Jps
21293 NameNode
21390 DataNode
21599 SecondaryNameNode

hdfs dfsadmin -report
http://server:50070/cluster

nmap -p 50070 server

hdfs dfs -mkdir -p /user/hadoop

cd
wget -O alice.txt https://www.gutenberg.org/files/11/11-0.txt
wget -O holmes.txt https://www.gutenberg.org/ebooks/1661.txt.utf-8
wget -O frankenstein.txt https://www.gutenberg.org/ebooks/84.txt.utf-8
hdfs dfs -mkdir books
hdfs dfs -put alice.txt holmes.txt frankenstein.txt books
hdfs dfs -ls books
hdfs dfs -cat books/alice.txt


start-yarn.sh
yarn node -list
yarn application -list
http://server:8088/cluster

jps

1553 DataNode
3297 MRAppMaster
1443 NameNode
3621 Jps
2697 ResourceManager
2793 NodeManager
1759 SecondaryNameNode

yarn jar /opt/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.3.jar wordcount "books/*" output


sudo ufw allow 50070
sudo ufw allow 8088
sudo ufw allow 8042

http://server:50070
http://server:8088
http://server:8042

Puertos abiertos
ss -tuln

Parar servicios
stop-yarn.sh
stop-dfs.sh

rm -rf /opt/hadoop/hadoopdata

-----------**********____________

cluster

guardado del master

clonar 4 nodos, uno de ellos server
    
En los nodos 1, 2 y 3

sudo nmtui
establecer el nombre del servidor
192.168.1.216 node1
192.168.1.217 node2
192.168.1.218 node3

sudo systemctl restart network

Se reinician todos los nodos

Desde el servidor
ssh node1
ssh node2
ssh node3

hdfs namenode -format

cd $HADOOP_CONF_DIR
vi slaves

node1
node2
node3

---

vi hdfs-site.xml
replicacion 2



*********************************

Servicios del sistema
su - root
vi /etc/rc.local

su - hadoop -c "/opt/hadoop/sbin/start-dfs.sh"
su - hadoop -c "/opt/hadoop/sbin/start-yarn.sh"
su - hadoop  -c "nohup hive --service metastore > /opt/apache-hive-2.3.2-bin/hive.out 2> /opt/apache-hive-2.3.2-bin/hive.log &"

exit 0

chmod +x /etc/rc.d/rc.local
systemctl enable rc-local
systemctl start rc-local
systemctl status rc-local

https://discuss.pivotal.io/hc/en-us/articles/201846688-HDFS-reports-Configured-Capacity-0-0-B-for-datanode

https://linode.com/docs/databases/hadoop/how-to-install-and-set-up-hadoop-cluster/

--------

sudo yum install bzip2 -y
sudo yum install unzip -y

cd
wget https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz
tar -xzf kafka_2.11-1.0.0.tgz

rm kafka_2.11-1.0.0.tgz
sudo mv kafka_2.11-1.0.0 /opt
sudo chown hadoop:hadoop /opt/kafka_2.11-1.0.0


cd
wget http://apache.rediris.es/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz
tar xvf apache-flume-1.8.0-bin.tar.gz
rm apache-flume-1.8.0-bin.tar.gz
sudo mv apache-flume-1.8.0-bin /opt
sudo chown hadoop:hadoop /opt/apache-flume-1.8.0-bin


# Sqoop
wget http://ftp.cixug.es/apache/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
tar xvf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
rm sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
sudo mv sqoop-1.4.7.bin__hadoop-2.6.0 /opt

# ZooKeeper

wget http://apache.uvigo.es/zookeeper/current/zookeeper-3.4.10.tar.gz
tar xvf zookeeper-3.4.10.tar.gz
rm zookeeper-3.4.10.tar.gz
sudo mv zookeeper-3.4.10 /opt

# Hive

wget http://ftp.cixug.es/apache/hive/hive-2.3.2/apache-hive-2.3.2-bin.tar.gz
tar xvf apache-hive-2.3.2-bin.tar.gz
rm apache-hive-2.3.2-bin.tar.gz
sudo mv apache-hive-2.3.2-bin /opt
sudo chown hadoop:hadoop /opt/apache-hive-2.3.2-bin

wget http://www.java2s.com/Code/JarDownload/mysql/mysql-connector-java-5.1.24-bin.jar.zip
unzip mysql-connector-java-5.1.24-bin.jar.zip
cp mysql-connector-java-5.1.24-bin.jar $HIVE_HOME/lib/
cp mysql-connector-java-5.1.24-bin.jar $SQOOP_HOME/lib/
rm mysql-connector-java-5.1.24-bin.jar*


https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-centos-7
http://backtobazics.com/big-data/4-steps-to-configure-hive-with-mysql-metastore-on-centos/
# MySql

wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo rpm -ivh mysql57-community-release-el7-11.noarch.rpm
rm mysql57-community-release-el7-11.noarch.rpm
sudo yum install mysql-server -y

sudo systemctl start mysqld
sudo systemctl status mysqld

sudo grep 'temporary password' /var/log/mysqld.log
sudo mysql_secure_installation

test db
mysqladmin -u root -p version

mysql -u root -p

```
create database hive DEFAULT CHARACTER SET utf8;
grant all PRIVILEGES on *.* TO 'hive'@'localhost' IDENTIFIED BY 'IqPTY6COGFFZ7qfQr5!' WITH GRANT OPTION;
exit
```

vi $HIVE_HOME/conf/hive-env.sh
```
export METASTORE_PORT=9084
```
---

vi $HIVE_HOME/conf/hive-site.xml


<?xml version="1.0"?>

<configuration>

  <property>
    <name>javax.jdo.option.ConnectionURL</name>
    <value>jdbc:mysql://localhost:3306/hive</value>
    <description>JDBC connection string used by Hive Metastore</description>
  </property>
  
  <property>
    <name>javax.jdo.option.ConnectionDriverName</name>
    <value>com.mysql.jdbc.Driver</value>
    <description>JDBC Driver class</description>
  </property>
  
  <property>
      <name>javax.jdo.option.ConnectionUserName</name>
      <value>hive</value>
      <description>Metastore database user name</description>
  </property>
  
  <property>
      <name>javax.jdo.option.ConnectionPassword</name>
      <value>IqPTY6COGFFZ7qfQr5!</value>
      <description>Metastore database password</description>
  </property>
  
  <property>
      <name>hive.metastore.uris</name>
      <value>thrift://localhost:9084</value>
      <description>Thrift server hostname and port</description>
  </property>

</configuration>

-----

schematool -dbType mysql -initSchema

beeline -u jdbc:hive2://

!q

nohup hive --service metastore


sqoop list-databases --connect jdbc:mysql://localhost --username root --password IqPTY6COGFFZ7qfQr5!


# Spark 2

wget http://ftp.cixug.es/apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
tar xvf spark-2.2.1-bin-hadoop2.7.tgz
rm spark-2.2.1-bin-hadoop2.7.tgz
sudo mv spark-2.2.1-bin-hadoop2.7 /opt
sudo chown hadoop:hadoop /opt/spark-2.2.1-bin-hadoop2.7

cp /opt/spark-2.2.1-bin-hadoop2.7/conf/log4j.properties.template \
    /opt/spark-2.2.1-bin-hadoop2.7/conf/log4j.properties

sed -i 's/log4j.rootCategory=INFO/log4j.rootCategory=WARN/' \
    /opt/spark-2.2.1-bin-hadoop2.7/conf/log4j.properties

cp $HIVE_HOME/conf/hive-site.xml $SPARK_HOME/conf/
mv $SPARK_HOME/bin/beeline $SPARK_HOME/bin/beeline_spark

# MongoDB

sudo vi /etc/yum.repos.d/mongodb-org-3.6.repo

[mongodb-org-3.6]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.6/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.6.asc

sudo yum install -y mongodb-org

sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
sudo service mongod restart

----

https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-centos-7


----
# Python

cd
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod a+x Miniconda2-latest-Linux-x86_64.sh
./Miniconda2-latest-Linux-x86_64.sh -b
sudo rm Miniconda2-latest-Linux-x86_64.sh

conda install jupyter

jupyter notebook --generate-config

mkdir ~/notebooks

vi /home/hadoop/.jupyter/jupyter_notebook_config.py

```
c.NotebookApp.port = 8001
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.notebook_dir= u'/home/hadoop/notebooks'

----

vi ~/jupyter.sh

#!/bin/bash

export PYSPARK_DRIVER_PYTHON="$HOME/miniconda2/bin/jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

pyspark --conf "spark.mongodb.input.uri=mongodb://127.0.0.1/test.myCollection?readPreference=primaryPreferred" \
        --conf "spark.mongodb.output.uri=mongodb://127.0.0.1/test.myCollection" \
        --packages org.mongodb.spark:mongo-spark-connector_2.11:2.2.1 \
        --packages com.databricks:spark-csv_2.10:1.5.0

-----

chmod a+x ~/jupyter.sh


conda create -n py36 python=3.6


-----
sudo vi /etc/rc.local


su - hadoop -c "/opt/hadoop/sbin/start-dfs.sh"
su - hadoop -c "/opt/hadoop/sbin/start-yarn.sh"
su - hadoop -c "nohup hive --service metastore > /opt/apache-hive-2.3.2-bin/hive.out 2> /opt/apache-hive-2.3.2-bin/hive.log &"
su - hadoop -c "/home/hadoop/jupyter.sh &"
exit 0
-----

sudo chmod +x /etc/rc.d/rc.local

----- R
 sudo yum install cairo -y

conda install -yc r r-essentials r-sparklyr



http://backtobazics.com/big-data/hadoop/7-steps-to-install-apache-hive-with-hadoop-on-centos/

http://backtobazics.com/big-data/4-steps-to-configure-hive-with-mysql-metastore-on-centos/







# Cluster

ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@192.168.2.31

scp hadoop-2.8.3.tar.gz 192.168.2.31:/home/hadoop

scp /opt/hadoop/etc/hadoop/* 192.168.2.31:/opt/hadoop/etc/hadoop/


~/miniconda2/envs/py36/bin/python prices.py


 # Spark ODBC
https://github.com/jaceklaskowski/mastering-spark-sql-book/blob/master/spark-sql-thrift-server.adoc
https://databricks.com/spark/odbc-driver-download

/opt/spark-2.2.1-bin-hadoop2.7/sbin/start-thriftserver.sh

 /opt/apache-hive-2.3.2-bin/bin/beeline -u jdbc:hive2://

!connect jdbc:hive2://localhost:10000

beeline -n hadoop -u jdbc:hive2://server:10000


!q

/opt/spark-2.2.1-bin-hadoop2.7/sbin/stop-thriftserver.sh

pip install sql_magic

# Big Prices

sudo yum install git

git clone git@github.com:dvillaj/BigPrices.git

source activate py36

pip install pandas
pip install requests


source deactivate


/home/hadoop/BigPrices/postgres/combine_prices.py -i /home/hadoop/raw/data/ -o /home/hadoop/output -p 10

hadoop fs -mkdir -p /raw/prices

cd /home/hadoop/output
hadoop fs -put *.txt /raw/prices


/home/cloudera/BigPrices/prices/maestros.py
/home/cloudera/BigPrices/prices/upload.sh


ln -s /opt/apache-hive-2.3.2-bin/lib/hive-service-2.3.2.jar /opt/spark-2.2.1-bin-hadoop2.7/jars/hive-service-2.3.2.jar