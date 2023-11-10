.8086
.model small
.stack 100h
.data 	

	;PARAMETRO
		;RECIBE UN PUSH DEL OFFSET DEL STRING A IMPRIMIR, DEBE TERMINAR CON 24h

.code

public imprimir

	imprimir proc

		push bp
		mov bp, sp

		push ax
		push dx

		mov ah, 9
		mov dx, ss:[bp+4]
		int 21h

		pop dx
		pop ax
		pop bp

	ret 2


	imprimir endp

end