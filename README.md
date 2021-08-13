Este conjunto de archivos permiten montar un servidor ssh accesible desde internet.

Hace uso de la característica PnP de los routers para poder abrir el puerto correspondiente, por lo que si no tiene habilitada esta opción en el router, no funcionará la parte encargada de la apertura. Alternativamente, se puede abrir manualmente el puerto accediendo a la configuración del router.

En este caso, el puerto predeterminado que se abre es el puerto 1021, si desea usar otro puerto, cambielo en cada uno de los archivos correspondientes (ssh_setup.ssh, ssh_start.sh, redirect.sh y sshd_config).

Se debe ejecutar primero el archivo ssh_dep_deb.sh (ssh_dep_arch.sh si es un sistema basado en Arch Linux) el cual instalará los programas necesarios para el servidor.

Luego, para montar el servidor se debe ejecutar ssh_setup.sh. Al ejecutarlo, se crearan claves para el servidor y solicitará una contraseña. Para el corrector funcionamiento, se debe dejar en blanco la contraseña.

Luego de ejecutar este archivo por primera vez, se ejecuta ssh_start.sh para iniciar el servidor, y ssh_stop.sh para detenerlo.

Después de ejecutar ssh_setup.sh correctamente se pueden eliminar todos los archivos excepto los de inicio y parada del servidor.
