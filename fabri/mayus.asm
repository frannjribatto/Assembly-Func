.8086
.model small
.stack 100h

.data 


.code

public mayusculizar 

	;Parametros:
	; BX = offset del string a modificar

	mayusculizar proc

inicioComp:
	
	cmp byte ptr[bx], 0dh
	je finNormalize

	cmp byte ptr[bx], 24h
	je finNormalize

	cmp byte ptr[bx], 60h
	ja casiMinus
	jmp siguiente

casiMinus:
	cmp byte ptr[bx], 7Bh
	jb esMinus
	jmp siguiente

esMinus:
	sub byte ptr[bx], 20h
	inc bx
	jmp inicioComp

finNormalize:
	ret

siguiente:
	inc bx
	jmp inicioComp

	mayusculizar endp

end