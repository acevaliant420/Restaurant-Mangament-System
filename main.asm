include \masm32\include\masm32rt.inc

.data
    bill_write db 0dh, 0ah, "+-------Generated Bill-------+", 0
    file_handle HANDLE ?
    filename db "E:\Restaurant-Mangament-System\order-history.txt", 0
    file_contents dw 512 dup(?)
    butes_read dw ?
    newprice db 256 dup(?), 0
    newname db 256 dup(?), 0
    
    file_handle3 HANDLE ?
    filename3 db "E:\Restaurant-Mangament-System\order-history.txt", 0
    file_contents3 dw 512 dup(?)
    butes_read3 dw ?

    file_handle1 HANDLE ?
    filename1 db "E:\Restaurant-Mangament-System\bill.txt", 0
    file_contents1 db 256 dup(?)
    butes_read1 db ?

    file_handle2 HANDLE ?
    filename2 db "E:\Restaurant-Mangament-System\bill.txt", 0
    file_contents2 db 256 dup(?)
    butes_read2 db ?

    pprompt db 0dh, 0ah, "Enter the new price of the food item: ", 0
    nprompt db 0dh, 0ah, "Enter the new name of the food item: ", 0

    ; first page
    firstpage db 0dh, 0ah, "Welcome to Restaurant Mangement System"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "| 1. Restaurant Admin     |"
              db  0dh, 0ah, "| 2. Order Food           |"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "Enter Your Option(1-2) >", 0
    choosen   db 50 dup(?)

    re1 db 0dh, 0ah, "Redirecting to you to admin page ......", 0


    strin db " x", 0    
    endl db 0dh, 0ah, "+----------------------------+", 0
    neworder db 0dh, 0ah, "********************************************************", 0
    endb db "|", 0
    ; resmenu page
    resMenupg db 0dh, 0ah, "Welcome to Restaurant Admin"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "| 1. Order History        |"
              db  0dh, 0ah, "| 2. Change Food Item     |"
              db  0dh, 0ah, "| 3. Price Adjustment     |"
              db  0dh, 0ah, "| 4. Exit                 |"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "Enter Your Option(1-4) >", 0
    reschoosen   db 50 dup(?)

    ; OrderMenu page
    orderMenupg db 0dh, 0ah, "Welcome to ICD Restaurant"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "| 1. Starters             |"
              db  0dh, 0ah, "| 2. Main Course          |"
              db  0dh, 0ah, "| 3. Bread                |"
              db  0dh, 0ah, "| 4. Desert               |"
              db  0dh, 0ah, "| 5. Generate Bill        |"
              db  0dh, 0ah, "| 6. Exit                 |"
              db  0dh, 0ah, "+-------------------------+"
              db  0dh, 0ah, "Enter Your Option(1-6) >", 0
    ordchoosen   db 50 dup(?)

    ;starter menu
    starterpg   db  0dh, 0ah, "         Starters          "
              db  0dh, 0ah, "+ -------------------------+", 0
    f_starter1 db  0dh, 0ah, "|  Malai Chaap           |", 0
    f_starter2 db  0dh, 0ah, "|  Paneer Tikka          |", 0
    f_starter3 db  0dh, 0ah, "|  Chicken Tandoori      |", 0
    starer_menu db  0dh, 0ah, "+-------------------------+", 0
    choice_s          db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    stchoosen   db 50 dup(?)
    qunat_s          db  0dh, 0ah, "Enter Your Quantity >", 0
    stquant   db 50 dup(?)
    rupees db "Rs ", 0
    f_starter1p db "100", 0
    f_starter2p db "150", 0
    f_starter3p db "200", 0
    var_st1 db "2", 0
    var_st2 db "4", 0
    var_st3 db "6", 0
    
    

    ;main menu
    main_coursepg   db  0dh, 0ah, "       Main Cousre        "
               db  0dh, 0ah, "+-------------------------+", 0
    f_main1 db  0dh, 0ah,    "|  Dal Makhani           |", 0
    f_main2 db  0dh, 0ah,    "|  Paneer Tikka Masala   |", 0
    f_main3 db  0dh, 0ah,    "|  Butter Chicken        |", 0
    main_menu db  0dh, 0ah, "+-------------------------+", 0
    choice_m          db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    qunat_m          db  0dh, 0ah, "Enter Your Quantity >", 0
    mcquant   db 50 dup(?)
    f_main1p db "300", 0
    f_main2p db "350", 0
    f_main3p db "400", 0
    mcchoosen   db 50 dup(?)
    var_mc1 db "6", 0
    var_mc2 db "8", 0
    var_mc3 db "10", 0

    ;Bread menu
    breadpg    db  0dh, 0ah, "       Breads         "
               db  0dh, 0ah, "+-------------------------+", 0
    f_bread1 db  0dh, 0ah,   "|  Tandoori Butter Roti  |", 0
    f_bread2 db  0dh, 0ah,   "|  Butter Naan           |", 0
    f_bread3 db  0dh, 0ah,   "|  Tandoori Parantha     |", 0
    bread_menu db  0dh, 0ah, "+-------------------------+", 0
    choice_b          db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    qunat_b          db  0dh, 0ah, "Enter Your Quantity >", 0
    brquant   db 50 dup(?)
    f_bread1p db "50", 0
    f_bread2p db "100", 0
    f_bread3p db "150", 0
    brchoosen   db 50 dup(?)
    var_br1 db "1", 0
    var_br2 db "2", 0
    var_br3 db "3", 0



    desertpg    db  0dh, 0ah, "        Desert             "
               db  0dh, 0ah, "+-------------------------+", 0
    f_desert1 db  0dh, 0ah,  "|  Lassi                 |", 0
    f_desert2 db  0dh, 0ah,  "|  Choco Lava Cake       |", 0
    f_desert3 db  0dh, 0ah,  "|  Rasmalai(2pcs)        |", 0
    desert_menu db  0dh, 0ah, "+-------------------------+", 0
    choice_d          db  0dh, 0ah, "Enter Your Option(1-3) >", 0
    qunat_d          db  0dh, 0ah, "Enter Your Quantity >", 0
    dsquant   db 50 dup(?)
    f_desert1p db "50", 0
    f_desert2p db "100", 0
    f_desert3p db "150", 0
    dschoosen   db 50 dup(?)
    var_ds1 db "1", 0
    var_ds2 db "2", 0
    var_ds3 db "3", 0

    nextline db 0dh, 0ah, "+", 0

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
    eleven db "11", 0
    twelve db "12", 0
    

