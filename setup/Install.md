# Instalación de la máquina virtual de Cloudera

Este apartado describe la instalación de la máquina virtual de Cloudera.

Los requerimientos mínimos son los siguientes:

-   Un equipo con más de 6Gb de memoria (sólo la máquina virtual necesita 4GB de memoria)
-   Arquitectura de 64 bits
-   Versión 5.2 o superior de VirtualBox 
-   Configuración de la BIOS del ordenador de forma que se permita la virtualización (esto normalmente no es necesario)


## Descarga de Software

El primer paso es instalar la última versión de la aplicación **VirtualBox**. Para ello hay que descargar el software del siguiente [enlace](https://www.virtualbox.org/wiki/Downloads)

![](/images/Install-software-1.png)

Por último descargamos la última versión de la máquina virtual de Cloudera en el siguiente [enlace](https://www.cloudera.com/downloads/quickstart_vms.html). 

Nota: También podemos recurrir a [Google](https://www.google.es/search?q=download+cloudera+virtual+machine+quickstart) para encontrar la localización de la máquina virtual

![](/images/Install-software-2.png)

Vamos a seleccionar la versión `VirtualBox` y pulsar el botón **"Get it Now"**

El archivo que se descarga en nuestro ordenador está en formato ZIP, por lo que será necesario descomprimirlo.

## Instalación de la máquina virtual

El siguiente paso es instalar la máquina virtual en **VirtualBox**

Para ello seleccionamos la opción de menú **"Archivo / Abrir servicio Virtualizado"**

![](/images/Install-1.png)

seleccionamos la carpeta donde hemos descomprimido la máquina virtual en el paso anterior

![](/images/Install-2.png)

y pulsamos el botón **"Importar"**

![](/images/Install-3.png)

En el siguiente [enlace](https://community.cloudera.com/t5/Hadoop-101-Training-Quickstart/How-to-setup-Cloudera-Quickstart-Virtual-Machine/ta-p/35056) hay un apartado de los problemas conocidos que podrían ocurrir al importar la máquina virtual

## Configuración de la máquina virtual

Una vez que la máquina ha sido instalada, el siguiente paso es configurarla. Para ello seleccionamos la opción **"Configuración"** pulsando el botón izquierdo del ratón.

![](/images/Install-4.png)

Pulsamos la opción **"Sistema"** y revisamos la memoria. Podríamos aumentar la memoria, pero en ningún caso no deberíamos darle más memoria que la tenemos disponible dentro del color verde de la barra.

![](/images/Install-5.png)

Ocurre lo mismo con el número de procesadores.

![](/images/Install-6.png)

El último paso es configurar los puertos de la máquina para tener acceso desde el exterior a varios de los servicios que vamos a desplegar.

En el menú de **"Red"** ...

![](/images/Install-7.png)

... pulsamos la etiqueta **"Avanzadas"**

![](/images/Install-8.png)

... y el botón **"Reenvío de Puertos"**

![](/images/Install-9.png)

Es necesario configurar los siguientes puertos:

| Nombre  | Protocolo | Puerto Anfitrión | Puerto Invitado|
| ------------- | ------------- | ------------- | 
| ssh       | TCP   | 2222  | 22    |
| jupyter   | TCP   | 8889  | 8889  |
| MongoDB   | TCP   | 27017 | 27017 |
| Spark     | TCP   | 4040  | 4040  |
| Api       | TCP   | 5000  | 5000  |
| WebServer | TCP   | 5001  | 5001  |


## Inicio de la máquina virtual

Para iniciar la máquina virtual hay que seleccionar la opción **"Inicio sin pantalla"**

![](/images/Install-10.png)

Y esperar unos minutos hasta que finalice el arranque

![](/images/Install-11.png)


## Parada de la máquina virtual

Para parar la máquina virtual lo aconsejable es seleccionar la opción **"Guardar Estado"**

![](/images/Install-12.png)

La próxima vez que se inicie irá mucho más rápido.
