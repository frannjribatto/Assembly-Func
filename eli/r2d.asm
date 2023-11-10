.8086
.model small
.stack 100h
.data
		
.code

public reg2dec

;recibe en bx el offset apuntado al final
	reg2dec proc

	push bp
	mov bp,sp

	push ax
	push cx
	push dx

	mov ah, 0
	mov al, ss:[bp+4]   ;le paso el reg a AL
	mov dl, 10
	mov cx, 3
convierto:
	div dl
	add [bx],ah
	mov ah,0
	dec bx
loop convierto	

	pop dx
	pop cx
	pop ax
	pop bp


	ret 2
	reg2dec endp
end