# Practica 3 - Teoria

1. ¿Qué es el Shell Scripting? ¿A qué tipos de tareas están orientados los script? ¿Los scripts
deben compilarse? ¿Por qué?
    
    Es el proceso de escribir secuencias de comandos (scripts) para que un **intérprete de comandos** o **shell** en un sistema operativo, como Bash en GNU/Linux, los ejecute de forma automática. Estos scripts consisten en una serie de comandos que se ejecutan en el orden en que están escritos, lo que permite automatizar tareas repetitivas o complejas en el sistema. Esta orientado a las siguientes tareas:
    
    - Automatizacion de tareas del sistema
    - Administracion del sistema
    - Procesamiento de archivos
    - Control de flujo
    - Integracion de programas
    
    Los scripts de Shell no necesitan ser compilados. Esto se debe a que son **interpretados** por el shell, lo que significa que el intérprete lee el script línea por línea y lo ejecuta directamente.
    

1. Investigar la funcionalidad de los comandos echo y read.
(a) ¿Como se indican los comentarios dentro de un script?
(b) ¿Cómo se declaran y se hace referencia a variables dentro de un script?
    
    echo → Imprimir texto
    
    ```bash
    echo "Hola mundo"
    ```
    
    read → Leer una linea desde entrada estandar en la variable var 
    
    ```bash
    read var
    ```
    
    1. Los comentarios dentro de un script se indican de la siguiente forma
        
        ```bash
        # HOLA ESTE ES UN COMENTARIO
        echo "Esto no es un comentario"
        ```
        
    2. Declaracion de una variable 
        
        ```bash
        nombre="PEPE" 
        ```
        
        Referenciacion de una variable
        
        ```bash
        echo "Hola, $nombre"
        ```
        

