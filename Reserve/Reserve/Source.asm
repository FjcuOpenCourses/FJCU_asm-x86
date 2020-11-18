.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
includelib ucrt.lib
includelib legacy_stdio_definitions.lib
includelib irvine32.lib

WriteString PROTO
WriteInt PROTO
ReadString PROTO
WriteString PROTO
ParseInteger32 PROTO
WriteDec PROTO
.data
S BYTE 1000 DUP(0)
NUM SDWORD ?
counter SDWORD ?
.code
Source PROC

mov edx,OFFSET S
mov ecx,SIZEOF S
call readString
;mov S,edx
mov edx,OFFSET S
mov counter,eax
mov ecx,counter

call ParseInteger32
mov NUM,eax
mov eax,NUM
call WriteInt
ret


 Source ENDP
END


