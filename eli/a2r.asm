.8086
.model small
.stack 100h
.data
	valores db 100,10,1
.code
public ascii2reg
;esta funcion recibe el offset de una variable en ascii y la devuelve en reg en DL
	ascii2reg proc

	push ax
	push cx 
	push si

	mov si, 0
	mov ax, 0
	;mov dl, 10
convierto:
	cmp byte ptr[bx], 0dh
	je fin
 	mov dl, valores[si]
	mov al, [bx]
	sub al, 30h
	mul dl
	add cl, al
	inc bx
	inc si
jmp convierto 

fin:
	mov dl, cl

	pop si
	pop cx
	pop ax

	ret
	ascii2reg endp
end