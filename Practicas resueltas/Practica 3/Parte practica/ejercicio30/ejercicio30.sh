#!/bin/bash

if [ ! -d "$HOME/bin" ]; then
    mkdir "$HOME/bin"
fi

cant=0

for archivo in *; do
	if [ -f "$archivo" ] && [ -x "$archivo" ]; then 
		mv "$archivo" "$HOME/bin"
		echo "Moviendo archivo \"$archivo\"..."
		cant=$((cant + 1))
	fi
done

if [ "$cant" -eq 0 ]; then
    echo "No se ha movido ningún archivo ejecutable."
else
    echo "La cantidad de archivos movidos es \"$cant\"."
fi
