#!/bin/bash

#Para el servidor
sudo /etc/init.d/ssh stop

#Eliminar la tarea de crontab para que no gaste recursos
sudo crontab -l > mycron

sed -i '/redirect.sh/d' ./mycron

sudo crontab mycron
rm mycron
