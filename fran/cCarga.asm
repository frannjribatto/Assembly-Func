.8086
.model small
.stack 100h

.data


.code

public cajaCarga
	;PARAMETRO
		;BX = OFFSET STRING DESTINO
		;DL = CARACTER DE CORTE (0dh, 24h)

	proc cajaCarga
	
	push ax

	mov ah, 1
	int 21h
	cmp al, dl 		
	je finCarga
	mov [bx], al
	inc bx

	jmp cajaCarga

finCarga:	

	pop ax
	ret

	endp cajaCarga

end