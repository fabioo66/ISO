#!/bin/bash

if [ $# -ne 3 ]
then
    echo "Uso: $0 <directorio> -a|-b <CADENA>"
    exit 1
fi

directorio="$1"
op="$2"
cadena="$3"

if [ -d "$directorio" ]
then
    for archivo in "$directorio"/*
    do
        if [ -f "$archivo" ]
        then
            nombreArchivo=$(basename "$archivo")

            case "$op" in
                "-a")
                    nuevoNombre="${nombreArchivo}${cadena}"
                    ;;
                "-b")
                    nuevoNombre="${cadena}${nombreArchivo}"
                    ;;
                *)
                    echo "Error: Opción no válida. Usa -a para añadir al final o -b para añadir al principio."
                    exit 1
                    ;;
            esac

            # Renombra el archivo
            mv -v "$archivo" "$directorio/$nuevoNombre"
        fi
    done
    echo "Operación completada."
else
    echo "Error: El directorio no existe."
fi
