# Instalación de Python

cd
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod a+x Miniconda2-latest-Linux-x86_64.sh
./Miniconda2-latest-Linux-x86_64.sh -b
sudo rm Miniconda2-latest-Linux-x86_64.sh

echo '' >> $HOME/.bashrc
echo '# Python' >> $HOME/.bashrc

echo 'export PYTHONIOENCODING=utf8' >> .bashrc 
echo 'export PATH=$HOME/miniconda2/bin:$PATH' >> .bashrc 
source $HOME/.bashrc

# Acceso a HDFS desde Python

# conda install hdfs3 -yc conda-forge

# Dependencias de Python

pip install --upgrade pip
pip install tweepy
pip install PrettyTable
pip install pprintpp
pip install pandas

# Proyectos relacionados

wget https://github.com/dvillaj/BigDataExamples/archive/Version-20180221.zip
unzip Version-20180221.zip
mv BigDataExamples-Version-20180221 Hadoop
sudo rm Version-20180221.zip

wget https://github.com/dvillaj/GetDataWS/archive/master.zip
unzip master.zip
mv GetDataWS-master GetDataWS
sudo rm master.zip

wget https://github.com/dvillaj/TwitterData/archive/master.zip
unzip master.zip
mv TwitterData-master TwitterData
sudo rm master.zip

wget https://github.com/dvillaj/KafkaSample/archive/master.zip
unzip master.zip
mv KafkaSample-master KafkaSample
sudo rm master.zip

wget https://github.com/dvillaj/cdh-twitter-example/archive/master.zip
unzip master.zip
mv cdh-twitter-example-master cdh-twitter-example
sudo rm master.zip

# Permisos de ejecución

cd $HOME/Hadoop
find $HOME/Hadoop/ -name *.sh -exec chmod u+x {} \;


# Configuración del PATH

cat <<EOF >>~/.bashrc

# Dependencias
export PATH=\$HOME/GetDataWS:\$PATH
export PATH=\$HOME/KafkaSample:\$PATH
export PATH=\$HOME/Hadoop/hdfs:\$PATH
EOF

source ~/.bashrc

# Datos

cd $HOME/Hadoop

python util/gdown.py --id 1YthjLprAyaR7UC890tElxJXuWmrMunO1 \
    movielens/data/movielens.sql.gz

cd $HOME/Hadoop/movielens
gunzip data/movielens.sql.gz
mysql -u root -pcloudera < data/movielens.sql

cd $HOME/Hadoop/spark
gunzip data/shakespeare.txt.gz


# Hora y editor por defecto

cd
sudo cp /etc/localtime /root/old.timezone
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime

cat <<EOF >>~/.bash_profile 
export VISUAL="nano" 
export EDITOR="nano" 
EOF
source $HOME/.bash_profile


# Drivers JSON para Hive

cd
sudo mkdir -p /usr/lib/flume-ng/plugins.d/twitter-streaming/lib/
sudo mkdir -p /var/lib/flume-ng/plugins.d/twitter-streaming/lib/

sudo cp $HOME/cdh-twitter-example/flume-sources/target/flume-sources-1.0-SNAPSHOT.jar \
    /usr/lib/flume-ng/plugins.d/twitter-streaming/lib
sudo cp $HOME/cdh-twitter-example/flume-sources/target/flume-sources-1.0-SNAPSHOT.jar \
    /var/lib/flume-ng/plugins.d/twitter-streaming/lib

echo "ADD JAR $HOME/cdh-twitter-example/hive-serdes/target/hive-serdes-1.0-SNAPSHOT.jar;"\
    | sudo tee --append /etc/hive/conf.dist/.hiverc

sudo service hive-server2 restart
#cat /etc/hive/conf.dist/.hiverc

# Kafka

cd
wget https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz
tar -xzf kafka_2.11-1.0.0.tgz
sudo rm kafka_2.11-1.0.0.tgz

echo '' >> $HOME/.bashrc
echo '# Kafka' >> $HOME/.bashrc

echo 'export KAFKA_HOME=$HOME/kafka_2.11-1.0.0' >> $HOME/.bashrc
echo 'export PATH=$KAFKA_HOME/bin:$PATH' >> $HOME/.bashrc
source $HOME/.bashrc

pip install kafka-python
pip install RandomWords


# Cliente Telnet
#sudo yum install -y telnet


# Spark 1

sudo ln -s /usr/lib/hive/conf/hive-site.xml /usr/lib/spark/conf/hive-site.xml
sudo cp /etc/spark/conf/log4j.properties.template /etc/spark/conf/log4j.properties

sudo sed -i 's/log4j.rootCategory=INFO/log4j.rootCategory=WARN/' \
    /etc/spark/conf/log4j.properties

```

## Jupyter

```
cd
pip install jupyter
pip install test_helper
pip install matplotlib

