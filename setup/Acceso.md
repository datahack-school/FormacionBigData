# Acceso a la máquina virtual de Cloudera

## Acceso por SSH (Windows)

Para acceder a la consola de la máquina virtual de Cloudera es necesario utilizar un cliente SSH como **PuTTY**

Simplemente escribe en el campo **'Host Name'** el valor `localhost`, en el campo **'Port'** escribe el valor `2222` y pulsa el botón **"Open"**

![](/images/Putty-1.png)

Los datos de acceso al servidor son:

Login as: `cloudera`   
Password: `cloudera`

Al escribir la password parece que no está haciendo nada, pero es el comportamiento normal. Escribe la password y pulsa la tecla **Enter**.

![](/images/Putty-2.png)

## Acceso por FTP (Windows)

En el caso necesites copiar ficheros desde nuestro ordenador a la maquina virtual o viceversa, puedes utilizar un cliente FTP como **Filezilla**

Crea un nuevo sitio mediante la opción **"Archivo / Gestor de sitios"**

![](/images/Filezilla-1.png)

Escribe los siguientes valores

![](/images/Filezilla-2.png)

Y pulsa el botón **"Conectar"**

![](/images/Filezilla-3.png)

## Mac 

El acceso por SSH se realiza desde la consola con el siguiente comando:

```
ssh cloudera@localhost -p 2222
```

Y para acceder por FTP:

```
sftp -o "Port 2222" cloudera@localhost
```