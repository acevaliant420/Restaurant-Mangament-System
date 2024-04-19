TITLE ICD Restaurant

.MODEL SMALL
.STACK 
.DATA
	newLine 	DW 0d0aH, "$"
	divisor 	DB 10
	quotient 	DB 0
	remainder 	DB 0

    ;---res menu
    StaffMenu	DB 13, 10, "  ==================================================== ", 13, 10
			DB " [_________________Restaurant Administration_______________]", 13, 10
			DB " [                                                    ]", 13, 10
			DB " [  1.Order History                                   ]", 13, 10
			DB " [  2.Restocking                                      ]", 13, 10
			DB " [  3.Price Adjustment                                ]", 13, 10
			DB " [  4.Exit                                            ]", 13, 10
			DB "  ==================================================== ", 13, 10, "$"

	CustomerMenu	DB 13, 10, "  ==================================================== ", 13, 10
			DB " [___________________ICD Restarurant__________________]", 13, 10
			DB " [                                                    ]", 13, 10
			DB " [  1.Order Food & Beverages                          ]", 13, 10
			DB " [  2.View Restaurant Owners                          ]", 13, 10
			DB " [  3.Exit                                            ]", 13, 10
			DB "  ==================================================== ", 13, 10, "$"
	staffPrompt	DB 13, 10, "Enter Your Option(1-4) > $"
	customerPrompt	DB 13, 10, "Enter Your Option(1-3) > $"



    failmsg            DB  0dh, 0ah, "Please enter [1-4]! Press any to continue$"
    nextline            DB  0dh, 0ah, "$"
         ;---main page
    firstPage          DB  0dh, 0ah,"Welcome to ICD Restaurant!"
                            DB  0dh, 0ah, "+-------------------------+"
                            DB  0dh, 0ah, "| 1. Restaurant Admin     |"
                            DB  0dh, 0ah, "| 2. Order Food           |"
                            DB  0dh, 0ah, "| 3. Exit                 |"
                            DB  0dh, 0ah, "+-------------------------+"
                            DB  0dh, 0ah, "Enter Your Option(1-3) > $"
    choosen            DB  ?

    ;--- data for order menu
	order		DB " .__________________.", 0dH, 0aH
			DB " |___ORDER OPTION___|", 0dH, 0aH
			DB " |  1. Dine In      |", 0dH, 0aH
			DB " |  2. Back to Menu |", 0dH, 0aH
			DB " '------------------'", "$"
	ostate		DB "Enter order option : $"
	onum		DB ?
	eromsgo		DB "Please enter input from 1 to 2 only!! $"
	conf		DB "Do you want to confirm(Y=yes|N=no)? ", "$"
	eromsgconf	DB "Please enter Y or N only!!$"

.CODE
MAIN PROC
	mov ax,@data
	mov ds, ax
 	MOV AH, 0    ; set video mode   
        MOV AL, 2    ; set row cols 80 x 26
        INT 10H
mainPage:

	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

      mov ah, 09h
      lea dx, firstPage
      int 21h

      mov ah, 01h
      int 21h
      mov choosen, al

	mov ah, 09h
	lea dx, nextline
	int 21h

	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je continue1
	cmp al, "y"
	je continue1
	cmp al, "N"
	je mainPage
	cmp al, "n"
	je mainPage
	jne wrongchar

continue1:
      ;CMP choosen, "1"
      ;JE lgnPage
      ;CMP choosen, "2"
      ;JE registerPage1
      ;CMP choosen, "3"
      ;JE exit1
      ;JNE wrongNum

wrongchar:
      mov ah, 09h
      lea dx, nextline
      int 21h

      mov ah, 09h
      lea dx, eromsgconf
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov ah, 01h
      int 21h

      jmp mainPage