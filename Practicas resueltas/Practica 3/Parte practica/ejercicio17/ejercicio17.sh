#!/bin/bash

echo "Archivos directorio actual"
ls

echo "Archivos directorio actual intercambiando minusculas por mayusculas y eliminando la 'a,A'"

for file in *
do
	echo "$file" | tr 'a-zA-Z' 'A-Za-z' | tr -d 'aA'
done

