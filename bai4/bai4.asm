
INCLUDE Irvine32.inc

.data
    mes1 byte "nhap chuoi dau vao: ",0
    mes2 byte "nhap key ma hoa: ",0
    mes3 byte "day la chuoi ma hoa: ",0
    mes4 byte "day la chuoi sau giai ma: ",0
    chuoi byte 101 dup(0)
    key byte ?
    len1 dword ?
.code

inmes1 proc
    push edx
    mov edx, offset mes1
    call writestring
    pop edx
    ret
inmes1 endp

inmes2 proc
    push edx
    mov edx, offset mes2
    call writestring
    pop edx
    ret
inmes2 endp

inmes3 proc
    push edx
    mov edx, offset mes3
    call writestring
    pop edx
    ret
inmes3 endp

inmes4 proc
    push edx
    mov edx, offset mes4
    call writestring
    pop edx
    ret
inmes4 endp

nhapchuoidauvao proc
    push eax
    push edx
    push ecx
    push esi
    mov edx, offset chuoi
    mov ecx, 100
    mov esi, offset len1
    call readstring
    mov len1, eax
    pop esi
    pop ecx
    pop edx
    pop eax
    ret
nhapchuoidauvao endp

keygen proc
    push eax
    push edx
    mov edx, offset key
    call readchar
    call writechar
    mov [edx], al
    call crlf
    pop edx
    pop eax
    ret
keygen endp

xormahoa proc
    push edx
    push ecx
    push esi
    push eax
    push ebx
    mov edx, offset chuoi
    mov ecx, len1
    mov bl, key
    l1:
        xor byte ptr [edx], bl
        inc edx
        loop l1
    pop ebx
    pop eax
    pop esi
    pop ecx
    pop edx
    ret
xormahoa endp

inchuoi2 proc
    push edx
    mov edx, offset chuoi
    call writestring
    call crlf
    pop edx
    ret
inchuoi2 endp

inchuoi1 proc
    push eax
    push ebx
    push ecx
    push esi
    mov esi, offset chuoi
    mov ecx, len1
    l2:
        movzx eax, byte ptr [esi]
        mov ebx, TYPE BYTE
        call WriteHexB
        mov al, ' '
        call WriteChar
        inc esi
        loop l2
    call crlf
    pop esi
    pop ecx
    pop ebx
    pop eax
    ret
inchuoi1 endp

main proc
    call inmes1
    call nhapchuoidauvao
    call inmes2
    call keygen
    call xormahoa
    call Crlf       
    call inmes3
    call inchuoi1
    call xormahoa
    call inmes4
    call inchuoi2
    nop
    nop
    exit
main endp
end main
