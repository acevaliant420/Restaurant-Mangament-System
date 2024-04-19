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
              db  0dh, 0ah, "| 5. Complete Order       |"
              db  0dh, 0ah, "| 6. Exit                 |"
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
    stchoosen   db 50 dup(?)
    qunat_s          db  0dh, 0ah, "Enter Your Quantity >", 0
    stquant   db 50 dup(?)
    rupees db "Rs ", 0
    f_starter1p db "100", 0
    f_starter2p db "200", 0
    f_starter3p db "300", 0
    

    ;main menu
    main_coursepg   db  0dh, 0ah, "       Main Cousre        "
               db  0dh, 0ah, "+-------------------------+", 0
    f_main1 db  0dh, 0ah, "| 1. Dal Makhani           |", 0
    f_main2 db  0dh, 0ah, "| 2. Paneer Tikka Masala   |", 0
    f_main3 db  0dh, 0ah, "| 3. Butter Chicken        |", 0
    main_menu db  0dh, 0ah, "+-------------------------+", 0
    choice_m          db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    qunat_m          db  0dh, 0ah, "Enter Your Quantity >", 0
    mcquant   db 50 dup(?)
    f_main1p db "300", 0
    f_main2p db "400", 0
    f_main3p db "600", 0
    mcchoosen   db 50 dup(?)


    ;Bread menu
    breadpg    db  0dh, 0ah, "       Breads         "
               db  0dh, 0ah, "+-------------------------+", 0
    f_bread1 db  0dh, 0ah, "| 1. Roti                   |", 0
    f_bread2 db  0dh, 0ah, "| 2. Butter Naan            |", 0
    f_bread3 db  0dh, 0ah, "| 3. Tandoori Parantha      |", 0
    bread_menu db  0dh, 0ah, "+-------------------------+", 0
    choice_b          db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    qunat_b          db  0dh, 0ah, "Enter Your Quantity >", 0
    brquant   db 50 dup(?)
    f_bread1p db "10", 0
    f_bread2p db "90", 0
    f_bread3p db "110", 0
    brchoosen   db 50 dup(?)

    desertpg    db  0dh, 0ah, "        Desert             "
               db  0dh, 0ah, "+-------------------------+", 0
    f_desert1 db  0dh, 0ah, "| 1. Lassi                  |", 0
    f_desert2 db  0dh, 0ah, "| 2. Choco Lava Cake        |", 0
    f_desert3 db  0dh, 0ah, "| 3. Rasmalai(2pcs)         |", 0
    desert_menu db  0dh, 0ah, "+-------------------------+", 0
    choice_d          db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    qunat_d          db  0dh, 0ah, "Enter Your Quantity >", 0
    dsquant   db 50 dup(?)
    f_desert1p db "60", 0
    f_desert2p db "120", 0
    f_desert3p db "150", 0
    dschoosen   db 50 dup(?)


    thank db 0dh, 0ah, "Thank You for visiting ICD Restaurant"
            db 0dh, 0ah, "Have a nice day", 0

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
    je bill_generation

    push offset ordchoosen
    push offset six
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

    push 50
    push offset stchoosen
    call StdIn

    push offset qunat_s
    call StdOut

    push 50
    push offset stquant
    call StdIn

    jmp ordMenu

main_course:
    push offset main_coursepg
    call StdOut
    push offset f_main1
    call StdOut
    push offset rupees
    call StdOut
    push offset f_main1p
    call StdOut
    push offset f_main2
    call StdOut
    push offset rupees
    call StdOut
    push offset f_main2p
    call StdOut
    push offset f_main3
    call StdOut
    push offset rupees
    call StdOut
    push offset f_main3p
    call StdOut
    push offset starer_menu
    call StdOut
    push offset choice_m
    call StdOut

    push 50
    push offset mcchoosen
    call StdIn

    push offset qunat_m
    call StdOut

    push 50
    push offset mcquant
    call StdIn

    jmp ordMenu

breads:
    push offset breadpg
    call StdOut
    push offset f_bread1
    call StdOut
    push offset rupees
    call StdOut
    push offset f_bread1p
    call StdOut
    push offset f_bread2
    call StdOut
    push offset rupees
    call StdOut
    push offset f_bread2p
    call StdOut
    push offset f_bread3
    call StdOut
    push offset rupees
    call StdOut
    push offset f_bread3p
    call StdOut
    push offset bread_menu
    call StdOut
    push offset choice_b
    call StdOut

    push 50
    push offset brchoosen
    call StdIn

    push offset qunat_b
    call StdOut

    push 50
    push offset brquant
    call StdIn

    jmp ordMenu

desert: 
    push offset desertpg
    call StdOut
    push offset f_desert1
    call StdOut
    push offset rupees
    call StdOut
    push offset f_desert1p
    call StdOut
    push offset f_desert2
    call StdOut
    push offset rupees
    call StdOut
    push offset f_desert2p
    call StdOut
    push offset f_desert3
    call StdOut
    push offset rupees
    call StdOut
    push offset f_desert3p
    call StdOut
    push offset desert_menu
    call StdOut
    push offset choice_d
    call StdOut

    push 50
    push offset dschoosen
    call StdIn

    push offset qunat_d
    call StdOut

    push 50
    push offset dsquant
    call StdIn

    jmp ordMenu
bill_generation:
    push offset thank
    call StdOut

    ; calculate total bill
    mov eax, 0
    mov ebx, 0
    mov ecx, 0

    ; add price of starter
    mov eax, 0
    mov ax, word ptr[f_starter1p]
    imul eax, word ptr[stquant]
    add ebx, eax

    ; add price of main course
    mov eax, 0
    mov ax, word ptr[f_main1p]
    imul eax, word ptr[mcquant]
    add ebx, eax

    ; add price of bread
    mov eax, 0
    mov ax, word ptr[f_bread1p]
    imul eax, word ptr[brquant]
    add ebx, eax

    ; add price of desert
    mov eax, 0
    mov ax, word ptr[f_desert1p]
    imul eax, word ptr[dsquant]
    add ebx, eax

    ; display total bill
    push offset rupees
    call StdOut
    push ebx
    call StdOut

    jmp exit_app

exit_app:

end start
