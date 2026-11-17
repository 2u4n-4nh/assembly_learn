```asm

INCLUDE Irvine32.inc

.data
    chuoi byte 101 dup(0)
    tim byte ?
    thay byte ?
    mes1 byte "nhap ki tu can tim:",0
    mes2 byte "nhap chuoi: ",0
    mes3 byte "nhap ki tu can thay:",0
    mes4 byte "chuoi cuoi la: ",0
    len dword ?
.code

nhapchuoi proc
    push eax
    push ecx
    mov edx, offset mes2
    call writestring
    mov edx, offset chuoi
    mov ecx, 100
    call readstring
    mov ecx, offset len
    mov [ecx], eax
    pop ecx
    pop eax
    ret
nhapchuoi endp

nhapkitucantim proc
    push eax
    push esi
    push edx
    mov edx, offset mes1
    call writestring
    mov esi, offset tim
    call readchar
    mov [esi], al
    call writechar
    call crlf
    pop edx
    pop esi
    pop eax
    ret
nhapkitucantim endp

nhapkituthaythe proc
    push eax
    push esi
    push edx
    mov edx, offset mes3
    call writestring
    mov esi, offset thay
    call readchar
    mov [esi], al
    call writechar
    call crlf
    pop edx
    pop esi
    pop eax
    ret
nhapkituthaythe endp

thaythekitu proc
    push eax
    push ebx
    push ecx
    push edx
    push esi
    mov eax, offset len
    mov ecx, [eax]
    jecxz ketthuc
    mov bl, tim
    mov esi, offset chuoi
    duyetchuoi:
        mov dl, [esi]
        cmp bl, dl
        je thaythe
        looptiep:
        inc esi
        loop duyetchuoi
    jmp ketthuc
    thaythe:
        mov dl, thay
        mov [esi], dl
        jmp looptiep
    ketthuc:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
thaythekitu endp

inrachuoi3 proc
    push edx
    mov edx, offset mes4
    call writestring
    pop edx
    ret
inrachuoi3 endp

chuoicuoi proc
    push edx
    mov edx, offset chuoi
    call writestring
    pop edx
    ret
chuoicuoi endp

main proc
    call nhapchuoi
    call nhapkitucantim
    call nhapkituthaythe
    call thaythekitu
    call inrachuoi3
    call chuoicuoi
    nop
    nop
    exit
main endp
end main

```
