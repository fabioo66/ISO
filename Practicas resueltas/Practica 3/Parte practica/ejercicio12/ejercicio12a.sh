# !/bin/bash

echo "Ingrese un numero"
read num1
echo "Ingrese un numero"
read num2

echo "La multiplicacion es `expr $num1 \* $num2`"

echo "La suma es `expr $num1 + $num2`"

echo "La resta es `expr $num1 - $num2`"

if [ $num1 -gt $num2 ] 
then
	echo "El mayor es $num1"
else 
	echo "El mayor es $num2"
fi
