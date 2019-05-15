# Ejemplo 

Este apartado contiene una guía para crear un nuevo repositorio en GitHub.

## Creación del repositorio

El primer paso es crear un repositorio, mediante este [enlace](https://github.com/new).

Aquí simplemente elegimos un nombre para nuestro repositorio, por ejemplo, "hello-world" 

![](/images/Proyecto-1.png)

Y pulsamos el botón "Create repository"

![](/images/Proyecto-2.png)

## Inicialización del repositorio

El siguiente paso es conectarse al repositorio creado en GitHub y descargarlo en nuestro ordenador (en terminología git esta acción se llama "clonarlo").  

Para ello previamente tenemos que seleccionar un directorio de nuestro disco donde va a residir todos los ficheros del repositorio. En mi caso he creado el directorio `D:\Proyectos`

En **GitKraken**, pulsamos la opción de menú "File / Clone Repo" y nos conectamos al repositorio de GitHub que acabamos de crear

![](/images/Proyecto-3.png)

GitKraken nos preguntará si lo queremos abrir, y mas tarde si lo queremos inicializar. En ambos casos respondemos que si.

![](/images/Proyecto-4.png)

## Edición de código

En este ejemplo simplemente vamos a crear un fichero de código fuente en Python llamado "hello.py" y vamos a modificar el fichero README.md

Iniciamos el editor **SublimeText** y abrimos el directorio que contiene la ubicación del proyecto (Opción del menú "File / Open Folder") y seleccionamos la opción del menú "View / Side Bar / Show Side Bar"

En mi caso el directorio que contiene la ubicación del repositorio es `D:\Proyectos\hello-world`

![](/images/Proyecto-5.png)

Vamos a editar el fichero README.md utilizando un código llamado [MarkDown](https://guides.github.com/features/mastering-markdown/)

![](/images/Proyecto-6.png)

No se te olvide grabar el fichero mediante la opción de menú "File / Save"

Por último vamos a crear un script en Python llamado "hello.py". Nos posicionamos en el directorio hello-world y pulsamos el botón derecho del ratón:

![](/images/Proyecto-7.png)

Editamos el script en Python y salvamos el fichero con el nombre "hello.py" (opción del menú File / Save As...)

![](/images/Proyecto-8.png)

## Publicación del código en GitHub

El último paso es publicar nuestro código en GitHub. 

En **GitKrahen** tenemos que seguir los siguientes pasos:

1. Hacemos click sobre el icono de ficheros modificados
2. Pulsamos el botón "Stage all changes"
3. Escribimos un texto describiendo los cambios que hemos realizado y pulsamos el botón "Commit changes to 2 files"
4. Pulsamos el botón de "Push" para publicar los cambios en GitHub. Aquí necesitaras pulsar el botón "Submit" con las opciones que te ofrece por defecto

![](/images/Proyecto-9.png)

Para verificar que todo ha salido bien puedes entrar en tu proyecto de [GitHub](https://github.com/) y ver que los cambios están publicados.
