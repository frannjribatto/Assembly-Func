.8086
.model small
.stack 100h
.data
		numero db 128,64,32,16,8,4,2,1
.code

public bin2reg


;esta funcion convierte un binario en un reg
;recibe el offset de la variable donde va a guardar la conversion por BX
;defino una variable con lo que debo sumar en caso de encontrar un 1 en cada posicion

;1000 0000 = 128 en registro

bin2reg proc
	
	push ax
	push si

	lea si, numero

	mov dx, 0
	mov ax, 0
	
convierto:
	cmp byte ptr[bx], 0dh   
	je fin
	cmp byte ptr [bx], '1' ;porque el binario esta definido como "00000000"	
	je esuno
sigo:
	inc bx
	inc si 
	jmp convierto

esuno:
	mov al,[si]
	add dl, al   ; dl va a tener el reg guardado
	jmp sigo


fin:
	pop si 
	pop ax

	ret
	bin2reg endp
end