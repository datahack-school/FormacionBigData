# Configuración del ODBC de Impala

En Windows 7, una vez que se ha instalado el cliente ODBC de Impala 64 bits, hay que acceder al panel de control y seleccionar "Configurar origenes de datos (ODBC)"

![](/images/odbc-1.png)

Pulsar el botón "Agregar" un nuevo origen de datos

![](/images/odbc-2.png)

Seleccionar el controlador "Cloudera ODBC for Impala" y pulsar el botón "Finalizar"

![](/images/odbc-3.png)

Escribir un nombre en el campo "Data Source Name" y escribir `localhost` en el campo Host

![](/images/odbc-4.png)

Pulsar el botón de "Test" para verificar la conexión (la máquina virtual de Cloudera debe de estar encendida)

![](/images/odbc-5.png)

Pulsar el botón "Ok" para añadir el origen de datos

![](/images/odbc-6.png)

Y ya está listo para ser utilizado!
