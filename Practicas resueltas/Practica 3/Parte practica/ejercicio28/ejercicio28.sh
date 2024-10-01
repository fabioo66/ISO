#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Error: Tenes que ingresar un parametro"
	exit 1
fi

directorio="$1"
cant=0

if [ -d "$directorio" ]; then
	for archivo in "$directorio"/*; do
		if [ -f "$archivo" ] && [ -r "$archivo" ] && [ -w "$archivo" ]; then					
			cant=$((cant + 1))
		fi
	done
	echo "Cantidad de archivos con permisos de lectura y escritura: \"$cant\""
else
	echo "El directorio ingresado como parametro no existe"
	exit 4
fi
