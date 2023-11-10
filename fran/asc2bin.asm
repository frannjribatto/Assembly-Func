.8086
.model small
.stack 100h
.data
		numero db 128,64,32,16,8,4,2,1
.code

public asc2bin
	;PARAMETROS
		; RECIBE 1 BYTE "00000000", 0dh
		; BX = OFFSET STRING ORIGEN
		; DEBE TERMINAR CON UN 0dh
		;RETORNA
		; DL = REGISTRO 

asc2bin proc
	
	push ax
	push si

	lea si, numero

	mov dx, 0
	mov ax, 0
	
convierto:
	cmp byte ptr[bx], 0dh   
	je fin
	cmp byte ptr [bx], '1'
	je esuno
sigo:
	inc bx
	inc si 
	jmp convierto

esuno:
	mov al,[si]
	add dl, al   
	jmp sigo


fin:
	pop si 
	pop ax

	ret
	asc2bin endp
end