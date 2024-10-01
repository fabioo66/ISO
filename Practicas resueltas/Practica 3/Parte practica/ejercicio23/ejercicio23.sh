#!/bin/bash

array=(7 45 22 33 57 90 66 49 42 19 10)
cantImpares=0


for element in "${array[@]}"; do
	if [ $(expr "$element" % 2) -eq 0 ]; then
		echo "El \"$element\" es par"
	else
		cantImpares=$((cantImpares + 1))
	fi
done

echo "La cantidad de numeros impares que contiene el arreglo es \"$cantImpares\""
