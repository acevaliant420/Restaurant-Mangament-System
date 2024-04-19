include \masm32\include\masm32rt.inc

.data
    string_decimal db 16 DUP (0)
    number db 105d
    n1 dw 10
    n2 dw 10
    n3 dw 00
.code

start:
    mov ax, n1
    add ax, n2
    mov n3, ax
    push offset n3
    call StdOut
    
    movzx eax, number
    lea edi, string_decimal
    call to_string
    invoke StdOut, addr string_decimal
to_string PROC
    mov ebx, 10
    xor ecx, ecx
repeated_division:
    xor edx, edx
    div ebx
    push dx
    add cl, 1
    or eax, eax
    jnz repeated_division

load_digits:
    pop ax
    or al, 00110000b
    stosb
    loop load_digits
    mov byte ptr [edi], 0
    ret
to_string ENDP



end start