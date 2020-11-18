.386
.model flat,stdcall
.stack 4096

includelib ucrt.lib
includelib legacy_stdio_definitions.lib
includelib irvine32.lib
includelib convertlibary.inc


ParseInteger32 PROTO


.data

.code
   change PROC
     push ebp 
	 mov ebp,esp

	 mov edx,[ebp+16]
	 mov ecx,[ebp+12] 
	 call ParseInteger32
     ;mov [ebp+8],eax
	 ;push eax

	mov esp,ebp
	pop ebp
	ret


   change ENDP
   END
