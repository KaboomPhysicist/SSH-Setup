#!/bin/bash

#Ejecuta el comando para abrir el puerto, elimina la salida
upnpc -e 'SSH on Debian' -r 1021 TCP> /dev/null

