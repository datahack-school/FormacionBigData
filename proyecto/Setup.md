# Configuración

Esta guía permite instalar y configurar todo el software necesario para realizar un proyecto personal.

Vamos a necesitar utilizar varios componentes:

## GitHub

GitHub es una plataforma de **desarrollo colaborativo de software** para alojar proyectos utilizando el sistema de control de versiones [Git](https://www.wikiwand.com/es/Git).

GitHub aloja tu repositorio de código y te brinda herramientas muy útiles para el trabajo en equipo, dentro de un proyecto.

Para crear una cuenta GitHub vamos a seguir los siguientes pasos:

* Entra en [GitHub](https://github.com/) y pulsa el botón "Sign Up"

![Plan](/images/GitHub-1.png)

* Elige un plan gratuito

![Plan](/images/GitHub-2.png)

* Verifica la dirección de correo pulsando el enlace que te ha tenido que llegar a tu cuenta de correo electrónico.

![Final](/images/GitHub-3.png)


## GitKraken

GitKraken es un **cliente para el control de versiones Git**. Es un software gratuito si lo utilizamos de forma no profesional.  

GitKraken nos servirá para descargar y publicar nuestro código en GitHub de una forma muy sencilla.

Descarga e instala la última versión disponible del software en su [web](https://www.gitkraken.com/)

GitKraken te solicitará un usuario y una password. Utilizaremos el usuario que acabamos de crear en GitHub pulsando el botón "Sign in with GitHub"

![Sigin GitKraken](/images/GitKraken-1.png)

No es necesario utilizar la versión Profesional, por lo que rechazaremos amablemente su propuesta de comenzar una prueba gratuita

![Prueba gratuita](/images/GitKraken-2.png)

Por último vamos a conectar GitKraken con GitHub a través de una clave SSH. Para ello vamos a ir la configuración pulsando la opción de menú "File / Preferences"

Primero pulsamos el botón "Connect to GitHub"

![Connect to GitHub](/images/GitKraken-3.png)

y mas tarde el botón "Generate SSH Key and add to GitHub"

![Connect to GitHub](/images/GitKraken-4.png)

Si todo ha ido bien, aparecerá una pantalla parecida a esta:

![Connected!](/images/GitKraken-5.png)


## SublimeText

SublimeText es un **editor de código fuente**. Aunque es su licencia no es gratuita nos permite utilizar una versión de prueba que no le resta ninguna funcionalidad

Utilizaremos SublimeText para editar el código fuente de nuestro proyecto. Descarga e instala la última versión disponible del software en su [web](https://www.sublimetext.com/)

Una vez iniciado el editor, instala el control de paquetes siguiendo los pasos de la siguiente [web](https://packagecontrol.io/installation)

![Contro de Paquetes](/images/Sublime-1.png)

Y por último edita las preferencias del editor desde la opción de menú "Preferences / Settings"

![Preferencias](/images/Sublime-2.png)

```
{
    "always_show_minimap_viewport": true,
    "bold_folder_labels": true,
    "color_scheme": "Packages/Color Scheme - Default/Monokai.tmTheme",
    "draw_minimap_border": true,
    "fade_fold_buttons": false,
    "font_size": 11,
    "highlight_line": true,
    "highlight_modified_tabs": true,
    "ignored_packages": ["Vintage"],
    "show_encoding": true,
    "tab_size": 4,
    "theme": "Default.sublime-theme",
    "translate_tabs_to_spaces": true,
    "default_line_ending": "unix"
}
```

Asegurate de que grabas las preferencias a través de la opción de menú "File / Save"