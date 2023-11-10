.8086
.model small
.stack 100h
.data 

	texto db "hola este es un texto, 123 jaja.",0dh,0ah,24h
	letraMayus db "A"
	letraMinus db "a"
	numero db "7"
	guionbajo db "_"
	numBin db "00000000",0dh,0ah,24h
	numReg db 129
	numAscii db "000",0dh,0ah,24h

	hexaString db "JA",0dh,0ah,24h

	textoEsLetra db "es letra, pa",0dh,0ah,24h
	textoNoEsLetra db "NO es letra, pa",0dh,0ah,24h
	textoEsNumero db "es NUMERO, pa",0dh,0ah,24h
	textoNoEsNumero db "NO es numero, pa",0dh,0ah,24h
	textoEsHexa db "Es HEXA, pa",0dh,0ah,24h
	textoNoEsHexa db "NO Es HEXA, pa",0dh,0ah,24h

.code

extrn imprimir:proc
extrn dec2ascii:proc
extrn reg2bin:proc
;extrn asc2bin:proc	

	main proc
		mov ax, @data
		mov ds, ax


		;ascii2binario
		;mov bx, offset numBin
		;call asc2bin
		
		;decimal2ascii
		mov al, 3
		mov si, offset numAscii
		add si, 2
		mov bl, numReg
		call dec2ascii


		;binario2ascii
		mov bx, offset numBin
		add bx, 7
		mov dl, numReg
		call reg2bin


		;hexa2ascii

		mov bx, offset numAscii
		push bx
		call imprimir

		fin:
			mov ax,4c00h
			int 21h



	main endp

end