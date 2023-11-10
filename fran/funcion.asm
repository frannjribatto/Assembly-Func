
.8086
.model small
.stack 100h
.data 

	texto db "hola este es un texto, 123 jaja.",0dh,0ah,24h
	letraMayus db "A"
	letraMinus db "a"
	numero db "7"
	guionbajo db "_"
	numBin db "10000000"

	hexaString db "JA",0dh,0ah,24h

	textoEsLetra db "es letra, pa",0dh,0ah,24h
	textoNoEsLetra db "NO es letra, pa",0dh,0ah,24h
	textoEsNumero db "es NUMERO, pa",0dh,0ah,24h
	textoNoEsNumero db "NO es numero, pa",0dh,0ah,24h
	textoEsHexa db "Es HEXA, pa",0dh,0ah,24h
	textoNoEsHexa db "NO Es HEXA, pa",0dh,0ah,24h

.code

extrn mayusculizar:proc
extrn esletra:proc
extrn esnumero:proc
extrn ascii2hex:proc
extrn eshexa:proc

	main proc
		mov ax, @data
		mov ds, ax

		;esHexa
		mov bx, offset hexaString
		call eshexa
		cmp dl, 1
		je imprimirEsHexa
		jmp imprimirNoEsHexa

		;ascii2hexa
		mov bx, offset hexaString
		add bx, 1
		call ascii2hex

		;Mayusculizador
		mov bx, offset texto
		call mayusculizar

		;esNumero
		mov bx, 0
		mov bx, offset letraMayus
		call esnumero

		cmp dl, 1
		je imprimirEsNumero
		jmp imprimirNoEsNumero


		;esLetra
		mov bx, 0
		mov bl, guionbajo
		call esletra

		cmp dl, 1
		je imprimirEsLetra
		jmp imprimirNoEsLetra


		;ascii2binario
		
		;decimal2ascii

		;binario2ascii

		;hexa2ascii

		imprimir:

			mov ah, 9
			mov dx, offset texto 
			int 21h 

		fin:
			mov ax,4c00h
			int 21h

		imprimirEsLetra:
			mov ah, 9
			mov dx, offset textoEsLetra 
			int 21h 
			jmp imprimir

		imprimirNoEsLetra:
			mov ah, 9
			mov dx, offset textoNoEsLetra 
			int 21h 
			jmp imprimir

		imprimirEsNumero:
			mov ah, 9
			mov dx, offset textoEsNumero
			int 21h 
			jmp imprimir

		imprimirNoEsNumero:
			mov ah, 9
			mov dx, offset textoNoEsNumero
			int 21h 
			jmp imprimir

		imprimirEsHexa:
			mov ah, 9
			mov dx, offset textoEsHexa
			int 21h 
			jmp imprimir

		imprimirNoEsHexa:
			mov ah, 9
			mov dx, offset textoNoEsHexa
			int 21h 
			jmp imprimir

	main endp

end