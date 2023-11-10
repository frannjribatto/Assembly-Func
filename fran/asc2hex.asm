.8086
.model small
.stack 100h
.data
		
.code

	public ascii2hex
	;Parametros:
		;BX = offset string (APUNTANDO AL FINAL)
	;Retorna:
		;DL = numero hexa

	ascii2hex proc

	push ax

	mov ah,0
	mov dh, 0
	mov dl, 16 ; porque la base de hexa es 16
	mov cx,0

convierto:  ;primer numero
	cmp byte ptr[bx], 30h
	je cero
	cmp byte ptr[bx], 64
	ja esletra
	mov al, [bx]
	sub al, 48
	add cl, al
	jmp sigo	
cero:
	add cl, 0	
sigo:
	dec bx
	cmp byte ptr[bx], 30h
	je fincero
	cmp byte ptr[bx], 64
	ja esletra2
	mov al,	[bx]
	sub al, 48
	mul dl 
	add cl, al ;ahora cl tiene el numero completo
	jmp finnocero


esletra:
	mov al,	[bx]
	sub al, 55
	add cl, al
	jmp sigo

esletra2:
	mov al,	[bx]
	sub al, 55
	mul dl 
	add cl, al ;ahora cl tiene el numero completo

finnocero:
	mov dl, cl
	jmp fin

fincero:
	add cl, 0
	mov dl, cl	
	pop ax
fin:
	ret 
	ascii2hex endp
end