1. Crear dentro del directorio personal del usuario logueado un directorio llamado practicashell-script y dentro de él un archivo llamado [mostrar.sh](http://mostrar.sh/) cuyo contenido sea el siguiente:
    
    ```bash
    #!/bin/bash
    # Comentarios acerca de lo que hace el script
    # Siempre comento mis scripts, si no hoy lo hago
    # y mañana ya no me acuerdo de lo que quise hacer
    echo "Introduzca su nombre y apellido:"
    read nombre apellido
    echo "Fecha y hora actual:"
    date
    echo "Su apellido y nombre es:
    echo "$apellido $nombre"
    echo "Su usuario es: `whoami`"
    echo "Su directorio actual es:"
    ```
    
    (a) Asignar al archivo creado los permisos necesarios de manera que pueda ejecutarlo
    (b) Ejecutar el archivo creado de la siguiente manera: ./mostrar
    (c) ¿Qué resultado visualiza?
    (d) Las backquotes (`) entre el comando whoami ilustran el uso de la sustitución de comandos. ¿Qué significa esto?
    (e) Realizar modificaciones al script anteriormente creado de manera de poder mostrar
    distintos resultados (cuál es su directorio personal, el contenido de un directorio en
    particular, el espacio libre en disco, etc.). Pida que se introduzcan por teclado (entrada
    estándar) otros datos.
    
    1. chmod 777 mostrar.sh
    2. …
    3. :
        
        ```bash
        Introduzca su nombre y apellido:
        Fabio Torrejon
        Fecha y hora actual:
        Mon Sep 11 12:34:56 UTC 2024
        Su apellido y nombre es:
        Torrejon Fabio
        Su usuario es: fabio
        Su directorio actual es:
        ```
        
    4. Las comillas invertidas o backquotes (```) se utilizan para la **sustitución de comandos**, es decir, permiten ejecutar un comando dentro de una cadena y utilizar su resultado en el script.
    5. Script modificado:
        
        ```bash
        #!/bin/bash
        # Comentarios acerca de lo que hace el script
        # Siempre comento mis scripts, si no hoy lo hago
        # y mañana ya no me acuerdo de lo que quise hacer
        echo "Introduzca su nombre y apellido:"
        read nombre apellido
        echo "Fecha y hora actual:"
        date
        echo "Su apellido y nombre es:"
        echo "$apellido $nombre"
        echo "Su usuario es: `whoami`"
        # Lo agrego porque esta incompleto
        echo "Su directorio actual es: `pwd`"
        
        # Nuevas funcionalidades
        echo "Su directorio personal es: $HOME"
        
        echo "Introduzca un directorio para ver su contenido"
        read directorio
        
        if [ -d "$directorio" ] 
        then 
        	echo "El contenido del directorio es:"
        	ls "$directorio"
        else
        	echo "El directorio no existe"
        fi
        	
        echo "El espacio libre en disco es:"
        df -h
        ```
        
    
2. Parametrización: ¿Cómo se acceden a los parámetros enviados al script al momento de su
invocación? ¿Qué información contienen las variables $#, $*, $? Y $HOME dentro de un
script?
    
    Cuando se ejecuta un script Bash, los parámetros que se pasan se acceden utilizando las siguientes variables:
    
    - **$1, $2, $3,...**: Representan los argumentos posicionales que se pasan al script. `$1` es el primer argumento, `$2` es el segundo, y así sucesivamente.
    
    ```bash
    #!/bin/bash
    echo "El primer parámetro es: $1"
    echo "El segundo parámetro es: $2"
    ```
    
    Las variables:
    
    - $# → contiene la cantidad de argumentos recibidos.
    - $* → contiene la lista de todos los argumentos.
    - $? → contiene en todo momento el valor de retorno del  ultimo comando ejecutado
    - $HOME → contiene la **ruta al directorio home** del usuario que está ejecutando el script.

1. ¿Cual es la funcionalidad de comando exit? ¿Qué valores recibe como parámetro y cual es su significado?
    - La funcion principal de exit es causar la terminacion de un script.
    - Puede devolver cualquier valor entre 0 y 255
        - El valor 0 indica que el script se ejecuto de forma exitosa
        - Un valor distinto indica un codigo de error
        - Se puede consultar el exit status imprimiendo la variable $?

1. El comando **expr** permite la evaluación de expresiones. Su sintaxis es: **expr arg1 op arg2**, donde **arg1** y **arg2** representan argumentos y **op** la operación de la expresión. Investigar que tipo de operaciones se pueden utilizar.
    
    Operaciones aritmeticas:
    
    ```bash
    expr 5 + 3   # Resultado: 8
    expr 5 - 3   # Resultado: 2
    expr 5 \* 3  # Resultado: 15
    expr 10 / 2  # Resultado: 5
    expr 10 % 3  # Resultado: 1
    ```
    
    Operaciones logicas:
    
    ```bash
    expr 5 = 5   # Resultado: 1 (verdadero)
    expr 5 != 3  # Resultado: 1 (verdadero)
    expr 5 \> 3  # Resultado: 1 (verdadero)
    expr 5 \>= 3  # Resultado: 1 (verdadero)
    expr 3 \< 5  # Resultado: 1 (verdadero)
    expr 3 \<= 5  # Resultado: 1 (verdadero)
    ```
    
    Operaciones de manipulacion de cadenas
    
    ```bash
    expr "Hola" : '.*' " Mundo"  # Resultado: "Hola Mundo"
    expr length "cadena"   # Resultado: 6
    expr substr "cadena" 2 4   # Resultado: "aden"
    expr "cadena" : "cad"   # Resultado: 3 (cantidad de caracteres coincidentes)
    ```
    
    Operadores booleanos
    
    ```bash
    # AND
    expr arg1 \&\& arg2
    
    # OR
     expr arg1 || arg2
    ```
    

1. El comando “test expresión” permite evaluar expresiones y generar un valor de retorno,
true o false. Este comando puede ser reemplazado por el uso de corchetes de la siguiente manera [ expresión ]. Investigar que tipo de expresiones pueden ser usadas con el comando
test. Tenga en cuenta operaciones para: evaluación de archivos, evaluación de cadenas de
caracteres y evaluaciones numéricas
    
    Evaluacion de archivos:
    
    - -e archivo: Verifica si el archivo existe
    - -f archivo: Verifica si es un archivo regular (no directorio, enlace, etc)
    - -d archivo: Verifica si es un directorio
    - -r archivo Verifica si el archivo es legible
    - -w archivo: Verifica si el archivo es escribible
    - -x archivo: Verifica si el archivo es ejecutable
    - -s archivo: Verifica si el archivo tiene un tamaño mayor a 0 bytes
    - -L archivo: Verifica si el archivo es un enlace simbolico
    - Ejemplo:
        
        ```bash
        test -e /ruta/del/archivo && echo "El archivo existe"
        [ -e /ruta/del/archivo ] && echo "El archivo existe"
        ```
        
    
    Evaluacion de cadenas de caracteres:
    
    - -z cadena: Verifica si la cadena esta vacia
    - -n cadena: Verifica si la cadena no esta vacia
    - cadena1 = cadena2: Verifica si las cadenas son iguales
    - cadena1 != cadena2: Verifica si las cadenas son diferentes
    - Ejemplo:
        
        ```bash
        test -z "$cadena" && echo "La cadena está vacía"
        [ -z "$cadena" ] && echo "La cadena está vacía"
        ```
        
    
    Evaluacones numericas
    
    - n1 -eq n2: Verifica si los números son iguales.
    - n1 -ne n2: Verifica si los números no son iguales.
    - n1 -lt n2: Verifica si `n1` es menor que `n2`.
    - n1 -le n2: Verifica si `n1` es menor o igual que `n2`.
    - n1 -gt n2: Verifica si `n1` es mayor que `n2`.
    - n1 -ge n2: Verifica si `n1` es mayor o igual que `n2`.

1. Estructuras de control. Investigue la sintaxis de las siguientes estructuras de control incluidas en shell scripting:
    - if
    - case
    - while
    - for
    - select
    
    ```bash
    # IF
    
    if [ condition ]
    then
    	block
    fi
    
    # CASE
    
    case $variable in
    	"valor 1")
    		block
    	;;
    	"valor 2")
    		block
    	;;
    	*)
    		block
    	;;
    esac
    
    # WHILE
    
    while [ condition ] #Mientras se cumpla la condici´on
    do
    	block
    done
    
    # FOR
    
    for ((i=0; i < 10; i++))
    do
    	block
    done
    
    # FOREACH
    
    for i in value1 value2 value3 valueN;
    do
    	block
    done
    
    # SELECT
    
    select variable in lista_de_opciones
    do
    	block
    done
    
    ```
    

1. ¿Qué acciones realizan las sentencias break y continue dentro de un bucle? ¿Qué parámetros reciben?
    - break [n] corta la ejecucion de n niveles de loops.
    - continue [n] salta a la siguiente iteracion del enesimo loop que contiene esta instruccion.

1. ¿Qué tipo de variables existen? ¿Es shell script fuertemente tipado? ¿Se pueden definir
arreglos? ¿Cómo?
    
    Existen dos tipos de variables: Strings y arreglos.
    
    En bash, **no se declara el tipo de las variables**; una variable puede almacenar cualquier tipo de dato sin especificar si es un número, texto o cualquier otro tipo. Por lo tanto no es fuertemente tipado.
    
    Si, se pueden definir arreglos:
    
    ```bash
    arreglo_a=() # Se crea vacio
    arreglo_b=(1 2 3 5 8 13 21) # Inicializado
    ```
    
2. ¿Pueden definirse funciones dentro de un script? ¿Cómo? ¿Cómo se maneja el pasaje de
parámetros de una función a la otra?
    
    Si, se pueden definir funciones dentro de un script de la siguiente manera:
    
    ```bash
    function nombre { block }
    nombre() { block }
    ```
    
    Ejemplo de pasaje de parametros entre funciones:
    
    ```bash
    #!/bin/bash
    
    # Función que realiza una operación aritmética
    sumar() {
        resultado=$(( $1 + $2 ))
        echo $resultado
    }
    
    # Función que llama a la función "sumar"
    procesar_suma() {
        num1=$1
        num2=$2
        suma=$(sumar $num1 $num2)
        echo "La suma de $num1 y $num2 es: $suma"
    }
    
    # Llamada a la función "procesar_suma" con dos parámetros
    procesar_suma 5 10
    ```