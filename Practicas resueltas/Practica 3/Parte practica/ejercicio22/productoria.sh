#!/bin/bash

num=(10 3 5 7 9 3 5 4)

productoria() {
	resultado=1
	for elemento in "${num[@]}"; do
		resultado=$((resultado * "$elemento"))
	done
	echo "El resultado es: $resultado"
}

productoria
