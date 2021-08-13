#!/bin/bash

#Usa unpnpc para abrir el puerto 1021 en el router
upnpc -e 'SSH on Debian' -r 1021 TCP

#Inicia el servidor
sudo /etc/init.d/ssh start

#Añade redirect.sh al final de crontab para que se ejecute cada 20 minutos
sudo crontab -l > mycron
echo "*/20 * * * * /usr/local/bin/redirect.sh" >> mycron

sudo crontab mycron
rm mycron
