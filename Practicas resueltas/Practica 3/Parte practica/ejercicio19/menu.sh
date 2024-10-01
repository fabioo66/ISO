#!/bin/bash

echo "MENU DE COMANDOS"

op1="0.3. ejercicio3"
op2="12. ejercicio12"
op3="13. ejercicio13"

select opcion in "$op1" "$op2" "$op3" SALIR; do
    case "$opcion" in 
        "$op1")
            /home/fabio/practica-shell-script/ejercicio3/mostrar.sh
            ;;
        "$op2")
            echo "Ingrese un numero"
            read num1
            echo "Ingrese una operacion: '+,-,x,%'"
            read operando
            echo "Ingrese un numero"
            read num2
            /home/fabio/practica-shell-script/ejercicio12/ejercicio12c.sh "$num1" "$operando" "$num2"
            ;;
        "$op3")
            /home/fabio/practica-shell-script/ejercicio13/ejercicio13a.sh
            ;;
        "SALIR")
            exit 0
            ;;
        *)
            echo "Valor ingresado incorrecto"
            ;;
    esac
done
