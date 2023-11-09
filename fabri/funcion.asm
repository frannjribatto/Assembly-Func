
.8086
.model small
.stack 100h
.data 

	texto db "hola este es un texto, jaja.",0dh,0ah,24h
	letraMayus db "A"
	letraMinus db "a"
	numero db "7"
	guionbajo db "_"

	textoEsLetra db "es letra, pa",0dh,0ah,24h
	textoNoEsLetra db "NO es letra, pa",0dh,0ah,24h
	textoEsNumero db "es NUMERO, pa",0dh,0ah,24h
	textoNoEsNumero db "NO es numero, pa",0dh,0ah,24h

.code

extrn mayusculizar:proc
extrn esletra:proc
extrn esnumero:proc

	main proc
		mov ax, @data
		mov ds, ax

		;Mayusculizador
		mov bx, offset texto
		;call mayusculizar

		;esNumero
		mov bx, 0
		mov bl, letraMayus
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


		;esNumero

		;ascii2binario

		;ascii2hexa

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
			jmp fin

		imprimirNoEsLetra:
			mov ah, 9
			mov dx, offset textoNoEsLetra 
			int 21h 
			jmp fin

		imprimirEsNumero:
			mov ah, 9
			mov dx, offset textoEsNumero
			int 21h 
			jmp fin

		imprimirNoEsNumero:
			mov ah, 9
			mov dx, offset textoNoEsNumero
			int 21h 
			jmp fin

	main endp

end