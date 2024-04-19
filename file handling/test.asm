include \masm32\include\masm32rt.inc

.data
    bill_write db "Now i want"  ; Define bill_write with enough space to hold input
    file_contents1 db 50 dup(?)  ; Define file_contents1 for input

.code
start:
    ; Take input from file_contents1
    push 50
    push offset file_contents1
    call StdIn


    mov esi, offset file_contents1  
    mov edi, offset bill_write      

    mov ecx, 50 
    rep movsb     

    ; Display bill_write
    push offset bill_write
    call StdOut

    invoke ExitProcess, 0  ; Exit the program
    
end start
