.8086
.model small
.stack 100h
.data
	;PARAMETROS
		;PROGRAMA PARA UN BYTE ("00000000")
		;BX = OFFSET STRING BINARIO DESTINO APUNTANDO AL FINAL (add bx, 7 en main) 
		;DL = ES EL REGISTRO ORIGEN
.code

public reg2bin

	reg2bin proc

	push bp
	mov bp,sp

	push ax
	push cx
	push dx

	mov ah, 0
	mov al, dl   ;le paso el reg a AL
	mov dl, 2
	mov cx, 8
convierto:
	div dl
	add [bx], ah
	mov ah,0
	dec bx
loop convierto	
	

	pop dx
	pop cx
	pop ax
	pop bp

	ret 2
	reg2bin endp
end