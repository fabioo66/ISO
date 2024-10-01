#!/bin/bash

archivos_doc=()

# Agregar archivos .doc al arreglo
for archivo in /home/*.doc; do
    if [ -f "$archivo" ]; then
        archivos_doc+=("$archivo")
    fi
done

buscarArchivo() {
    if [ $# -ne 1 ]; then
        echo "Error: Tenés que ingresar un archivo por parámetro"
        return 1
    fi
    
    file="$1"
    encontre=0
    i=0

    while [ "$i" -lt ${#archivos_doc[@]} ] && [ "$encontre" -eq 0 ]; do
        if [ "${archivos_doc[$i]}" = "$file" ]; then
            encontre=1
            return "$i"  # Indica que se encontró el archivo
        else
            i=$((i + 1))
        fi
    done
    
    return -1  # Indica que no se encontró el archivo
}

verArchivo() {
    if [ $# -ne 1 ]; then
        echo "Error: Tenés que ingresar un archivo por parámetro"
        return 1
    fi

    file="$1"
    buscarArchivo "$file" 

    if [ $? -ge 0 ]; then  # Verificar el valor de retorno de buscarArchivo
        cat "$file"
    else
        echo "Archivo no encontrado"
        return 5  # Indica que el archivo no fue encontrado
    fi    
}

cantidadArchivos() {
    echo "${#archivos_doc[@]}"
}

borrarArchivo() {
    if [ $# -ne 1 ]; then
        echo "Error: Tenés que ingresar un archivo por parámetro"
        return 1
    fi

    file="$1"
    buscarArchivo "$file"

    if [ $? -ge 0 ]; then
        echo "¿Desea eliminar el archivo lógicamente? (SI/NO)"
        read opcion
        if [ "$opcion" != "SI" ] && [ "$opcion" != "NO" ]; then
            echo "Error: operación inválida"
            return 1
        fi
        
        # Eliminar del arreglo
        index=$?
        unset archivos_doc[$index]
        archivos_doc=("${archivos_doc[@]}") 

        if [ "$opcion" == "NO" ]; then
            rm "$file"  
        fi
    else
        echo "Archivo no encontrado"
        return 10
    fi
}
