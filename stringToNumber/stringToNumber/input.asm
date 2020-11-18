.386
.model flat,stdcall
.stack 4096

includelib ucrt.lib
includelib legacy_stdio_definitions.lib
includelib irvine32.lib
includelib convertlibary.inc

ReadString PROTO


.data
    
.code

  input PROC
    push ebp 
	mov ebp,esp
	mov edx,[ebp+16]
	mov ecx,[ebp+12]
	call ReadString
	mov [ebp+8],eax

	mov esp,ebp
	pop ebp
	ret


 input ENDP
   END
