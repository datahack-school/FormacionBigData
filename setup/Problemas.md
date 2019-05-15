# Resolución de problemas

## Copiar/Pegar el código para los usuarios de Mac

Si eres usuario de **Mac** y quieres copiar y pegar el código incluido en este libro, deberás utilizar el software Adobe Reader o el lector de ficheros PDF que viene incluido en el navegador Chrome


## Name node is in safe mode

Podría ocurrir que aparezca el mensaje de error 'Name node is in safe mode'.   
La solución es ejecutar el siguiente comando:

```
hdfs dfsadmin -safemode leave
```

## Warning org.apache.hadoop.hdfs.DFSClient

Debido a la versión de **Hadoop** que utiliza Cloudera, de vez en cuando, aparece el siguiente mensaje en consola:

```
WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception
java.lang.InterruptedException
        at java.lang.Object.wait(Native Method)
        at java.lang.Thread.join(Thread.java:1252)
        at java.lang.Thread.join(Thread.java:1326)
        at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:952)
        at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:690)
        at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:879)
```

Este mensaje es simplemente aviso y no tiene ninguna consecuencia

## Acceso a Internet con Windows 10

Los usuarios de Windows 10 que no tengan acceso a Internet desde la consola tienen que ejecutar el siguiente código ...

```
sudo cp /usr/bin/cloudera-quickstart-ip \
    /usr/bin/cloudera-quickstart-ip.backup

sudo sed -i 's/for DEV in eth0 eth1 eth2;/for DEV=eth1;/' \
    /usr/bin/cloudera-quickstart-ip
```

... y reiniciar la máquina