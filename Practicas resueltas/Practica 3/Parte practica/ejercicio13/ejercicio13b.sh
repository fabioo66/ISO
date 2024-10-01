# !/bin/bash

select variable in listar dondeEstoy quienEsta salir
do
	case $variable in
		listar)
			ls
			;;
		dondeEstoy)
			pwd
			;;
		quienEsta)
			whoami
			;;
		salir)
			break
			;;
		*)
			echo "Opcion no valida"
			;;
		esac
done
