# Configuración de Twitter

## Obtención de las claves de acceso

El primer paso es obtener las claves de acceso de Twitter en la página de [Application Management](https://apps.twitter.com/)

Hay muchos ejemplos de cómo se realiza este paso en [Google](https://www.google.es/search?ei=tL92WumaOYe6UY7-lIgN&q=get+api+keys+tokens+twitter&oq=get+api+keys+tokens+twitter)

Por ejemplo:

https://www.slickremix.com/docs/how-to-get-api-keys-and-tokens-for-twitter/

Las claves de acceso se pueden ver en la siguiente pantalla:


![](/images/Twitter-1.png)

![](/images/Twitter-2.png)


## Configuración

Vamos a ejecutar el siguiente código para almacenar en el fichero `twitter.keys` las claves de acceso de Twitter:

```
cat <<EOF >~/twitter.keys

# Twitter
export TWITTER_CONSUMER_KEY=wQlw5UJp8YMi04cutA70iNWDB
export TWITTER_CONSUMER_SECRET=adx1cPLiF6hpmeV5oRVSBhk9CtU3vWPBF7kTGzb2H0ErnTM9rc
export TWITTER_ACCESS_TOKEN=12391902-0bZCGZcLcnYIASAGxVbzB2rOMpAcAA1wG1QfkLdzH
export TWITTER_ACCESS_TOKEN_SECRET=6x5lXv9WbIBrsFgzzoQ8vpLr7NOQ2agy0lDlGBoTaTJua
EOF

cat <<EOF >>~/.bashrc

# Twitter
source ~/twitter.keys
EOF

```

El siguiente paso es editar este fichero para escribir **nuestras propias claves**:

Nota: Estas claves se pueden copiar/pegar desde la página web https://apps.twitter.com/

```
nano ~/twitter.keys
```

![](/images/Twitter-3.png)

Pulsamos **"Control+X"** para salir del editor y probamos la conexión ejecutando el siguiente código:

```
source $HOME/.bashrc
python ~/TwitterData/check.py

```

![](/images/Twitter-4.png)

En caso de problemas de conexión volveríamos a editar el fichero de claves `twitter.keys` para verificar que las claves corresponden exactamente a las que nos ha proporcionado **Twitter**.

Por último modificamos los ficheros de configuración para que se tengan en cuenta estas claves:

```
find /home/cloudera/Hadoop/ -type f -name *.conf  -print0 | xargs -0 \
sed -i "s/CONSUMER_KEY/$TWITTER_CONSUMER_KEY/"

find /home/cloudera/Hadoop/ -type f -name *.conf  -print0 | xargs -0 \
sed -i "s/CONSUMER_SECRET/$TWITTER_CONSUMER_SECRET/"

find /home/cloudera/Hadoop/ -type f -name *.conf  -print0 | xargs -0 \
sed -i "s/ACCESS_TOKEN/$TWITTER_ACCESS_TOKEN/"

find /home/cloudera/Hadoop/ -type f -name *.conf  -print0 | xargs -0 \
sed -i "s/ACCESS_SECRET/$TWITTER_ACCESS_TOKEN_SECRET/"

```

![](/images/Twitter-5.png)