# Ejemplo - Ejecución del código

En este apartado vamos a conectar el repositorio que acabamos de crear con la máquina virtual de Cloudera y así poder ejecutar el código

## Creación del directorio en la máquina virtual de Cloudera

El primer paso es crear el directorio que contendrá nuestro repositorio en la máquina virtual.

Para hacerlo necesitamos acceder a la máquina y crear el directorio mediante el comando `mkdir`

![](/images/Ejecucion-1.png)

## SFTP

El paquete SFTP que nos permitirá editar un script en el editor SublimeText y copiarlo automáticamente a la máquina virtual de Cloudera

En **SublimeText** ejecutamos la opción "Tools / Command Palette" y seleccionamos "Package Control: Install Package". Escribimos "SFTP" e pulsamos la tecla **Enter** para instalar el paquete

![](/images/Ejecucion-2.png)

**SublimeText** descargará e instalará el paquete de forma automática

![](/images/Ejecucion-3.png)

Por último nos queda configurar la conexión entre la ruta local en nuestro ordenador y la ruta que acabamos de crear en la máquina virtual de Cloudera. 

En el directorio raiz, seleccionamos la opción "Map to Remote" y escribimos la siguiente configuración:

```
{
    "type": "sftp", 
    "save_before_upload": true,
    "upload_on_save": true,
    "sync_down_on_open": false,
    "sync_skip_deletes": false,
    "sync_same_age": true,
    "confirm_downloads": false,
    "confirm_sync": true,
    "confirm_overwrite_newer": false,
    "host": "localhost",
    "user": "cloudera",
    "password": "cloudera",
    "port": "2222",
    "remote_path": "/home/cloudera/hello-world/",
    "ignore_regexes": [
        "\\.sublime-(project|workspace)", "sftp-config(-alt\\d?)?\\.json",
        "sftp-settings\\.json", "/venv/", "\\.svn/", "\\.hg/", "\\.git/",
        "\\.bzr", "_darcs", "CVS", "\\.DS_Store", "Thumbs\\.db", "desktop\\.ini"
    ],
    "connect_timeout": 30,
}
```

![](/images/Ejecucion-4.png)

Será la opción `remote_path` la que defina la ubicación el directorio en la máquina virtual de cloudera. 

Una vez grabada la configuración vamos a copiar todo el contenido del repositorio que se encuentra en nuestro ordernador a la máquina virtual de Cloudera.

En el directorio raix, seleccionamos la opción `Upload folder`

![](/images/Ejecucion-5.png)

Si todo ha ido bien veremos en la parte inferior de la pantalla la palabra "success" (esta pantalla desaparece si pulsamos la tecla escape)

![](/images/Ejecucion-6.png)

Como en la configuración el parámetro `upload_on_save` a `true`, cada vez que grabemos un fichero en el editor, se grabará automáticamente en el directorio remoto.

### Ejecución de código

Una vez copiado el repositorio en la máquina virtual de Cloudera, la ejecución del código se realiza mediante el comando `python`

Accedemos al directorio que acabamos de crear y ejecutamos el script `hello.py`

![](/images/Ejecucion-7.png)
