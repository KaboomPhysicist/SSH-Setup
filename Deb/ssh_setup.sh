#!/bin/bash

#Copia el archivo de configuración preestablecido
sudo cp ../sshd_config /etc/ssh/sshd_config

#Genera nuevas claves ssh para usar con el servidor
sudo ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -b 4096
sudo ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -t ecdsa -b 521
sudo ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -t ed25519

#Inicializa el servidor por un momento para generar los archivos necesarios
sudo /etc/init.d/ssh start
sudo /etc/init.d/ssh stop

#Limita el número de conexiones simultaneas de una misma IP al puerto 1021
#Si se cambia el puerto en sshd_config, es necesario cambiarlo aqui
sudo iptables -A INPUT -p tcp --dport 1021 -m conntrack --ctstate NEW -m recent --set --name ssh --rsource
sudo iptables -A INPUT -p tcp --dport 1021 -m conntrack --ctstate NEW -m recent --rcheck --seconds 60 --hitcount 4 --name ssh --rsource -j DROP

#fail2ban sirve para banear IPs que tengan muchos intentos fallidos de conexion

sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo cp ../sshjail.local /etc/fail2ban/jail.d/sshjail.local

sudo /etc/init.d/fail2ban restart

upnpc -l
upnpc -e 'SSH on Debian' -r 1021 TCP

cp redirect.sh /usr/local/bin/redirect.sh
