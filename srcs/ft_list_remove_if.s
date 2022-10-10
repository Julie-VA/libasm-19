section .text
	global _ft_list_remove_if

; rdi = **begin, rsi = *data, rdx = (*cmp)(s1, s2), rcx = (*free)(*tmp)
_ft_list_remove_if:
	cmp		rdi, 0
	je		_exit				; if **begin == NULL, _exit
	cmp		QWORD [rdi], 0
	je		_exit				; if *begin == NULL, _exit
	cmp		rsi, 0
	je		_exit				; if *data == NULL, _exit
	cmp		rdx, 0
	je		_exit				; if cmp == NULL, _exit
	push	r12					; received *begin
	push	r13					; received *data
	push	r14					; received cmp function
	push	r15					; received free function
	push	rbx					; save of previous element
	mov		r12, QWORD [rdi]	; save *begin in r12
	mov		r13, rsi			; save *data in r13
	mov		r14, rdx			; save cmp in r14
	mov		r15, rcx			; save free in r15
	mov		rbx, 0
	jmp		_loop

_loop:
	cmp		r12, 0
	je		_restore				; if *tmp = NULL, we're at the end, _restore
	push	rdi
	mov		rdi, QWORD [r12]		; cpy tmp->data in rdi (1st arg for cmp)
	mov		rsi, r13				; cpy *data in rsi (2nd arg)
	call	r14						; call cmp
	pop		rdi						; restore **begin
	cmp		rax, 0
	je		_delete_elem			; if rax == 0, that means tmp->data == data
	mov		rbx, r12				; cpy current *tmp in rbx
	mov		r12, QWORD [r12 + 8]	; *tmp = tmp->next
	jmp		_loop

_delete_elem:
	cmp		rbx, 0
	je		_case_first				; if rbx == 0, not set yet so r12 to be deleted is the first element
	mov		r8, QWORD [r12 + 8]		; save tmp->next in r8
	mov		QWORD [rbx + 8], r8		; make tmp->next as the new next of the previous element (removing the current element)
	push	rdi
	mov		rdi, r12				; cpy *tmp in rdi (1st arg for free)
	call	r15						; free *tmp
	pop		rdi						; restore **begin
	mov		r12, QWORD [rbx + 8]	; place new *tmp in r12
	mov		rbx, r12				; cpy current *tmp in rbx
	jmp		_loop

_case_first:
	mov		r8, QWORD [r12 + 8]		; cpy tmp->next in r8
	mov		[rdi], r8				; change *begin to tmp->next
	push	rdi
	mov		rdi, r12				; cpy *tmp in rdi (1st arg for free)
	call	r15						; free *tmp
	pop		rdi						; restore **begin
	mov		r12, QWORD [rdi]		; place new *tmp in r12
	mov		rbx, r12				; cpy current *tmp in rbx
	jmp		_loop

_restore:
	pop	rbx
	pop	r15
	pop	r14
	pop	r13
	pop	r12

_exit:
	mov	rax, 0
	ret