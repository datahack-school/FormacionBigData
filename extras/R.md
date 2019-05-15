# R

Este apartado describe los pasos que hay que realizar para instalar R 

## Instalación de R

En la consola escribe los siguientes comandos ...

```
conda install -yc r r-essentials r-sparklyr

```


## Acceso a R

Para acceder a la consola de R se utiliza el siguiente comando:
```
R

```

![](/images/R-1.png)

### Uso de Sparklyr

En la consola de R ...

```R

library(tidyverse)
library(sparklyr)

sc <- spark_connect(master = "local")
sc

```
