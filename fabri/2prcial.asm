;Realice un programa que utilizando funciones (si o si deben utilizarse
; funciones externas, y por lo menos una debe utilizar el stack para 
;recibir parámetros)

;Lea una cadena de caracteres de teclado (max 255), la almacene en una 
;variable, 

;Luego la cifre sumando una cantidad leída por teclado entre 0 y 20,

;Una vez cifrado el texto debe visualizarse el mismo sin cifrar y 
;luego el texto cifrado, 

;El programa debe mostrar la cantidad de caracteres
;ingresados en decimal y hexa, y permitir un reset par

.8086
.model small
.stack 100h
.data 

	input db 255 dup(24h)
	numeroAscii db "0", 24h, 24h, 24h
	numero db 0

	mensajeBienvenida db "Hola, ingrese un texto de hasta 255 caracteres para cifrar",0dh,0ah,24h
	mensajeNumeroCifrador db "Ahora, ingrese un numero del 0 al 20 para cifrar su texto",0dh,0ah,24h
	mensajeCifrado db "Su mensaje cifrado es: ",0dh,0ah,24h
	mensajeError db "El numero para cifrar no es correcto.",0dh,0ah,24h

.code

extrn cajaCarga:proc
extrn asc2dec:proc


	main proc
		mov ax, @data
		mov ds, ax

		mov ah, 9
		mov dx, offset mensajeBienvenida 
		int 21h

		;cargar texto
		mov bx, offset input	
		mov dl, 0dh 			;parar con un enter
		mov dh, 255				;maximo 255 chars
		call cajaCarga
	numeroCifrador:
		mov ah, 9
		mov dx, offset mensajeNumeroCifrador 
		int 21h

		;cargar numero para cifrar 
		mov bx, offset numeroAscii
		mov dl, 0dh				;parar con un enter
		mov dh, 3 				;maximo 2 chars
		call cajaCarga

	mov si, 0
	buscarEnNumeroAscii:
		cmp numeroAscii[si], 24h
		je ascii2decimal
		;si = cantidad de cifras ingresadas, para el asc2dec
		inc si		
		jmp buscarEnNumeroAscii

	ascii2decimal:
		mov bx, offset numeroAscii
		call asc2dec

		mov numero, cl

		cmp numero, 200
		ja errorNumero

		mov bx, 0
		cifrar:
			cmp input[bx], 24h
			je finCifrar

			mov al, numero
			add input[bx], al

			inc bx
			jmp cifrar

		finCifrar:

			mov ah, 9
			mov dx, offset mensajeCifrado 
			int 21h

			mov ah, 9
			mov dx, offset input 
			int 21h 

		fin:
			mov ax,4c00h
			int 21h

		errorNumero:
			mov ah, 9
			mov dx, offset mensajeError 
			int 21h 

			jmp numeroCifrador


	main endp

end