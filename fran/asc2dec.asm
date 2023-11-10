.8086
.model small
.stack 100h

.data
	cifras db 1, 10, 100
.code

public asc2dec
	;PARAMETROS:
	   ;BX = OFFSET STRING ORIGEN (HASTA "000").
	   ;SI = CANT. CIFRAS: 1, 2, 3
	;RETORNA: 
       ;CL = REGISTRO

	proc asc2dec

        push ax
        push bx
        push dx
        mov cx, 0

        dec si ;para transformar cantidad de cifras en acceso por indice

        cmp si, 1
        je decena

        cmp si, 0
        je unidad

    ;centena
        sub byte ptr [bx], 30h 
        mov al, [bx]

        mov dl, cifras[si]
        dec si
        mul dl 
        add cl, al 
        inc bx
    decena:
        sub byte ptr [bx], 30h
        mov al, [bx]
        mov dl, cifras[si]
        dec si
        mul dl
        add cl, al
        inc bx
     unidad:
        sub byte ptr [bx], 30h
        add cl, [bx]

        pop dx
        pop bx
        pop ax

        ret

	endp asc2dec

end