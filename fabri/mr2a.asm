.8086
.model small
.stack 100h

.data
	num db 130
	conv db "00000000",0dh,0ah,24h
.code
extrn reg2ascii:proc

	main proc
		mov ax, @data
		mov ds, ax


		mov bl,num
		
	
		mov al, 8     ; por funcionamiento de la funcion tenes que darle la cantidad de caracteres del string
					  ; porque este valor es usado como condicion de loop 	
		lea si, conv  ; apunte al offset
		add si, 7	  ; apunte al final del string
		call reg2ascii


		mov ah, 9
		mov dx, offset conv ; la imprime
		int 21h 


		mov ax,4c00h
		int 21h

	main endp

end