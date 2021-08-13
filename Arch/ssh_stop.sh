#!/bin/bash

#Para el servidor
sudo systemctl stop sshd

#Eliminar la tarea de crontab para que no gaste recursos
sudo crontab -l > mycron

sed -i '/redirect.sh/d' ./mycron

sudo crontab mycron
rm mycron