jupyter notebook --generate-config

sudo cp $HOME/Hadoop/spark/jupyter_notebook_config.py $HOME/.jupyter


# Mongo

cd
sudo cp $HOME/Hadoop/config/mongodb-org-3.6.repo /etc/yum.repos.d/mongodb-org-3.6.repo
sudo yum install --nogpgcheck -y mongodb-org

sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
sudo service mongod restart

pip install pymongo
pip install py4j

wget https://github.com/mongodb/mongo-hadoop/archive/r2.0.2.tar.gz \
    -O /tmp/mongo-hadoop-r2.0.2.tar.gz
mkdir $HOME/mongo-hadoop
tar -xvzf /tmp/mongo-hadoop-r2.0.2.tar.gz -C $HOME/mongo-hadoop --strip-components=1
cd $HOME/mongo-hadoop/spark/src/main/python
python setup.py install
rm -rf $HOME/mongo-hadoop/

echo 'export PYTHONPATH=$HOME/Hadoop/lib/' >> ~/.bash_profile
source /home/cloudera/.bash_profile 

# Api REST

cd
pip install flask 
pip install flask-jsonpify
pip install flask-sqlalchemy
pip install flask-restful
pip install flasgger

# ZooKeeper

cd
pip install kazoo

# Avro

cd ~/Hadoop/avro
wget http://repo1.maven.org/maven2/org/apache/avro/avro-tools/1.8.2/avro-tools-1.8.2.jar

pip install avro


# Spark2 

# Instalación de Java 8

sudo yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel


# Descarga de Spark 2

cd
wget https://archive.apache.org/dist/spark/spark-2.2.2/spark-2.2.2-bin-hadoop2.7.tgz

tar xvf spark-2.2.2-bin-hadoop2.7.tgz
sudo rm spark-2.2.2-bin-hadoop2.7.tgz

sudo ln -s spark-2.2.2-bin-hadoop2.7 spark2
sudo rm /home/cloudera/spark2/bin/beeline*

# Configuración

sudo ln -s /usr/lib/hive/conf/hive-site.xml \
    ~/spark2/conf/hive-site.xml

sudo cp ~/spark2/conf/log4j.properties.template \
    ~/spark2/conf/log4j.properties

sudo sed -i 's/log4j.rootCategory=INFO/log4j.rootCategory=WARN/' \
    ~/spark2/conf/log4j.properties


# Versión de Java de SQOOP

sudo sed -i 's/export SQOOP_HOME=\/usr\/lib\/sqoop/export SQOOP_HOME=\/usr\/lib\/sqoop\
export JAVA_HOME=\/usr\/java\/jdk1.7.0_67-cloudera/' /usr/bin/sqoop

grep JAVA_HOME /usr/bin/sqoop


# Variables de entorno 

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

# Configuración de Twitter

cat <<EOF >~/twitter.keys

# Twitter
export TWITTER_CONSUMER_KEY=wQlw5UJp8YMi04cutA70iNWDB
export TWITTER_CONSUMER_SECRET=adx1cPLiF6hpmeV5oRVSBhk9CtU3vWPBF7kTGzb2H0ErnTM9rc
export TWITTER_ACCESS_TOKEN=12391902-0bZCGZcLcnYIASAGxVbzB2rOMpAcAA1wG1QfkLdzH
export TWITTER_ACCESS_TOKEN_SECRET=6x5lXv9WbIBrsFgzzoQ8vpLr7NOQ2agy0lDlGBoTaTJua
EOF

cat <<EOF >>~/.bashrc

# Twitter
source ~/twitter.keys
EOF

source $HOME/.bashrc
python ~/TwitterData/check.py

find /home/cloudera/Hadoop/ -type f -name *.conf  -print0 | xargs -0 \
sed -i "s/CONSUMER_KEY/$TWITTER_CONSUMER_KEY/"

find /home/cloudera/Hadoop/ -type f -name *.conf  -print0 | xargs -0 \
sed -i "s/CONSUMER_SECRET/$TWITTER_CONSUMER_SECRET/"

find /home/cloudera/Hadoop/ -type f -name *.conf  -print0 | xargs -0 \
sed -i "s/ACCESS_TOKEN/$TWITTER_ACCESS_TOKEN/"

find /home/cloudera/Hadoop/ -type f -name *.conf  -print0 | xargs -0 \
sed -i "s/ACCESS_SECRET/$TWITTER_ACCESS_TOKEN_SECRET/"

# Fin

grep "Error is not recoverable" setup.out > errors.out
grep ERROR setup.out >> errors.out
grep ^\./setup.sh setup.out >> errors.out

cat errors.out
if  [[ -s errors.out ]]; then
    echo 'Instalación realizada con errores!'
else
    echo 'Instalación completada con éxito'
fi

rm errors.out
rm setup.sh