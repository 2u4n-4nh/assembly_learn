```

INCLUDE Irvine32.inc

.data
    mes1 byte "nhap chuoi cua ban: ",0
    mes2 byte "nhap ki tu ma ban muon dem: ",0
    mes3 byte "so lan ki tu ",0
    mes4 byte "trong chuoi ",0
    mes5 byte " la: ",0
    chuoi byte 101 dup(0)
    len dword ?
    kitu byte ?
    lan dword ?
.code

inchuoimodau proc
    push edx
    mov edx, offset mes1
    call writestring
    pop edx
    ret
inchuoimodau endp

nhapchuoi proc
    push ecx
    push esi
    push eax
    push ebx
    mov ebx, offset len
    mov edx, offset chuoi
    mov ecx, 100
    call readstring
    mov [ebx], eax
    pop ebx
    pop eax
    pop esi
    pop ecx
    ret
nhapchuoi endp

nhapkitu proc
    push edx
    push eax
    mov edx, offset kitu
    call readchar
    mov [edx], al
    call writechar
    call crlf
    pop eax
    pop edx
    ret
nhapkitu endp

inchuoiyeucau proc
    push edx
    mov edx, offset mes2
    call writestring
    pop edx
    ret
inchuoiyeucau endp

chuoiin3 proc
    push edx
    mov edx, offset mes3
    call writestring
    pop edx
    ret
chuoiin3 endp

chuoiin4 proc
    push edx
    mov edx, offset mes4
    call writestring
    pop edx
    ret
chuoiin4 endp

chuoiin5 proc
    push edx
    mov edx, offset mes5
    call writestring
    pop edx
    ret
chuoiin5 endp

solan proc
    push eax
    push ebx
    push ecx
    push edx
    push esi
    mov al, kitu
    mov esi, offset chuoi
    xor ebx, ebx
    mov ecx, len
    jecxz ketthuc
    duyet:
        mov dl, [esi]
        cmp dl, al
        je tang
        lap:
        inc esi
        loop duyet
    jmp ketthuc
    tang:
        inc ebx
        jmp lap
    ketthuc:
        mov ecx, offset lan
        mov [ecx], ebx
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop eax
        ret
solan endp

inchar proc
    push eax
    mov al, kitu
    call writechar
    pop eax
    ret
inchar endp

instring proc
    push edx
    mov edx, offset chuoi
    call writestring
    pop edx
    ret
instring endp

inint proc
    push eax
    push edx
    mov edx, offset lan
    mov eax, [edx]
    call writeint
    pop edx
    pop eax
    ret
inint endp

main proc
    call inchuoimodau
    call nhapchuoi
    call inchuoiyeucau
    call nhapkitu
    call chuoiin3
    call inchar
    call chuoiin4
    call instring
    call chuoiin5
    call solan
    call inint
    nop
    nop
    exit
main endp
end main

```
