.8086
.model small
.stack 100h

.data 


.code

public esletra 

	;Parametros:
	; BL = offset del character a chequear
	;Returns:
	; DL = 1 si es letra

	esletra proc

	mov dl, 0

inicioComp:
	cmp bl, 60h
	ja casiMinus

	cmp bl, 40h
	ja casiMayus

	jmp fin ;no es letra 

casiMayus:
	cmp bl, 5Bh
	jb letraConfirmada
	jmp fin

casiMinus:
	cmp bl, 7Bh
	jb letraConfirmada
	jmp fin ;no es letra

letraConfirmada:
	mov dl, 1

fin:
	ret

	esletra endp

end