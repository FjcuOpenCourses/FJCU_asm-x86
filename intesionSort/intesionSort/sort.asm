.386
.model flat,stdcall
.stack 4096
includelib ucrt.lib
includelib legacy_stdio_definitions.lib

 .data
     
  .code
          i EQU SDWORD PTR [ EBP - 4 ]      ;create a space in stack queque for variable
	      j EQU SDWORD PTR [ EBP - 8 ]
	    key EQU SDWORD PTR [ EBP - 12 ]
	 arrayI EQU SDWORD PTR [ EBP - 16 ]
	 arrayJ EQU SDWORD PTR [ EBP - 20 ]
sort PROC
       mov i,1
       push ebp 
	   mov ebp,esp
	   mov esi,[ebp+12]      ;fisrt element of array
	   mov arrayI,esi        
	   mov eax,[ebp+8]       ;length of array
	   add arrayI,4
	   
sort1:
      cmp i,eax              ;compare the i with eax,i>=eax mean the array is
	  jge exitSort

	  mov esi,arrayI            
	  mov ebx,[esi]          ;key=array[i]
	  mov key,ebx

	  mov ebx,i       
	  dec ebx
	  mov j,ebx                ;j=i-1
	  mov ebx,arrayI
	  sub ebx,4
	  mov arrayJ,ebx

sort2:
      mov ebx,0
	  cmp j,ebx
	  JL endSort1
	  mov ebx,key               ;if(j>=0&&a[j]>key)
	  mov esi,arrayJ
	  cmp [esi],ebx
	  JLE endSort1

	  mov esi,arrayJ             ; array[j+1]=array[j]
	  mov ebx,[esi]              ;j=j-1
	  mov [esi+4],ebx
	  dec j
	  sub arrayJ,4
	  JMP sort2

endSort1:
      mov ebx,key              ;array[j+1]=key
      mov esi,arrayJ           
      mov [esi+4],ebx
      inc i
      add arrayI,4
      JMP sort1

exitSort:                      ;pop the element out of stack and back to the Source procedure
	mov esp,ebp
	pop ebp
	ret
    sort ENDP
    END
 
