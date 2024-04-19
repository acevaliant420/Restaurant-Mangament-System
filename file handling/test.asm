include \masm32\include\masm32rt.inc

.data

    file_handle HANDLE ?
    filename db "E:\Restaurant-Mangament-System\file handling\items.txt", 0
    file_contents db 256 dup(?)
    butes_read db ?
    ; first page
    firstpage db 0dh, 0ah, "Welcome to Restaurant Mangement System"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "| 1. Restaurant Admin     |"
              db  0dh, 0ah, "| 2. Order Food           |"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "Enter Your Option(1-2) >", 0
    choosen   db 50 dup(?)

    re1 db 0dh, 0ah, "Redirecting to you to admin page ......", 0

    ; resmenu page
    resMenupg db 0dh, 0ah, "Welcome to Restaurant Admin"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "| 1. Order History        |"
              db  0dh, 0ah, "| 2. Restocking           |"
              db  0dh, 0ah, "| 3. Price Adjustment     |"
              db  0dh, 0ah, "| 4. Exit                 |"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    reschoosen   db 50 dup(?)

    ; OrderMenu page
    orderMenupg db 0dh, 0ah, "Welcome to ICD Restaurant"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "| 1. Starters             |"
              db  0dh, 0ah, "| 2. Main Course          |"
              db  0dh, 0ah, "| 3. Bread                |"
              db  0dh, 0ah, "| 4. Desert               |"
              db  0dh, 0ah, "| 5. Exit                 |"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "Enter Your Option(1-4) >", 0
    ordchoosen   db 50 dup(?)

    ;starter menu
    starterpg   db  0dh, 0ah, "         Starters          "
              db  0dh, 0ah, "+-------------------------+", 0
    f_starter1 db  0dh, 0ah, "| 1. Malai Chaap           |", 0
    f_starter2 db  0dh, 0ah, "| 2. Paneer Tikka          |", 0
    f_starter3 db  0dh, 0ah, "| 3. Chicken Tandoori      |", 0
    starer_menu db  0dh, 0ah, "+-------------------------+", 0
    choice_s          db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    rupees db "Rs ", 0
    f_starter1p db "100"
    f_starter2p db "200"
    f_starter3p db "300"
    stchoosen   db 50 dup(?)

    one db "1", 0
    two db "2", 0
    three db "3", 0
    four db "4", 0
    five db "5", 0
    six db "6", 0
    seven db "7", 0
    eight db "8", 0
    nine db "9", 0
    ten db "10", 0
    

.code

start:
    create_file:
        push 0
        push FILE_ATTRIBUTE_NORMAL
        push OPEN_EXISTING
        push 0
        push 0
        push FILE_READ_DATA
        push offset filename
        call CreateFileA
        mov file_handle, eax
    
    push offset firstpage
    call StdOut

    push 50
    push offset choosen
    call StdIn

    push offset one
    push offset choosen
    call crt__stricmp

    cmp eax, 0
    je resMenu
    jne ordMenu


resMenu:
    push offset resMenupg
    call StdOut

    push 50
    push offset reschoosen
    call StdIn

    push offset reschoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je order_his

    push offset reschoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je order_his

    push offset reschoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je order_his

    push offset reschoosen
    push offset four
    call crt__stricmp
    cmp eax,0
    je exit_app

order_his:
    push 0
    push offset butes_read
    push 256
    push offset file_contents
    push file_handle
    call ReadFile

    invoke StdOut, offset file_contents
    jmp resMenu

ordMenu:
    push offset orderMenupg
    call StdOut

    push 50
    push offset ordchoosen
    call StdIn

    push offset ordchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je starter

    push offset ordchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je main_course

    push offset ordchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je breads

    push offset ordchoosen
    push offset four
    call crt__stricmp
    cmp eax,0
    je desert

    push offset ordchoosen
    push offset five
    call crt__stricmp
    cmp eax,0
    je exit_app

starter:
    push offset starterpg
    call StdOut
    push offset f_starter1
    call StdOut
    push offset rupees
    call StdOut
    push offset f_starter1p
    call StdOut
    push offset f_starter2
    call StdOut
    push offset rupees
    call StdOut
    push offset f_starter2p
    call StdOut
    push offset f_starter3
    call StdOut
    push offset rupees
    call StdOut
    push offset f_starter3p
    call StdOut
    push offset starer_menu
    call StdOut
    push offset choice_s
    call StdOut

    jmp ordMenu

main_course:
    jmp ordMenu

breads:
    jmp ordMenu

desert: 
    jmp ordMenu

exit_app:

end start
