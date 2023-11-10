.8086
.model small
.stack 100h
.data
	bin db '00000000',0dh,0ah,24h

.code
extrn reg2bin:proc


	main proc

		mov ax, @data
		mov ds, ax

		mov dx,0
		add dl, 255


		lea bx, bin
		add bx, 7
		call reg2bin
		
		mov ah,9
		mov dx, offset bin 
		int 21h

		mov ax, 4c00h
		int 21h
	main endp
end