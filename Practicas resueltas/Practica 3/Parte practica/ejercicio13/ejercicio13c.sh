# !/bin/bash

if [ $# -ne 1 ] 
then
	echo "Error: debe ingresar 1 (un) parametro"
	exit 1
fi 

nombre="$1"

if [ -e "$nombre" ]
then 
	echo "El archivo ingresado como parametro EXISTE!!"
	if [ -d "$nombre" ]
	then
		echo "El archivo es un directorio"
	else
		echo "El archivo no es un directorio"
	fi
else
	echo "El archivo no existe, procedo a crear un directorio con el nombre ingresado"
	mkdir "$nombre"
	echo "Directorio creado!"
fi

