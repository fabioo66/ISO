#!/bin/bash

pila=()

push() {
    if [ $# -ne 1 ]; then
        echo "Error: Tenés que ingresar un parámetro"
	return 1
    else
        pila+=("$1")
    fi
}

pop() {
    if [ ${#pila[@]} -eq 0 ]; then
        echo "Error: La pila está vacía"
	return 1
    else
	echo "Elemento a eliminar: ${arreglo_b[${#pila[@]}
        unset pila[${#pila[@]}]
	pila=(${pila[@]})
    fi
}

length() {
    echo ${#pila[@]}
}

print() {
    if [ ${#pila[@]} -eq 0 ]; then
        echo "Error: La pila está vacía"
	return 1
    else
        for element in "${pila[@]}"; do
            echo "$element"
        done
    fi
}
