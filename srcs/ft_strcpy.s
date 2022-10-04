section .text
	global _ft_strcpy

_ft_strcpy:
	mov	rax, 0 ; rax = 0
	jmp	loop

loop:
	cmp	BYTE [rsi + rax], 0	; compare src[rax] with 0
	je	exit				; if src[rax] == 0, return
	mov	cl, [rsi + rax]		; cpy src[rax] in another register
	mov	[rdi + rax], cl		; cpy the previously stored character in dest[rax]
	inc	rax					; increment rax
	jmp	loop

exit:
	mov	BYTE [rdi + rax], 0	; add \0 at the end of dest
	mov	rax, rdi			; cpy dest in the returned string
	ret