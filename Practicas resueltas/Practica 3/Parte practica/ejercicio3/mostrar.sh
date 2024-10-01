#!/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:"
echo "$apellido $nombre"
echo "Su usuario es: `whoami`" 
# Lo agrego porque esta incompleto
echo "Su directorio actual es:"
pwd

# Nuevas funcionalidades
echo "Su directorio personal es: $HOME"

echo "Introduzca un directorio para ver su contenido"
read directorio

if [ -d "$directorio" ]
then
	echo "El contenido del directorio es:"
	ls "$directorio"	
else
	echo "El directorio no existe"
fi

echo "El espacio libre en disco es:"
df -h
