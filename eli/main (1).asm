.8086
.model small
.stack 100h
.data
	bin db '10011000',0dh,0ah,24h
	espacio db ,0dh,0ah,24h
	texto db 'el numero en decimal es: '
	decimal db '000',0dh,0ah,24h
	texto2 db 'el numero en hexa es: '
	hexa db '00',0dh,0ah,24h
.code
extrn bin2reg:proc
extrn reg2dec:proc
extrn reg2hexa:proc

	main proc

		mov ax, @data
		mov ds, ax

		lea bx, bin
		call bin2reg  ;cuando sale de aca DL tiene el reg que quiero printear en decimal

		lea bx, decimal
		add bx, 2
		push dx	
		call reg2dec

		lea bx, hexa
		add bx, 1

		call reg2hexa

		mov ah,9
		mov dx, offset bin
		int 21h

		mov ah,9
		mov dx, offset espacio
		int 21h

		mov ah,9
		mov dx, offset texto
		int 21h

		mov ah,9
		mov dx, offset espacio
		int 21h

		mov ah,9 
		mov dx, offset texto2
		int 21h


		mov ax, 4c00h
		int 21h
	main endp
end