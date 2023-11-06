.8086
.model small
.stack 100h

.data


.code

public cajaCarga
	;RECIBE EL OFFSET DE UNA VARIABLE A LLENAR EN BX (MOV BX, OFFSET VAR / LEA BX, VAR)
	;LA FUNCION RECIBE PARAMETRO POR DL 

	proc cajaCarga
	
	; Antes de llamar a la funcion muevo a dl el caracter con el que quiero terminar
	; la caja de carga. 
	
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