#!/bin/bash

pila=()

push() {
    if [ $# -ne 1 ]; then
        echo "Error: Tenés que ingresar un parámetro"
    else
        pila+=("$1")
    fi
}

pop() {
    if [ ${#pila[@]} -eq 0 ]; then
        echo "Error: La pila está vacía"
    else
        unset pila[$((${#pila[@]} - 1))]
    fi
}

length() {
    echo ${#pila[@]}
}

print() {
    if [ ${#pila[@]} -eq 0 ]; then
        echo "Error: La pila está vacía"
    else
        for element in "${pila[@]}"; do
            echo "$element"
        done
    fi
}

for ((i=0; i<10; i++)); do
	push pepe
done

for ((i=0; i<3; i++)); do 
	pop
done

print

length

