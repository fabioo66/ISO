#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Uso: $0 <extensión>"    
    exit 1
fi

extension="$1"
reporte="reporte.txt"

# Limpia o crea el archivo de reporte al iniciar el script
touch "$reporte"

for usuario in $(cut -d: -f1 /etc/passwd); do
	
