include irvine32.inc
.data
array SWORD 10,22,33,40,55
sum dword 0
count dword 0

msgSum BYTE "The sum of odd numbers is: ", 0
msgCount BYTE "The total no of odd numbers is: ", 0

.code
main proc
    mov esi, OFFSET array
    mov ecx, LENGTHOF array

next:
   ; Test the least significant bit of the number to check if it's odd
    test WORD PTR [esi], 1
    jz skip

    movsx eax, WORD PTR [esi]
    ; Add the even number to the sum
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
   ; Display the numbers
    mov eax, [count]
    call writedec
    call crlf

    exit
main endp
end main