.code

start:
mov bx, 0
    
    create_file1:
        push 0
        push FILE_ATTRIBUTE_NORMAL
        push OPEN_EXISTING
        push 0
        push 0
        push FILE_SHARE_WRITE
        push offset filename1
        call CreateFileA
        mov file_handle1, eax

    set_file_pointer:
        push FILE_END
        push 0
        push 0
        push file_handle1
        call SetFilePointer
    
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
    
    push offset bill_write
    call lstrlen

    push 0
    push 0
    push eax
    push offset bill_write
    push file_handle1
    call WriteFile
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
    je change_name

    push offset reschoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je change_price

    push offset reschoosen
    push offset four
    call crt__stricmp
    cmp eax,0
    je exit_app

order_his:
    
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

    push offset stchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je st1

    push offset stchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je st2

    push offset stchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je st3

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

    push offset mcchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je mc1

    push offset mcchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je mc2

    push offset mcchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je mc3

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

    push offset brchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je br1

    push offset brchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je br2

    push offset brchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je br3

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

    push offset dschoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je ds1

    push offset dschoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je ds2

    push offset dschoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je ds3

    jmp ordMenu


bill_generation:
    push file_handle1
    call CloseHandle
    create_file2:
        push 0
        push FILE_ATTRIBUTE_NORMAL
        push OPEN_EXISTING
        push 0
        push 0
        push FILE_READ_DATA
        push offset filename2
        call CreateFileA
        mov file_handle2, eax
    read_file1:
        push 0
        push offset butes_read2
        push 256
        push offset file_contents2
        push file_handle2
        call ReadFile
    push offset file_contents2
    call StdOut
    

    create_file3:
        push 0
        push FILE_ATTRIBUTE_NORMAL
        push OPEN_EXISTING
        push 0
        push 0
        push FILE_SHARE_WRITE
        push offset filename3
        call CreateFileA
        mov file_handle3, eax

    set_file_pointer3:
        push FILE_BEGIN
        push 0
        push 0
        push file_handle3
        call SetFilePointer
    
    push offset file_contents2
    call lstrlen

    push 0 
    push 0
    push eax
    push offset file_contents2
    push file_handle3
    call WriteFile

    push offset neworder
    call lstrlen

    push 0 
    push 0
    push eax
    push offset neworder
    push file_handle3
    call WriteFile

    push offset nextline
    call StdOut
    invoke crt_printf, chr$("-------Total Price Rs %d.00-------+"), bx
    jmp exit_app

st1:
    
    
    write_txt_file:
        

        push offset f_starter1
        call lstrlen

        push 0 
        push 0
        push eax
        push offset f_starter1
        push file_handle1
        call WriteFile

        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile


        push offset stquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset stquant
        push file_handle1
        call WriteFile

        
        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile
        
        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

    

    push offset stquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set2

    push offset stquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set4

    push offset stquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set6

    push offset stquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set8

    push offset stquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set10
