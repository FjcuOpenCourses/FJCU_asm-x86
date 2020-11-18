.386
.model flat,stdcall
.stack 4096

includelib ucrt.lib
includelib legacy_stdio_definitions.lib
scanf PROTO C,
   format: PTR BYTE, args:VARARG

  .data 
   inVal BYTE "%ld",0

  .code
    input PROC
    push ebp 
	mov ebp,esp
	mov esi,[ebp+12]                      ;move the first element of array into esi
	mov eax,[ebp+8]                       ; move length into  eax
	 
check:                                    ;set check loop, loop counter of check is eax
	cmp eax,0                             ;compare the eax to 0, if equal mean the element has already been readed ,so jump to the exitInput theend the procedure
	je exitInput                          ; jump to exitInput if equal
	push eax                              ;push the eax value because the scanf maybe impact to the eax
	INVOKE scanf,ADDR inVal,ADDR[esi]     ;read the value to the array
	pop eax                               ;pop eax
	sub eax,1                             ;add array to 1, next element
	add esi,4                             ;add esi to 4, next element
	jmp check                             ;jump to check

exitInput:                                ;pop the element and end the procedure
	mov esp,ebp
	pop ebp
	ret
   input ENDP
   END
 
