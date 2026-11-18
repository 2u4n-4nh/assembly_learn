
INCLUDE Irvine32.inc

.data
    mes1 byte "nhap chuoi: ",0
    mes2 byte "chuoi dao nguoc: ",0
    chuoi byte 101 dup(0)
    crev byte 101 dup(0)
    len dword ?
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

nhapchuoi proc
    push edx
    push ecx
    push eax
    mov ecx, 100
    mov edx, offset chuoi
    call readstring
    mov len, eax
    pop eax
    pop ecx
    pop edx
    ret
nhapchuoi endp

rev proc
    push esi
    push ecx
    push ebx
    push eax
    mov esi, offset chuoi
    mov ebx, offset crev
    mov ecx, len
    lap1:
        mov al, [esi + ecx - 1]
        mov [ebx], al
        inc ebx
        loop lap1
    pop eax
    pop ebx
    pop ecx
    pop esi
    ret
rev endp

increv proc
    push edx
    mov edx, offset crev
    call writestring
    pop edx
    ret
increv endp

main proc
    call inmes1
    call nhapchuoi
    call inmes2
    call rev
    call increv
    nop
    nop
    exit
main endp
end main
