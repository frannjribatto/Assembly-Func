.8086
.model small
.stack 100h

.data 


.code

public eshexa 

	;Parametros:
	; BX = offset del string a chequear EN MAYUSCULA
	;Returns:
	; DL = 1 si todos los chars son validos en hexa

extrn esnumero:proc

	eshexa proc

	mov dl, 0

	;"FF"
	inicio:
		call esnumero
		cmp dl, 1
		je siguiente
		mov dl, 1 	;el string es hexa, a no ser que fail

	;ver si esta de la A a la F
	inicioComp:
		
		cmp byte ptr[bx], 0dh
		je fin

		cmp byte ptr[bx], 24h
		je fin
		;mayor a "A"?
		cmp byte ptr[bx], 40h
		ja casiLetraHexa
		jmp fail

	casiLetraHexa:
		cmp byte ptr[bx], 47h
		jb siguiente
		jmp fail 	;si no esta en rango, fail

	fin:
		ret

	fail:
		mov dl, 0
		ret

	siguiente:
		inc bx
		jmp inicio

	eshexa endp

end