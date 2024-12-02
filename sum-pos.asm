include irvine32.inc
.data
array SWORD 10,-4,-3-,19,-7,9,-54
sum dword 0
count dword 0
msgSum BYTE "The sum of positive numbers is: ", 0
msgCount BYTE "The total no of positive numbers is: ", 0
.code
main proc
    mov esi, OFFSET array
    mov ecx, LENGTHOF array

next:
    movsx eax, WORD PTR [esi]
    cmp eax, 0
    ; check if the number is less than or equal to 0 if then skip to the next element
    jle skip
   ; Add the positive number to the sum
    add [sum], eax
    inc [count]

skip:
    add esi, TYPE array
    loopnz next

    mov edx, OFFSET msgSum
    call writestring
   ; Display the sum 
    mov eax, [sum]
    call WriteInt
    call crlf

    mov edx, OFFSET msgCount
    call writestring
  ; Display the numbers of element
    mov eax, [count]
    call writedec
    call crlf

    exit
main endp
end main