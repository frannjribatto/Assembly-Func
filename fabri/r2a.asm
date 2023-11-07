.8086
.model small
.stack 100h
.data 

.code

	public reg2ascii
; bl = el numero reg el cual quiero convertir a ascii
; si = el offset al ultimo caracter del string destino
; al = la cantidad de caracteres del string destino
					
	reg2ascii proc
	push ax
	push dx
	push cx
	
	mov ah, 0
	mov cl, al	  
	mov al, bl    
	mov dl, 10
	
divido:
	div dl  		; me guarda el resto de la division en AH y el cociente en AL
	add [si], ah 	; sumo el resto al string destino
	mov ah, 0   	; limpio el AH para que AX solo contenga el valor a convertir en AL (cociente)
	dec si			; pasar al caracter de la izquierda del string destino
	dec cl			
	cmp cl,0      	;condicion de salida
	je fin
jmp divido   


fin:
	pop cx
	pop dx
	pop ax	
	
	ret
	reg2ascii endp	
end 