st2:
    write_txt_file2:
        

        push offset f_starter2
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_starter2
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset stquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset stquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

        

    push offset stquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set3

    push offset stquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set6

    push offset stquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set9

    push offset stquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set12

    push offset stquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set15
st3:
    write_txt_file3:
    
        

        push offset f_starter3
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_starter3
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset stquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset stquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

        
        
    push offset stquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set4

    push offset stquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set8

    push offset stquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set12

    push offset stquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set16

    push offset stquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set20

mc1:

        

        push offset f_main1
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_main1
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset mcquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset mcquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

    push offset mcquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set6

    push offset mcquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set12

    push offset mcquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set18

    
mc2:
    

        

        push offset f_main2
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_main2
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset mcquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset mcquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

    push offset mcquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set7

    push offset mcquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set14

    push offset mcquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set21
mc3:

        

        push offset f_main3
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_main3
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset mcquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset mcquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

        
        
    push offset mcquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set8

    push offset mcquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set16

    push offset mcquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set24

br1:

        

        push offset f_bread1
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_bread1
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset brquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset brquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

    push offset brquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set1

    push offset brquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set2

    push offset brquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set3

    push offset brquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set4

    push offset brquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set5

    push offset brquant
    push offset six
    call crt__stricmp
    cmp eax,0
    je set6

br2:

        

        push offset f_bread2
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_bread2
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset brquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset brquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

        
        
        push offset brquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set2

    push offset brquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set4

    push offset brquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set6

    push offset brquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set8

    push offset brquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set10

br3:

        

        push offset f_bread3
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_bread3
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset brquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset brquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile
        
        
         push offset brquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set3

    push offset brquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set6

    push offset brquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set9

    push offset brquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set12

    push offset brquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set15

ds1:

        

        push offset f_desert1
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_desert1
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset dsquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset dsquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

       
        
    push offset dsquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set1

    push offset dsquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set2

    push offset dsquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set3

    push offset dsquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set4

    push offset dsquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set5
ds2:

        

        push offset f_desert2
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_desert2
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset dsquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset dsquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

    push offset dsquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set2

    push offset dsquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set4

    push offset dsquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set6

    push offset dsquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set8

    push offset dsquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set10

ds3:

        

        push offset f_desert3
        call lstrlen

        push 0
        push 0
        push eax
        push offset f_desert3
        push file_handle1
        call WriteFile

        
        push offset strin
        call lstrlen

        push 0
        push 0
        push eax
        push offset strin
        push file_handle1
        call WriteFile

        push offset dsquant
        call lstrlen

        push 0
        push 0
        push eax
        push offset dsquant
        push file_handle1
        call WriteFile

        push offset endb
        call lstrlen

        push 0
        push 0
        push eax
        push offset endb
        push file_handle1
        call WriteFile

        push offset endl
        call lstrlen

        push 0
        push 0
        push eax
        push offset endl
        push file_handle1
        call WriteFile

        
        
    push offset dsquant
    push offset one
    call crt__stricmp
    cmp eax,0
    je set3

    push offset dsquant
    push offset two
    call crt__stricmp
    cmp eax,0
    je set9

    push offset dsquant
    push offset three
    call crt__stricmp
    cmp eax,0
    je set12

    push offset dsquant
    push offset four
    call crt__stricmp
    cmp eax,0
    je set15

    push offset dsquant
    push offset five
    call crt__stricmp
    cmp eax,0
    je set18

set1:
    mov cx, 50
    add bx, cx
    ;push offset nextline
    ;call StdOut
    ;invoke crt_printf, chr$("The price of this item will be Rs :%d"), bx
    jmp ordMenu


set2:
    mov cx, 50
    add bx, cx
    add bx, cx
    ;push offset nextline
    ;call StdOut
    ;invoke crt_printf, chr$("The price of this item will be Rs :%d"), bx
    jmp ordMenu
set3:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set4:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set5:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu

set6:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set7:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set8:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set9:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu

set10:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu

set11:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu

set12:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    mov bx, cx
    jmp ordMenu

set13:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set14:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set15:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set16:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set17:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set18:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set19:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set20:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set21:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set22:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set23:
   mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu
set24:
    mov cx, 50
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    add bx, cx
    jmp ordMenu

