.8086
.model small
.stack 100h
.data
	hexa db '0A',0dh,0ah,24h 
	decimal db '000',0dh,0ah,24h
	
.code
extrn hexa2reg:proc
extrn reg2dec:proc



	main proc

		mov ax, @data
		mov ds, ax

		mov dx,0

		lea bx, hexa
		add bx, 1
		call hexa2reg ;cuando vuelve, dl tiene el reg

		lea bx, decimal
		add bx, 2
		push dx
		call reg2dec

		mov ah,9
		mov dx, offset decimal
		int 21h

		mov ax, 4c00h
		int 21h
	main endp
end