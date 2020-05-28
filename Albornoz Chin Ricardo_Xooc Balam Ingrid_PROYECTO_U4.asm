;Carrera:   Ing. En Sistemas Computacionales
;Grado:     6
;Grupo:     "A"
;Materia:   Lenguaje y Aut�matas
;Profesor:  Lic. Jos� Leonel Pech May
;Integrantes:    
;           Albornoz Chin Ricardo Ismael (17070007)
;           Xooc Balam Ingrid Lisset     (17070047)
;           
;Fecha:     1/Junio/2020  
;Descripci�n del programa:
;          Realiza un programa que permita ejemplificar la generaci�n de c�digo objeto a trav�s de c�digo ensamblador o simil.
;          1.	Suma de dos n�meros.
;          2.	Resta de dos n�meros.  
;          3.	Divisi�n de dos n�meros.
;          4.	Multiplicaci�n de dos n�meros.  

 
.model small     ;Se define el modelo de tipo small
.stack 100       ;Se determina el tama�o de la pila, en este caso es de 100
.data            ;En este apartado se declaran todas las variables que se utilizar�n en el programa.
    
    Opcion1       db 10,13, '   1. Suma de dos n�meros $'            ;Esta variable es una de las opciones del submen�.
    Opcion2       db 10,13, '   2. Resta de dos n�meros $'           ;Esta variable es una de las opciones del men�.
    Opcion3       db 10,13, '   3. Multiplicaci�n de dos n�meros $'  ;Esta variable es una de las opciones del submen�.
    Opcion4       db 10,13, '   4. Divisi�n de dos n�meros $'        ;Esta variable es una de las opciones del submen�.
    Opcion5       db 10,13, '   5. Salir $'                          ;Esta variable es una de las opciones del submen�.
    dividendo     db 10,13, 'Ingresa el dividendo: $'                ;Varaiable que almacena el dividendo que ingresa el usuario.
    divisor       db 10,13, 'Ingresa el divisor: $'                  ;Varaiable que almacena el divisor que ingresa el usuario.
    residuo       db 10,13, 'El Residuo es: $'                       ;Varaiable que imprime el residuo de la divisi�n que se realiza.
    Resultado     db 10,13, 'El resultado es: $'                     ;Variable que se utiliza para identificar el resultado de la operaci�n.
    primerMsg     db 10,13, 'Ingresa la opci�n:  $'                  ;La variable primerMsg se muestra para ingresar la opci�n que se desee.
    Numero        db 10,13, 'Ingresa un n�mero: $'                     ;Mensaje que se muestra para ingresar un n�mero
    nlinea        db 10,13, ' $'                                     ;Sirve para hacer un salto de l�nea. 
    resii         db 0     ;La variable resii almacena el residuo de la divisi�n. 
    resul         db 0     ;La variable resul almacena el resultado de la operaci�n que se realiza.
    num1Uni       db 0     ;La variable num1Uni almacena las unidades del primer n�mero que se ingresa, para realizar la multiplicaci�n.
    num1Dec       db 0     ;La variable num1Dec almacena las decenas del primer n�mero que se ingresa, para realizar la multiplicaci�n.
    num2Uni       db 0     ;La variable num2Uni almacena las unidades del segundo n�mero que se ingresa, para realizar la multiplicaci�n.
    num2Dec       db 0     ;La variable num2Dec almacena las decenas del segundo n�mero que se ingresa, para realizar la multiplicaci�n.
    numero1       db 0     ;La variable numero1 almacena el primer n�mero para realiza las operaciones.
    numero2       db 0     ;La variable numero2 almacena el segundo n�mero para realiza las operaciones.
    uni           db 0     ;La variable uni almacena el valor de las unidades del resultado de la multiplicaci�n.
    cente         db 0     ;La variable cente almacena el valor de las decenas del resultado de la multiplicaci�n.
    dece          db 0     ;La variable dece almacena el valor de las centenas del resultado de la multiplicaci�n.
    millar        db 0     ;La variable millar almacena el valor del millar del resultado de la multiplicaci�n.
    acarreo1      db 0     ;La variable acarreo1 almacena el valor del acarreo de la multiplicaci�n.
    acarreo2      db 0     ;La variable acarreo2 almacena el valor del acarreo de la multiplicaci�n.     
    negativo db "-$"       ;Sirve para mostrar un signo, este se usa en la resta en el caso de que sea negativo 
    
    
