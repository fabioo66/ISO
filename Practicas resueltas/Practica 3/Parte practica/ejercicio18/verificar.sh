#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Error: Tenes que ingresar un usuario como parametro"
	exit 1
fi

usuario="$1"

if [ $(cat /etc/passwd | grep "$usuario" | wc -l) -gt 0 ]; then
	
	while [ true ]; do
		if [ $(who | grep -c "$usuario") -gt 0 ]; then
			echo "El usuario se acaba de loguear en el sistema"
			exit 0
		fi

		echo "El usuario no se logueo"
		sleep 10
	done
else
	echo "Error: el usuario no existe en el sistema"
fi

