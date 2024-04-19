.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\user32.inc
include \masm32\include\fileio.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\fileio.lib

.data
    filename    db "items.txt", 0
    buffer      db 256 dup(?)
    item1       db 256 dup(?)
    item2       db 256 dup(?)
    item3       db 256 dup(?)
    bytesRead   DWORD ?
    errorTitle  db "Error", 0
    fileErrorMsg db "Error opening file.", 0
    readErrorMsg db "Error reading file.", 0

.code
start:
    ; Open the file for reading
    invoke CreateFile, addr filename, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
    cmp eax, INVALID_HANDLE_VALUE
    je fileError

    ; Read from the file
    invoke ReadFile, eax, addr buffer, 256, addr bytesRead, NULL
    test eax, eax
    jz readError

    ; Parse the buffer to extract items
    mov edi, offset buffer
    mov esi, offset item1
    call extractItem

    ; Repeat the process for more items as needed

    ; Close the file
    invoke CloseHandle, eax

    ; Exit the program
    invoke ExitProcess, 0

fileError:
    ; Handle file opening error
    invoke MessageBox, NULL, addr fileErrorMsg, addr errorTitle, MB_ICONERROR + MB_OK
    jmp exitProgram

readError:
    ; Handle file reading error
    invoke MessageBox, NULL, addr readErrorMsg, addr errorTitle, MB_ICONERROR + MB_OK
    jmp exitProgram

extractItem proc
    ; Extract a string from the buffer and store it in the destination variable
    mov ecx, 256
    cld
    repne scasb
    mov edx, ecx
    sub edi, edx
    mov esi, offset item1
    mov ecx, edx
    rep movsb
    ret
extractItem endp

exitProgram:
    ; Clean up resources and exit the program
    invoke ExitProcess, 1

end start