.code ;Comienza la parte del c�digo.
    ; MACROS
    Macro1_OperacionPrincipal MACRO al  ;Macro que recibe el par�metro AL y ayuda a saber que operaci�n se llevar� a cabo.
        cmp al,1          ;Compara el valor de la variable AL con el n�mero 1.
        je Suma           ;Si la variable AL es igual a 1, entonces va a la etiqueta Suma.
        
        cmp al,2          ;Compara el valor de la variable AL con el n�mero 2.
        je Resta          ;Si la variable AL es igual a 2, entonces va a la etiqueta Resta.
           
        cmp al,3          ;Compara el valor de la variable AL con el n�mero 3.
        je Multiplicacion ;Si la variable AL es igual a 3, entonces va a la etiqueta Multiplicacion.
        
        cmp al,4          ;Compara el valor de la variable AL con el n�mero 4.
        je Division       ;Si la variable AL es igual a 4, entonces va a la etiqueta Division.
        
        cmp al,5          ;Compara el valor de la variable AL con el n�mero 5.
        je salir          ;Si la variable AL es igual a 5, entonces va a la etiqueta salir.
    ENDM ;Fin de la macro Macro1_OperacionPrincipal
    
    
    Macro3_Suma MACRO numero1,numero2   ;Macro que realiza una suma de dos d�gitos
         mov al, numero1                ;Se mueve a AL lo que se almacena en numero1.
         add al, numero2                ;Se le suma a AL el valor de la variable numero2.
         mov resul,al                   ;Se mueve el resultado de la suma a la variable resul.
         Macro5_Resultado resul         ;Se llama a la macro Macro5_Resultado, enviandole la variable resul.
    ENDM                                ;Fin macro
    
    Macro4_Resta MACRO numero1,numero2  ;Macro que realiza una resta de dos d�gitos
         mov SI, 0                      ;Limpia el segmento de datos, esto pasandole el cero al registro si              
         mov al, numero1                ;Movemos el valor que ingres� el usuario en numero1 al registro AL    
         cmp al, numero2                ;Movemos el valor que ingres� el usuario en numero2 al registro AL
         jnle CONTINUA                  ;Salta al bloque continua
         mov ah, numero2                ;Mueve el valor que tiene almacenado el numero2 al registro ah
         mov numero1, ah                ;Movemos el valor que tiene ah en la variable numero1
         mov numero2, al                ;Movemos el valor que tiene al en la variable numero2
         mov SI,1                       ;Guarda el valor en el registro de semento de datos
        
        CONTINUA:              
                       
            mov al, numero1             ;mueve el valor que tiene almacenada la variable al en el registro al 
            sub al, numero2             ;sub resta el valor del numero2 al registro al que es donde se guardo el numero1       
                      
            CALL ResultadoResta           
                       
         ;Macro5_Resultado resul        ;Se llama a la macro Macro5_Resultado, enviandole la variable resul.
    ENDM                                ;Fin macro
    
    
    Macro5_Multiplicacion MACRO num1Dec,num1Uni,num2Dec,num2Uni  ;Macro que realiza una multiplicaci�n de dos d�gitos
    
        ;Primera multiplicacion uni = num2Uni*num1Uni, acarreo1=ah
        mov al,num2Uni    ;Se mueve en AL, el valor de la unidad del segundo n�mero 
        mov bl,num1Uni    ;Se mueve en BL, el valor de la unidad del primer n�mero
        mul bl            ;Se realiza la multiplicaci�n de AL * BL y el resultado se guarda en AL 
        mov ah,00h        ;Se limpia AH, para separar al en Unidades y Decenas
        AAM               ;Se descompone el n�mero y se guarda en AX
        mov uni,al        ;Se asigna a la variable uni,el valor que est� en AL
        mov acarreo1,ah   ;Se asigna a la variable acarreo1,el valor que est� en AH
        
        
        ;Segunda multiplicacion dece = num2Uni*num2Dec+acarreo1, acarreo1=ah  
        mov al,num2Uni    ;Se mueve en AL, el valor de la unidad del segundo n�mero 
        mov bl,num1Dec    ;Se mueve en BL, el valor de la decena del primer n�mero
        mul bl            ;Se realiza la multiplicaci�n de AL * BL y el resultado se guarda en AL 
        add al,acarreo1   ;Se le suma a AL,el valor de la variable acarreo1
        mov ah,00h        ;Se limpia AH, para separar lo que hay en AL en Unidades y Decenas
        AAM               ;Se descompone el n�mero y se guarda en AX
        mov dece,al       ;Se asigna a la variable dece,el valor que est� en AL
        mov acarreo1,ah   ;Se asigna a la variable acarreo1,el valor que est� en AH
        mov cente,ah      ;Se agrega a cente, el valor de acarreo2
        
        ;Tercera multiplicacion cente = num2Dec*num1Uni+, acarreo=ah  
        mov al,num2Dec    ;Se mueve en AL, el valor de la unidad del segundo n�mero 
        mov bl,num1Uni    ;Se mueve en BL, el valor de la decena del primer n�mero
        mul bl            ;Se realiza la multiplicaci�n de AL * BL y el resultado se guarda en AL 
        mov ah,00h        ;Se limpia AH, para separar lo que hay en AL en Unidades y Decenas
        AAM               ;Se descompone el n�mero y se guarda en AX
        add dece,al       ;Se asigna a la variable dece,el valor que est� en AL
        add acarreo2,ah   ;Se asigna a la variable acarreo2, el valor de AH
        mov al,dece       ;Se mueve a AL, el valor de la variable dece
        mov ah,00h        ;Se limpia AH, para separar lo que hay en AL en Unidades y Decenas
        AAM               ;Se descompone el n�mero y se guarda en AX
        mov dece,al
        add cente,ah      ;Se le suma a cente, el valor de AH
        
        ;Cuarta multiplicacion millar = num2Dec*num1Dec, acarreo=ah
        mov al,num2Dec    ;Se mueve en AL, el valor de la decena del segundo n�mero 
        mov bl,num1Dec    ;Se mueve en BL, el valor de la decena del segundo n�mero
        mul bl            ;Se realiza la multiplicaci�n de AL * BL y el resultado se guarda en AL 
        add al,acarreo2   ;Se le suma a AL, el valor de la variable acarreo2 
        mov ah,00h        ;Se limpia AH, para separar lo que hay en AL en Unidades y Decenas
        
        AAM               ;Se descompone el n�mero y se guarda en AX
        add cente,al      ;Se suma a cente, el valor de AL
        mov millar,ah     ;Se mueve a la variable millar el valor de AH
        mov al,cente      ;Se mueve a AL, el valor de la variable cente
        mov ah, 00h       ;Se limpia AH, para separar lo que hay en AL en Unidades y Decenas
        AAM               ;Se descompone el n�mero y se guarda en AX
        mov cente,al      ;Se mueve a cente el valor de AL
        add millar,ah     ;Se mueve a millar el valor de AH
        mov acarreo1,0h   ;Se limpia acarreo1
        mov acarreo2,0h   ;Se limpia acarreo2
        
        ;Imprimir el resultado  
        mov ah, 09h        ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx,Resultado   ;Lea carga el mensaje de la variable Resultado en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        ;Imprimir el millar
        mov ah,02h         ;02h indica la operacion que coloca al cursor
        mov dl,millar      ;Se mueve en dl lo que est� guardado en millar y
        add dl,30h         ;se le suma 30h para tener el n�mero.
        int 21h            ;Por �ltimo se realiza la interrupci�n 21h, encargado de mostrar el resultado en la pantalla.
        ;Imprimir la centena
        mov ah,02H         ;02h indica la operacion que coloca al cursor
        mov dl,cente       ;Se mueve en dl lo que est� guardado en cente y
        add dl,30h         ;se le suma 30h para tener el n�mero.
        int 21h            ;Por �ltimo se realiza la interrupci�n 21h, encargado de mostrar el resultado en la pantalla.
        ;Imprimir la decena
        mov ah,02H         ;02h indica la operacion que coloca al cursor
        mov dl,dece        ;Se mueve en dl lo que est� guardado en dece y
        add dl,30h         ;se le suma 30h para tener el n�mero.
        int 21h            ;Por �ltimo se realiza la interrupci�n 21h, encargado de mostrar el resultado en la pantalla.
        ;Imprimir la unidad
        mov ah,02H         ;02h indica la operacion que coloca al cursor
        mov dl,uni         ;Se mueve en dl lo que est� guardado en uni y
        add dl,30h         ;se le suma 30h para tener el n�mero.
        int 21h            ;Por �ltimo se realiza la interrupci�n 21h, encargado de mostrar el resultado en la pantalla.
        jmp Main ;Salta a la etiqueta MAIN.     
    
    ENDM  ;Fin de la macro Macro5_Multiplicacion
    
    Macro6_Division MACRO numero1,numero2  ;Macro que realiza una divisi�n de dos d�gitos
        xor ax,ax                      ;Se limpia el registro ax.
        mov bl, numero1                ;Se mueve a BL lo que se almacena en numero1.
        mov al, numero2                ;Se mueve a AL lo que se almacena en numero2.
        div bl                         ;Se realiza la divisi�n y el resultado se guarda en AL.
        mov resul,al                   ;Se mueve el resultado de la divisi�n a la variable resul.
        mov resii, ah                  ;Se mueve el residuo de la divisi�n a la variable resii.
        mov ah, 09h                    ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx,residuo                 ;Lea carga el mensaje de la variable residuo en el segmento de datos y
        int 21h                        ;la interrupci�n 21h muestra el mensaje.
        mov al,resii                   ;Se mueve a AL,el valor de la variable resii
        aam                            ;Propiedad que ayuda a descomponer un n�mero de varios digitos.
        mov bx,ax                      ;Se mueve a BX lo que tiene AX
        ;para imprimir el valor de la decena     
        mov ah,02h                     ;02h indica la operacion que coloca al cursor
        mov dl,bh                      ;Se mueve en dl lo que est� guardado en bh y
        add dl,30h                     ;se le suma 30h para tener el n�mero.
        int 21h                        ;Por �ltimo se realiza la interrupci�n 21h, encargado de mostrar el resultado en la pantalla
        ;para imprimir el valor de la unidad
        mov ah,02h                     ;02h indica la operacion que coloca al cursor
        mov dl,bl                      ;Se mueve en dl lo que est� guardado en bl y
        add dl,30h                     ;se le suma 30h para tener el digito.
        int 21h                        ;la interrupci�n 21h muestra el mensaje.
        Macro5_Resultado resul         ;Se llama a la macro Macro5_Resultado, enviandole la variable resul.
    ENDM  ;Fin de la macro Macro6_Division 
    
    
    Macro5_Resultado MACRO resul        ;Macro que se encarga de imprimir el resultado de la operaci�n hecha anteriormente.
        mov ah, 09h                     ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx,Resultado                ;Lea carga el mensaje de la variable Resultado en el segmento de datos y
        int 21h                         ;la interrupci�n 21h muestra el mensaje.
        mov ah,0                        ;Se inicia con el valor 0 al registro AH
        mov al,resul                    ;Se mueve lo que tiene la variable resul al registro AL.
        AAM                             ;Propiedad que ayuda a descomponer un n�mero de varios digitos.
        mov uni, al                     ;Se asigna a la variable uni lo que tiene AL.
        mov al, ah                      ;se mueve a Al lo que tiene Ah.
        AAM                             ;Se descompone el n�mero y se guarda 
        mov dece,al                     ;en la variable dece lo que tiene actualmente AL y
        mov cente, ah                   ;en la variable cente se guarda lo que tiene Ah.
        
        ;para imprimir el valor de la centena     
        mov ah,02h                      ;02h indica la operacion que coloca al cursor
        mov dl,cente                    ;Se mueve en dl lo que est� guardado en cente y
        add dl,30h                      ;se le suma 30h para tener el n�mero.
        int 21h                         ;Por �ltimo se realiza la interrupci�n 21h, encargado de mostrar el resultado en la pantalla.
        ;para imprimir el valor de la decena     
        mov ah,02h                      ;02h indica la operacion que coloca al cursor
        mov dl,dece                     ;Se mueve en dl lo que est� guardado en dece y
        add dl,30h                      ;se le suma 30h para tener el n�mero.
        int 21h                         ;Por �ltimo se realiza la interrupci�n 21h, encargado de mostrar el resultado en la pantalla.
        ;para imprimir el valor de la unidad
        mov ah,02h                      ;02h indica la operacion que coloca al cursor
        mov dl,uni                      ;Se mueve en dl lo que est� guardado en uni y
        add dl,30h                      ;se le suma 30h para tener el digito.
        int 21h                         ;la interrupci�n 21h muestra el mensaje.
        jmp Main ;se llama a la etiqueta Main
    ENDM ;Fin de la macro Macro5_Resultado 
                                                                       
    mov ax,@data                     ;Para poder utilizar las variables que se han declarado, se le asignan al registro ax
    mov ds, ax                       ;Se le asigna al segmento de datos (ds) todo lo que se cargo anteriormente en ax.
    
    Main:                            ;Etiqueta Main
        call Procedimiento1_Menu     ;Llama al procedimiento Procedimiento1_Menu, para mostrar el men� principal.
        call ObtenerOpcion           ;Llama al procedimiento ObtenerOpcion para tener la opci�n que se seleccion�.
        Macro1_OperacionPrincipal al ;Se llama a la macro Macro1_OperacionPrincipal y se le manda la variable AL, que es el que almacena la opci�n que se seleccion�.     
    loop Main ;Se repite el bucle loop y va a la etiqueta Main.    
    
    ;PROCEDIMIENTOS 
    
    Procedimiento1_Menu PROC NEAR  ;Procedimiento encargado de imprimir el men� principal.
        mov ah, 09h        ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx,nlinea      ;Lea carga el mensaje de la variable nlinea en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        lea dx,nlinea      ;Lea carga el mensaje de la variable nlinea en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.                                                                                         
        lea dx,Opcion1     ;Lea carga el mensaje de la variable Opcion1 en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        lea dx,Opcion2     ;Lea carga el mensaje de la variable Opcion2 en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        lea dx,Opcion3     ;Lea carga el mensaje de la variable Opcion3 en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.        
        lea dx,Opcion4     ;Lea carga el mensaje de la variable Opcion4 en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        lea dx,Opcion5     ;Lea carga el mensaje de la variable Opcion5 en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
                
        RET ;Retorno del programa.
    Procedimiento1_Menu ENDP ;Fin de procedimiento Procedimiento1_Menu   
    
    
    ObtenerOpcion PROC NEAR ;Procedimiento encargado de obtener la opci�n de la tarea que el usuario desea desarrollar.
        lea dx,primerMsg   ;Lea carga el mensaje de la variable primerMsg en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        mov ah,01h         ;01h se encarga de realizar una petici�n junto con la
        int 21h            ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.
        sub al,30h         ;Se le resta 30h al registro AL para tener el dato en decimal            
        RET                ;Retorno del programa.
    ObtenerOpcion ENDP     ;Fin de procedimiento ObtenerOpcion.
    
    DatoDecimal PROC NEAR
        mov ah, 09h        ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx, Numero     ;Lea carga el mensaje de la variable Numero en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
              
        mov ah,01h         ;01h se encarga de realizar una petici�n junto con la
        int 21h            ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.  
        sub al,30h         ;Como el caracter se guarda en al, entonces a al se le resta 30h para conocer en
                           ;el valor de ese dato en el c�digo ascii
        mov dece,al        ;cuando se termina de realizar la resta, se asigna a la variable dece
                           ;que es el encargado de alamacenar las decenas del n�mero con el que se trabajar�.
        
        mov ah, 01h        ;Se realiza de nuevo una petici�n, pero esta vez para obtener las unidades del n�mero
        int 21h            ;se muestra la consola para ingresar el caracter. Este caracter se guarda el al.
        sub al,30h         ;Se le resta 30h a al para conocer cu�l es el n�mero ingresado, posteriormente
        mov uni,al         ;este resultado se le es asignado a la variable uni.
                
        ;Procedimiento para guardar el n�mero ingresado a la variable dato
        ;Como el n�mero ingresado esta separado en decenas y unidades entonces se realiza lo siguiente.
        mov al,dece        ;Se mueve al acumulador al el valor de la variable dece.
        mov bl,10          ;Se asigna el valor de 10 en el registro base, ya que una decena equiva a 10
        mul bl             ;Se multiplica al por bl para tener el resultado. El resultado se guarda en al
        add al,uni         ;Como ya se tiene las decenas ahora solo se le suma las unidades al registro al.
        RET ;RETORNO DEL PROGRAMA
    DatoDecimal ENDP     
    
    Suma:   
        call DatoDecimal   ;Se llama al procedimeinto DatoDecimal, para tener el dato en decimal
        mov numero1,al     ;Se mueve lo que tiene AL a la variable numero1.
        call DatoDecimal   ;Se llama al procedimeinto DatoDecimal, para tener el dato en decimal
        mov numero2,al     ;Se mueve lo que tiene AL a la variable numero2.
        Macro3_Suma numero1,numero2  ;Se llama a la macro Macro3_Suma y se le env�a dos par�metros.
        
    Resta:   
        call DatoDecimal   ;Se llama al procedimeinto DatoDecimal, para tener el dato en decimal
        mov numero1,al     ;Se mueve lo que tiene AL a la variable numero1.
        call DatoDecimal   ;Se llama al procedimeinto DatoDecimal, para tener el dato en decimal
        mov numero2,al     ;Se mueve lo que tiene AL a la variable numero2.
        Macro4_Resta numero1,numero2  ;Se llama a la macro Macro4_Resta y se le env�a dos par�metros.
        
    Multiplicacion: 
        mov ah, 09h        ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx, Numero     ;Lea carga el mensaje de la variable Numero en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        mov ah,01h         ;01h se encarga de realizar una petici�n junto con la
        int 21h            ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.  
        sub al,30h         ;Como el caracter se guarda en al, entonces a al se le resta 30h para conocer en
                           ;el valor de ese dato en el c�digo ascii
        mov num1Dec,al     ;cuando se termina de realizar la resta, se asigna a la variable num1Dec
                           ;que es el encargado de alamacenar las decenas del n�mero con el que se trabajar�.
        mov ah, 01h        ;Se realiza de nuevo una petici�n, pero esta vez para obtener las unidades del n�mero
        int 21h            ;se muestra la consola para ingresar el caracter. Este caracter se guarda el al.
        sub al,30h         ;Se le resta 30h a al para conocer cu�l es el n�mero ingresado, posteriormente
        mov num1Uni,al     ;este resultado se le es asignado a la variable num1Uni.
        
        mov ah, 09h        ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx, Numero     ;Lea carga el mensaje de la variable Numero en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        mov ah,01h         ;01h se encarga de realizar una petici�n junto con la
        int 21h            ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.  
        sub al,30h         ;Como el caracter se guarda en al, entonces a al se le resta 30h para conocer en
                           ;el valor de ese dato en el c�digo ascii
        mov num2Dec,al     ;cuando se termina de realizar la resta, se asigna a la variable num2Dec
                           ;que es el encargado de alamacenar las decenas del n�mero con el que se trabajar�.
        mov ah, 01h        ;Se realiza de nuevo una petici�n, pero esta vez para obtener las unidades del n�mero
        int 21h            ;se muestra la consola para ingresar el caracter. Este caracter se guarda el al.
        sub al,30h         ;Se le resta 30h a al para conocer cu�l es el n�mero ingresado, posteriormente
        mov num2Uni,al     ;este resultado se le es asignado a la variable num2Uni.
        Macro5_Multiplicacion num1Dec,num1Uni,num2Dec,num2Uni  ;Se llama a la macro Macro5_Multiplicacion y se le env�a los par�metros num1Dec,num1Uni,num2Dec,num2Un.
        
    Division: 
        aam                ;Separa lo qe hay en AL por: AH=2 Y AL=3
        mov cente,ah       ;Respaldo las centenas en cen en este caso 2
        
        mov dece,al        ;Respaldo las decenas en dec, en este caso 3
                                                                 
          
        mov ah, 09h        ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx,Resultado   ;Lea carga el mensaje de la variable Resultado en el segmento de datos y
        int 21h 
                                                  
        mov ah, 09h        ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx, dividendo  ;Lea carga el mensaje de la variable dividendo en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        mov ah,01h         ;01h se encarga de realizar una petici�n junto con la
        int 21h            ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.  
        sub al,30h         ;Como el caracter se guarda en al, entonces a al se le resta 30h para conocer en
                           ;el valor de ese dato en el c�digo ascii
        mov dece,al        ;cuando se termina de realizar la resta, se asigna a la variable dece
                           ;que es el encargado de alamacenar las decenas del n�mero con el que se trabajar�.
        mov ah, 01h        ;Se realiza de nuevo una petici�n, pero esta vez para obtener las unidades del n�mero
        int 21h            ;se muestra la consola para ingresar el caracter. Este caracter se guarda el al.
        sub al,30h         ;Se le resta 30h a al para conocer cu�l es el n�mero ingresado, posteriormente
        mov uni,al         ;este resultado se le es asignado a la variable uni.
        
        ;Procedimiento para guardar el n�mero ingresado a la variable dato
        ;Como el n�mero ingresado esta separado en decenas y unidades entonces se realiza lo siguiente.
        mov al,dece        ;Se mueve al acumulador al el valor de la variable dece.
        mov bl,10          ;Se asigna el valor de 10 en el registro base, ya que una decena equiva a 10
        mul bl             ;Se multiplica al por bl para tener el resultado. El resultado se guarda en al
        add al,uni         ;Como ya se tiene las decenas ahora solo se le suma las unidades al registro al.
        mov numero2,al     ;Se mueve lo que tiene AL a la variable numero2.
        mov ah, 09h        ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx, divisor    ;Lea carga el mensaje de la variable divisor en el segmento de datos y
        int 21h            ;la interrupci�n 21h muestra el mensaje.
        mov ah,01h         ;01h se encarga de realizar una petici�n junto con la
        int 21h            ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.  
        sub al,30h         ;Como el caracter se guarda en al, entonces a al se le resta 30h para conocer en
                           ;el valor de ese dato en el c�digo ascii
        mov dece,al        ;cuando se termina de realizar la resta, se asigna a la variable dece
                           ;que es el encargado de alamacenar las decenas del n�mero con el que se trabajar�.
        mov ah, 01h        ;Se realiza de nuevo una petici�n, pero esta vez para obtener las unidades del n�mero
        int 21h            ;se muestra la consola para ingresar el caracter. Este caracter se guarda el al.
        sub al,30h         ;Se le resta 30h a al para conocer cu�l es el n�mero ingresado, posteriormente
        mov uni,al         ;este resultado se le es asignado a la variable uni.
        
        ;Procedimiento para guardar el n�mero ingresado a la variable dato
        ;Como el n�mero ingresado esta separado en decenas y unidades entonces se realiza lo siguiente.
        mov al,dece        ;Se mueve al acumulador al el valor de la variable dece.
        mov bl,10          ;Se asigna el valor de 10 en el registro base, ya que una decena equiva a 10
        mul bl             ;Se multiplica al por bl para tener el resultado. El resultado se guarda en al
        add al,uni         ;Como ya se tiene las decenas ahora solo se le suma las unidades al registro al.
        mov numero1,al     ;Se mueve lo que tiene AL a la variable numero1.
        Macro6_Division numero1,numero2  ;Se llama a la macro Macro6_Division y se le env�a dos par�metros.
    
   
    ResultadoResta PROC NEAR  
      
        aam              ;Sirve para separar lo que se tiene en AH, para que se divida en centenas, decenas y unidades
        mov uni,al       ;Se mueve lo que tiene el registro AL a la variable de unidades
        mov al,ah        ;Se mueve el valor de ah al registro al para volver a obtenr los numeros
        
        
        aam              ;Sirve para separar lo que se tiene en AH, para que se divida en centenas, decenas y unidades
        mov cente,ah     ;respaldo las centenas en cen en este caso 2
        mov dece,al      ;Se mueve el valor que tenemos en al a la variabel de las decenas
        
        mov ah,09h       ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx,Resultado ;Lea carga el mensaje de la variable Resultado en el segmento de datos y
        int 21h          ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.
        
        
        CMP SI, 0        ;compara si el registro de segmento de datos, esto se hace hasta que el valor sea igual a cero 
        JE  imprimir     ;salta al bloque de imprimir si se cumple la comparacion anterior
        mov ah, 09h      ;Se mueve la interrupci�n 09h a ah, para que se realice una petici�n para mostrar el mensaje
        lea dx,negativo  ;Lea carga el mensaje de la variable Resultado en el segmento de datos y
        int 21h          ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.
        
        imprimir:        ;Bloque para hacer el ajuste de la resta en caso de ser negartivo.
        mov ah,02h       ;02h indica la operacion que coloca al cursor
        
        mov dl,cente     ;Mueve las decenas al registro de datos dl
        add dl,30h       ;Le agrega 30h al registro dl, esto sirve para hacer el ajuste de carga para imprimir el numero real.
        int 21h          ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.
        
        mov dl,dece      ;Mueve las decenas al registro de datos dl
        add dl,30h       ;Le agrega 30h al registro dl, esto sirve para hacer el ajuste de carga para imprimir el numero real.
        int 21h          ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.
        
        mov dl,uni       ;Mueve las unidades al registro de datos dl 
        add dl,30h       ;Le agrega 30h al registro dl, esto sirve para hacer el ajuste de carga para imprimir el numero real.
        int 21h          ;interrupci�n 21h.Cuando se ingresa el caracter autom�ticamente se guarda en al.
            
        jmp Main         ;Salta al men� principal
    ResultadoResta ENDP  ;Finaliza el procedimiento ResultadoResta
    
      
    salir:    ;Etiqueta salir 
        .exit ;Sirve para terminar las instrucciones
    
ret   ;Retorno del programa
end   ;Fin del archivo fuente.