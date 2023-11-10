;Ejercicio 2 (4 puntos):

;El Siguiente ejercicio debe ser resuelto utilizando funciones externas (usando tanto registros como stack para pasar parámetros)
;Realizar un programa que reciba números positivos en base 2 o 10] y que luego los convierta a una base [previamente seleccionada 
;Elnúmero máximo a representar será el correspondiente a un Byte de datos. El software debe constar de un pequeño menú que permita 
;elegir la entrada de datos, y luego de ingreso, la salida de los mismos.

;Recuerde (orden de importancia):

;+ main bien desarrollado, con llamadas, entradas y salida a cada función

;+ funciones de carga (no admite caracteres incorrectos, ni falla frente a cantidad)

;+ manejo de pantalla adecuado, limpieza de código, comentarios correctos (no exagerados)



.8086
.model small
.stack 100h

.data
	text1   db "Escoja la base en la que trabajara:", 0dh, 0ah
			db "1) DECIMAL", 0dh, 0ah
			db "2) BINARIO", 0dh, 0ah, 24h

	tetx2 	db "A que base desea convertir: ", 0dh, 0ah
			db "1) DECIMAL", 0dh, 0ah
			db "2) BINARIO", 0dh, 0ah, 24h

	opt db 0

	saltoDeLinea db 0dh,0ah,24h

	num db "$$$$$$$$", 0dh, 0ah, 24h 

.code
	mov ax, @data
	mov ds, ax

extrn cajaCarga:proc
extrn imprimir:proc
extrn asc2dec:proc	

	main proc

	mov bx, offset text1
	push bx
	call imprimir

	mov ah, 1
	int 21h
	mov opt, al

	cmp opt, 31h
	je decimal
	jmp binario

decimal:
	mov bx, offset saltoDeLinea
	push bx
	call imprimir
	mov dh, 3
	mov bx, offset num
	mov dl, 0dh
	call cajaCarga
	jmp continuar

binario:	
	mov bx, offset saltoDeLinea
	push bx
	call imprimir
	mov dh, 8
	mov bx, offset num
	mov dl, 0dh
	call cajaCarga

continuar:
	
	mov bx, offset saltoDeLinea
	push bx
	call imprimir
	
	mov bx, offset tetx2
	push bx
	call imprimir

	mov ah, 1
	int 21h
	mov opt, al

	cmp opt, 31h
	je convDec

convBin:
encuentroFinBin:

	cmp num[bx], 24h
	je terminaBin
	inc bx
	jmp encuentroFinBin

terminaBin:

	mov bx, offset num
	


convDec:

	mov bx, 0

encuentroFin:	
	
	cmp num[bx], 24h
	je termina
	inc bx
	jmp encuentroFin

termina:

	mov si, bx
	mov bx, offset num
	call asc2dec

finPrograma:

	mov ax, 4c00h
	int 21h

	main endp
end