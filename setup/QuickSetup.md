# Configuración Rápida del servidor

## Verificación previa

Verifica que tienes acceso a Internet:

```
ping -c 1 www.google.es

```

![](/images/Setup-1.png)


Perfecto! Puedes continuar ...


Simplemente escribe los siguientes comandos en la consola:

```
cd

wget https://github.com/dvillaj/BigDataExamples/raw/master/setup/setup_.sh
openssl enc -d -aes-192-cbc -in setup_.sh -out setup.sh -pass pass:cloudera
sudo rm setup_.sh
chmod a+x setup.sh

./setup.sh 2>&1 | tee -a setup.out

source ~/.bashrc
```

![](/images/QuickSetup.png)


Nota: Esta instalación sólo es posible realizarla una vez, a partir de una versión original 
de la máquina virtual


<!--

```
cd ~/BigDataBook/setup
openssl enc -aes-192-cbc -in setup.sh -out setup_.sh -pass pass:cloudera

git add setup_.sh
git commit -m "Setup update"
git push

```
-->