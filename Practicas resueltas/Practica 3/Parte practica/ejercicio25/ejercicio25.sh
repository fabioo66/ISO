#!/bin/bash

array=()

if [[ $# -ne 1 && $# -ne 2 ]]; then
 	echo "Error: Tenes que pasar 1 o 2 parametros"
	echo "Uso: $0 <parametro> <posicionArreglo> ; $0 <parametro>"
	exit 1
fi

for user in $(cat /etc/group | grep users | cut -d: -f4); do
	array+=("$user")
done

if [ $# -eq 2 ]; then
	op="$1"
	pos="$2"

	if [[ "$op" == "-b" && "$pos" -ge 0 && "$pos" -lt ${#array[@]} ]]; then
	      echo ${array[$pos]}	
	else
		echo "Error: operacion o posicion invalidas"
	fi
else
	op="$1"
	case "$op" in 
		"-l")
			echo "${#array[@]}"
			;;
		"-i")
			for element in "${array[@]}"; do
				echo "$element"
			done
			;;
		*)
			echo "Error: operacion invalida"
			;;
	esac
fi
