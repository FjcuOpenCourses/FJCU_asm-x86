.386
.model flat,stdcall
.stack 4096

includelib ucrt.lib
includelib legacy_stdio_definitions.lib
includelib irvine32.lib
includelib convertlibary.inc


WriteDec   PROTO
WriteInt   PROTO

.data

.code
  output PROC
     push ebp 
	 mov ebp,esp
	 mov eax,[ebp+8]
     cmp eax,0
	 JL Nega
	 call WriteDec
	 JMP exit
    Nega:
    call WriteInt

exit:
	mov esp,ebp
	pop ebp
	ret

  output ENDP
   END
