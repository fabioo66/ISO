#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Error: tenes que pasar como minimo un parametro"
	exit 1
fi

cant=0
i=1

for param in "$@"; do
	if (( i % 2 != 0 )); then		
		if [ -e "$param" ]; then
		       if [ -d "$param" ]; then
			       echo "El archivo \"$param\" es un directorio"
		       else
			       echo "El archivo \"$param\" es un archivo"
		       fi
		else
			cant=$((cant + 1))
		fi
	fi
	i=$((i + 1))
done

echo "La cantidad de archivos inexistentes en el sistema es \"$cant\""
