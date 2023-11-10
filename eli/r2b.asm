.8086
.model small
.stack 100h
.data
		
.code

public reg2bin

;recibe en bx el offset apuntado al final
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