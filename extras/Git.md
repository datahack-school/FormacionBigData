# Git

## Generación de claves SSH

```
cd
ssh-keygen -t rsa -b 4096 -C "dvillaj@gmail.com"

```

## Exportación de clave

```
cat .ssh/id_rsa.pub

```


## Configuración de Git

```
git config --global user.name "Daniel Villanueva"
git config --global user.email "dvillaj@gmail.com"

```

## Clean del repositorio 

Cuidado: Esta acción **borra** los archivos que se han modificado!

```
cd $HOME/Hadoop 

git reset HEAD --hard
git clean -fd

```

<!--
## Actualización del repositorio 
``` 
cd 
rm -rf Hadoop 
git clone https://github.com/dvillaj/BigDataExamples.git Hadoop 

cd $HOME/Hadoop 
git checkout $BOOK_VERSION 
```
-->
## Actualización del repositorio 
```
cd

rm -rf Hadoop
wget https://github.com/dvillaj/BigDataExamples/archive/Version-20180221.zip
unzip Version-20180221.zip
mv BigDataExamples-Version-20180221 Hadoop
sudo rm Version-20180221.zip

```
