.8086
.model small
.stack 100h

.data 


.code

	normalize proc

	cmp al, 60h
	ja casiMayus
	jmp finNormalize

casiMayus:
	
	cmp al, 7Bh
	jb esLetra
	jmp finNormalize

esLetra:

	sub al, 20h

finNormalize:

	ret

	normalize endp

end