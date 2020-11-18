.386
.model flat,stdcall
.stack 4096

includelib ucrt.lib
includelib legacy_stdio_definitions.lib
includelib irvine32.lib
includelib intersion.inc

    WriteInt PROTO
    WriteString PROTO
	 Crlf PROTO



  .data
  
  .code
  output PROC
  push ebp 
  mov ebp,esp
  mov esi,[ebp+16]           ;array element
  mov ebx,[ebp+12]           ;length of array
  mov edx,[ebp+8]            ;blank

checkOutput:
    cmp ebx,0                ;if ebx equals 0,mean the array element's already printed,jump to exitOutput to exit the procedure
	JE exitOutput
    mov eax,[esi]
    call WriteInt
	call WriteString
    add esi,4
    sub ebx,1
	JMP checkOutput

exitOutput:
    call Crlf
	mov esp,ebp
	pop ebp
	ret
   output ENDP
   END