.8086
.model small
.stack 100h
.data
	
.code

public hex2ascii
	;PARAMETROS
		; DL = REGISTRO ORIGEN
		; BX = OFFSET STRING DESTINO (DOS CARAC) APUNTANDO AL FINAL ("00" // add bx, 1)

	hex2ascii proc
	
	push ax
	

	mov ah, 0 
	mov al, dl     ;dl posee el reg 
	mov dl, 16

convierto:     	   ;1ra convercion
	div dl
	cmp ah, 9
	ja esletra
	add [bx],ah
sigo:          	   ;2da convercion
	mov ah, 0
	dec bx
	div dl
	cmp ah, 9
	ja esletra2
	add byte ptr[bx],ah
	jmp fin
esletra:
	mov [bx], ah
	add byte ptr[bx], 55
	jmp sigo
esletra2:
	mov [bx], ah
	add byte ptr[bx], 55

fin:
	pop ax
	ret
	hex2ascii endp
end