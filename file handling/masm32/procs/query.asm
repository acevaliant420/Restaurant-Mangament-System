; �������������������������������������������������������������������������

query proc

    mov ecx, ((dummy - vtable)/4)
    mov eax, OFFSET vtable
    ret

query endp

; �������������������������������������������������������������������������