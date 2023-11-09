.8086
.model small
.stack 100h

.data 


.code

public esnumero 

	;Parametros:
	; BL = offset del character a chequear
	;Returns:
	; DL = 1 si es numero

	esnumero proc

	mov dl, 0

inicioComp:
	cmp bl, 2Fh
	ja casiNumero

	jmp fin ;no es numero

casiNumero:
	cmp bl, 3Ah
	jb numeroConfirmado
	jmp fin

numeroConfirmado:
	mov dl, 1

fin:
	ret

	esnumero endp

end