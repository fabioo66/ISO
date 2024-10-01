#!/bin/bash

# Verificar que se reciban dos parámetros
if [ $# -ne 2 ]
then
    echo "Error: Se necesitan exactamente 2 parámetros."
    echo "Uso: $0 num1 num2"
    exit 1
fi

# Asignar los parámetros a variables
num1=$1
num2=$2

# Multiplicación
echo "La multiplicación es `expr $num1 \* $num2`"

# Suma
echo "La suma es `expr $num1 + $num2`"

# Resta
echo "La resta es `expr $num1 - $num2`"

# Verificar cuál es mayor
if [ $num1 -gt $num2 ] 
then
    echo "El mayor es $num1"
else
    echo "El mayor es $num2"
fi
