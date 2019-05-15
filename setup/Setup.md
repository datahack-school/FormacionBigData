# Configuración del servidor

Mediante un cliente SSH se deben de introducir los siguientes bloques de comandos desde la consola, de uno en uno y en el orden establecido.

Si se utiliza **Putty** el procedimiento es sencillo, se copian todas las líneas de cada bloque en el Clipboard (Control + C) y se pegan en la consola pulsando el botón izquierdo del ratón, sin olvidar de pulsar la tecla Enter para ejecutar la última línea de cada bloque correctamente. 

## Verificación previa

Verifica que tienes acceso a Internet:

```
ping -c 1 www.google.es

```

![](/images/Setup-1.png)


Perfecto! Puedes continuar ...

## Instalación de Python

```
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
python --version

```

![](/images/Setup-2.png)

¿La versión es 2.7 de Anaconda? Perfecto!

<!--
## Acceso a HDFS desde Python

```
conda install hdfs3 -yc conda-forge

```

-->

![](/images/Setup-3.png)

## Dependencias de Python

```
pip install --upgrade pip
pip install tweepy
pip install PrettyTable
pip install pprintpp
pip install pandas

```

![](/images/Setup-4.png)

<!--
## Versión del código Fuente

```
cat <<EOF >>~/.bashrc

# Versión
export BOOK_VERSION=Version-20180221
EOF

source ~/.bashrc
```


## Proyectos relacionados

```
git clone git@github.com:dvillaj/BigDataExamples.git Hadoop
git clone git@github.com:dvillaj/GetDataWS.git
git clone git@github.com:dvillaj/TwitterData.git
git clone git@github.com:dvillaj/KafkaSample.git
git clone git@github.com:dvillaj/cdh-twitter-example.git
```

```
cd
git clone https://github.com/dvillaj/BigDataExamples.git Hadoop
git clone https://github.com/dvillaj/cdh-twitter-example.git
git clone https://github.com/dvillaj/TwitterData.git
git clone https://github.com/dvillaj/GetDataWS.git
git clone https://github.com/dvillaj/KafkaSample.git

cd $HOME/Hadoop
git checkout $BOOK_VERSION
```
-->

## Proyectos relacionados

```
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

```

![](/images/Setup-5-updated.png)

## Permisos de ejecución

```
cd $HOME/Hadoop
find $HOME/Hadoop/ -name *.sh -exec chmod u+x {} \;

```

## Configuración del PATH

```
cat <<EOF >>~/.bashrc

# Dependencias
export PATH=\$HOME/GetDataWS:\$PATH
export PATH=\$HOME/KafkaSample:\$PATH
export PATH=\$HOME/Hadoop/hdfs:\$PATH
EOF

source ~/.bashrc

```

## Datos

```
cd $HOME/Hadoop

python util/gdown.py --id 1YthjLprAyaR7UC890tElxJXuWmrMunO1 \
    movielens/data/movielens.sql.gz

cd $HOME/Hadoop/movielens
gunzip data/movielens.sql.gz
mysql -u root -pcloudera < data/movielens.sql

cd $HOME/Hadoop/spark
gunzip data/shakespeare.txt.gz

```

![](/images/Setup-6.png)

## Hora y editor por defecto

```
cd
sudo cp /etc/localtime /root/old.timezone
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime

cat <<EOF >>~/.bash_profile 
export VISUAL="nano" 
export EDITOR="nano" 
EOF
source $HOME/.bash_profile

```


## Drivers JSON para Hive

```
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
cat /etc/hive/conf.dist/.hiverc

```

![](/images/Setup-7.png)

## Kafka

```
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

```

![](/images/Setup-8.png)

<!--
## Cliente Telnet
```
sudo yum install -y telnet

```

![](/images/Setup-9.png)

-->

## Spark 1

```
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

```

![](/images/Setup-10.png)

## Mongo

```
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

```

![](/images/setup-11.png)

## Api REST

```
cd
pip install flask 
pip install flask-jsonpify
pip install flask-sqlalchemy
pip install flask-restful
pip install flasgger

```

![](/images/Setup-12.png)

## ZooKeeper

```
cd
pip install kazoo

```

![](/images/Setup-13.png)

## Avro

```
cd ~/Hadoop/avro
wget http://repo1.maven.org/maven2/org/apache/avro/avro-tools/1.8.2/avro-tools-1.8.2.jar

pip install avro
```

<!--

## HBase

```
cd
pip install happybase

```

![](/images/Setup-14.png)

-->

## Fichero Hosts

Editar el fichero **hosts** y añadir la siguiente línea: 

```
127.0.0.1 quickstart.cloudera
```

La ubicación de este fichero en los distintos sistemas operativos se puede encontrar en este [enlace](https://www.wikiwand.com/es/Archivo_hosts).   

Por ejemplo, en **Windows**, el fichero se encuentra en la ruta `%systemroot%\system32\drivers\etc\hosts`, mientras que en **Mac**, se encuentra en `/etc/hosts`

Para editar este fichero en **Windows**, lo mejor es ejecutar el programa **notepad** en modo administrador ...

![](/images/Hosts-1.png)

Abrir el fichero ...

![](/images/Hosts-2.png)

Y por último modificarlo y guardarlo

![](/images/Hosts-3.png)