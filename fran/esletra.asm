.8086
.model small
.stack 100h

.data 


.code

public esletra 

	;PARAMETROS:
		; BX = offset del character a chequear
	;RETIORNA:
		; DL = 1 si es letra

	esletra proc

	mov dl, 0

inicioComp:
	cmp byte ptr[bx], 60h
	ja casiMinus

	cmp byte ptr[bx], 40h
	ja casiMayus

	jmp fin ;no es letra 

casiMayus:
	cmp byte ptr[bx], 5Bh
	jb letraConfirmada
	jmp fin

casiMinus:
	cmp byte ptr[bx], 7Bh
	jb letraConfirmada
	jmp fin ;no es letra

letraConfirmada:
	mov dl, 1

fin:
	ret

	esletra endp

end