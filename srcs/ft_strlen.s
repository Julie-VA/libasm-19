section .text
	global _ft_strlen

_ft_strlen:
	mov	rax, 0 ; rax = 0
	jmp	loop

loop:
	cmp	BYTE [rdi + rax], 0	; compare src[rax] with 0
	je	exit 				; if src[rax] == 0, return
	inc rax 				; increment rax
	jmp loop

exit:
	ret