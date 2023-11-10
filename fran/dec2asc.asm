.8086
.model small
.stack 100h
.data 

.code

	public dec2ascii
		;PARAMETROS
			;BL = REGISTRO NUM DECIMAL
			;SI = OFFSET STRING (DESTINO, ULTIMO CARACTER)
			;AL = CANT. DE CARACTERES (STRING DESTINO)
					
	dec2ascii proc

	push ax
	push dx
	push cx
	
	mov ah, 0
	mov cl, al	  
	mov al, bl    
	mov dl, 10
	
divido:
	div dl  		
	add [si], ah 	
	mov ah, 0   	
	dec si			
	dec cl			
	cmp cl,0      	
	je fin
jmp divido   


fin:
	pop cx
	pop dx
	pop ax	
	
	ret
	dec2ascii endp	
end 







