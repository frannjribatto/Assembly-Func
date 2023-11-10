.8086
.model small
.stack 100h

.data 


.code

public esnumero 

	;Parametros:
	; BX = offset del character a chequear
	;Returns:
	; DL = 1 si es numero

	esnumero proc

	mov dl, 0

inicioComp:
	cmp byte ptr[bx], 2Fh
	ja casiNumero

	jmp fin ;no es numero

casiNumero:
	cmp byte ptr[bx], 3Ah
	jb numeroConfirmado
	jmp fin

numeroConfirmado:
	mov dl, 1

fin:
	ret

	esnumero endp

end