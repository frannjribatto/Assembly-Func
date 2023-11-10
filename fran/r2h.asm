.8086
.model small
.stack 100h
.data
	
.code

public reg2hexa

;esta funcion convierte un reg en un hexa
;recibe el reg por DL
;recibe el offset de la variable donde va a guardar la conversion por BX apuntando al final de la misma
;como trabajamos en 1 byte, la variable donde se guarda es del formato '00' por lo que
;solo debo hacer 2 converciones	

	reg2hexa proc
	
	push ax
	

	mov ah, 0 
	mov al, dl    ;dl posee el reg 
	mov dl, 16

convierto:     ;1ra convercion
	div dl
	cmp ah, 9
	ja esletra
	add [bx],ah
sigo:          ;2da convercion
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
	reg2hexa endp
end