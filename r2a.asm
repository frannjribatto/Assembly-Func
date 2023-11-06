.8086
.model small
.stack 100h

.data

	ascii db "000", 0dh, 0ah, 24h
	multi db 100, 10, 1, 0dh, 0ah, 24h

.code

public r2a


	r2a proc
	mov ah, 0
	mov al, bx
	mov dl, 10
	mov cx 3
	mov si, 2

toAscii:

	div dl
	add ascii[si], ah
	mov ah, 0
	dec si
	loop toAscii

	mov ah, 9
	mov dx, offset ascii

	ret

	endp r2a

end