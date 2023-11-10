.8086
.model small
.stack 100h
.data
		
.code

	public ascii2hex
	;Parametros:
		;BX = offset string (APUNTANDO AL FINAL)
	;Retorna:
		;DL = numero hexa

;recibe en bx el offset apuntado al final
;esta funcion agarra un hexa (00-FF) y lo pasa a reg en DL para esto se 
;usa la forma en la que se conforman los hexadecimales
; esta forma es la de base elevado al exponente como nosotros trabajamos
; en 00-FF el numero es X * 16¹ + X 
; de esta fomra al primer numero lo sumo directamente (le resto 48 decimal
;que es lo mismo que sacarle 30h para convertir los numeros en registros) 
; pero cuando se trata del segundo numero ahi lo que hago es a lo que me 
;dio una vez convertido en reg ( ya sea numero de 1 a 9 o letra A a F, el
; cero tiene un caso aparte )
; a ese reg obtenido lo multiplico por 16 y se lo sumo a lo que tenia
; guardado  ( se almacenan en CL porque DL lo uso para el mul)
; antes de terminar paso todo a DL y de esa forma me aseguro tener el 
;reg obtenido en DL
	ascii2hex proc

	push ax

	mov ah,0
	mov dh, 0
	mov dl, 16 ; porque la base de hexa es 16
	mov cx,0

convierto:  ;primer numero
	cmp byte ptr[bx], 30h
	je cero
	cmp byte ptr[bx], 64
	ja esletra
	mov al, [bx]
	sub al, 48
	add cl, al
	jmp sigo	
cero:
	add cl, 0	
sigo:
	dec bx
	cmp byte ptr[bx], 30h
	je fincero
	cmp byte ptr[bx], 64
	ja esletra2
	mov al,	[bx]
	sub al, 48
	mul dl 
	add cl, al ;ahora cl tiene el numero completo
	jmp finnocero


esletra:
	mov al,	[bx]
	sub al, 55
	add cl, al
	jmp sigo

esletra2:
	mov al,	[bx]
	sub al, 55
	mul dl 
	add cl, al ;ahora cl tiene el numero completo

finnocero:
	mov dl, cl
	jmp fin

fincero:
	add cl, 0
	mov dl, cl	
	pop ax
fin:
	ret 
	ascii2hex endp
end