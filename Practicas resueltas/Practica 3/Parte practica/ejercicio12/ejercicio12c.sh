#!/bin/bash

if [ $# -ne 3 ]
then
		echo "Error: Se necesitan exactamente 3 parámetros."
		echo "Uso: $0 num1 operacion num2"
		exit 1
fi
		
num1=$1
op=$2
num2=$3

case $op in
    +)
        resultado=$((num1 + num2))
        ;;
    -)
        resultado=$((num1 - num2))
        ;;
    x)
        resultado=$((num1 * num2))
        ;;
    %)
        if [ "$num2" -eq 0 ]; then
            echo "Error: División por cero no permitida."
            exit 1
        fi
        resultado=$((num1 % num2))
        ;;
    *)
        echo "Error: Operación no válida. Solo se permiten +, -, *, %."
        exit 1
        ;;
esac

echo "El resultado de la operacion '$op' entre los numeros $num1 y $num2 es $resultado"