change_price:
    push offset orderMenupg
    call StdOut

    push 50
    push offset ordchoosen
    call StdIn

    push offset ordchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je p_st

    push offset ordchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je p_mc

    push offset ordchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je p_br

    push offset ordchoosen
    push offset four
    call crt__stricmp
    cmp eax,0
    je p_dt

    push offset ordchoosen
    push offset five
    call crt__stricmp
    cmp eax,0
    je exit_app

    push offset ordchoosen
    push offset six
    call crt__stricmp
    cmp eax,0
    je ordMenu

p_st:
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



    push offset stchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je pc_st1

    push offset stchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je pc_st2

    push offset stchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je pc_st3

    jmp start

pc_st1:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_starter1p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
pc_st2:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_starter2p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
pc_st3:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_starter3p      

    mov ecx, 50 
    rep movsb

    jmp resMenu

p_mc:

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


    push offset mcchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je pc_mc1

    push offset mcchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je pc_mc2

    push offset mcchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je pc_mc3

    jmp start

pc_mc1:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_main1p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
pc_mc2:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_main2p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
pc_mc3:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_main3p      

    mov ecx, 50 
    rep movsb

    jmp resMenu


p_br:
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

    push offset brchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je pc_br1

    push offset brchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je pc_br2

    push offset brchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je pc_br3

    jmp start

pc_br1:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_bread1p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
pc_br2:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_bread2p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
pc_br3:
     push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_bread3p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
p_dt:
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

    push offset dschoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je pc_ds1

    push offset dschoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je pc_ds2

    push offset dschoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je pc_ds3

    jmp start

pc_ds1:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_desert1p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
pc_ds2:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_desert2p      

    mov ecx, 50 
    rep movsb

    jmp resMenu
pc_ds3:
    push offset pprompt
    call StdOut

    push 50
    push offset newprice
    call StdIn

    mov esi, offset newprice  
    mov edi, offset f_desert3p      

    mov ecx, 50 
    rep movsb

    jmp resMenu

change_name:
    push offset orderMenupg
    call StdOut

    push 50
    push offset ordchoosen
    call StdIn

    push offset ordchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je n_st

    push offset ordchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je n_mc

    push offset ordchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je n_br

    push offset ordchoosen
    push offset four
    call crt__stricmp
    cmp eax,0
    je n_dt

    push offset ordchoosen
    push offset five
    call crt__stricmp
    cmp eax,0
    je exit_app

    push offset ordchoosen
    push offset six
    call crt__stricmp
    cmp eax,0
    je ordMenu
n_st:
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

    push offset stchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je nc_st1

    push offset stchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je nc_st2

    push offset stchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je nc_st3

    jmp start
nc_st1:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_starter1      

    mov ecx, 50 
    rep movsb

    jmp resMenu
nc_st2:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_starter2      

    mov ecx, 50 
    rep movsb

    jmp resMenu
nc_st3:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_starter3      

    mov ecx, 50 
    rep movsb

    jmp resMenu
n_mc:
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

    push offset mcchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je nc_mc1

    push offset mcchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je nc_mc2

    push offset mcchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je nc_mc3

    jmp start
nc_mc1:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_main1      

    mov ecx, 50 
    rep movsb

    jmp resMenu
nc_mc2:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_main2      

    mov ecx, 50 
    rep movsb

    jmp resMenu
nc_mc3:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_main3      

    mov ecx, 50 
    rep movsb

    jmp resMenu

n_br:
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

    push offset brchoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je nc_br1

    push offset brchoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je nc_br2

    push offset brchoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je nc_br3

    jmp start
nc_br1:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_bread1      

    mov ecx, 50 
    rep movsb

    jmp resMenu
nc_br2:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_bread2      

    mov ecx, 50 
    rep movsb

    jmp resMenu
nc_br3:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_bread3      

    mov ecx, 50 
    rep movsb

    jmp resMenu
n_dt:
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

    push offset dschoosen
    push offset one
    call crt__stricmp
    cmp eax,0
    je nc_ds1

    push offset dschoosen
    push offset two
    call crt__stricmp
    cmp eax,0
    je nc_ds2

    push offset dschoosen
    push offset three
    call crt__stricmp
    cmp eax,0
    je nc_ds3

    jmp start
nc_ds1:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_desert1      

    mov ecx, 50 
    rep movsb

    jmp resMenu
nc_ds2:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_desert2      

    mov ecx, 50 
    rep movsb

    jmp resMenu
nc_ds3:
    push offset nprompt
    call StdOut

    push 50
    push offset newname
    call StdIn

    mov esi, offset newname  
    mov edi, offset f_desert3      

    mov ecx, 50 
    rep movsb

    jmp resMenu
exit_app:

end start
