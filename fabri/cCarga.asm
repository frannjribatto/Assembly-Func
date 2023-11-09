.8086
.model small
.stack 100h

.data
	
	saltoDeLinea db 0dh,0ah,24h

.code

public cajaCarga
	
	;BX = Offset variable string a llenar.
	;DL = caracter para salir de la caja de carga, usualmente 0Dh (enter)
	;DH = cantidad maxima da caracteres a cargar.

	proc cajaCarga
	
	push ax
	push cx

	mov cl, 0

	carga:
		cmp cl, dh
		jae finCarga

		mov ah, 1
		int 21h
		cmp al, dl 		
		je finCarga
		mov [bx], al
		inc bx
		inc cl

		jmp carga

finCarga:	

	pop ax
	pop cx

	mov ah, 9
	mov dx, offset saltoDeLinea 
	int 21h 

	ret

	endp cajaCarga

end