#!/bin/bash

inicializar() {
	array=()
}

agregar_elem() {
	if [ $# -ne 1 ]; then
		echo "Error: Tenes que ingresar un elemento para agregar"
		return 1
	else
		array+=("$1")
	fi
}

eliminar_elem() {
	if [ $# -ne 1 ]; then
		echo "Error: Tenes que ingresar una posicion a eliminar"
		return 1
	else
		if [[ "$1" -ge 0 && "$1" -lt "${#array[@]}" ]]; then
			unset array[$1]
			# Reorganizar el array para evitar huecos
			array=("${array[@]}")
		else
			echo "Error: Posicion invalida"
		fi
	fi
}

longitud() {
	echo "${#array[@]}"
}

imprimir() {
	for element in "${array[@]}"; do
		echo "$element"
	done
}

inicializar_Con_Valores() {
	if [ $# -ne 2 ]; then
		echo "Error: Debes ingresar dos parametros (longitud elemento)"
		return 1
	else
		n="$1"
		element="$2"
		inicializar
		for ((i=0; i<"$n"; i++)); do
			array[i]="$element"
		done
	fi
}
