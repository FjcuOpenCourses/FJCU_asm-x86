.386
.model flat,stdcall
.stack 4096
includelib legacy_stdio_definitions.lib
includelib ucrt.lib

isDivided PROTO C,
x:DWORD ,y:DWORD
printf PROTO C,                                           ; Std C library function
 format: PTR BYTE, args: VARARG                           ; (in libc.lib)
scanf PROTO C,                                            ; STd C library function
  format: PTR BYTE, args: VARARG  
ExitProcess proto STDCALL :SDWORD


.data

     input BYTE "%d",0                    ;type of variable
     output BYTE "%d ",0
BLANK BYTE " ",0dh,0ah,0
          M SDWORD ?
	      N SDWORD ?
	      K SDWORD ?
	      T SDWORD ?
	   MIN  SDWORD ?
	   MAX  SDWORD ?
	  COUNT SDWORD ?
	  SUM   SDWORD ?
	   LINE SDWORD ?

  .code

    Source PROC C

  INVOKE scanf,ADDR input,ADDR M
  INVOKE scanf,ADDR input,ADDR N
  INVOKE scanf,ADDR input,ADDR K
  INVOKE scanf,ADDR input,ADDR T
   mov ecx,0
   mov Line,ecx
   mov eax,M
   cmp eax,N      ;compare M with N to find the min and max number
   JL  smaller

   mov eax,M     ;M>N   
   mov MAX,eax
   mov eax,N
   mov MIN,eax
   jmp Start 
 smaller:
   mov eax,N     ;M<N
   mov MAX,eax
   mov eax,M
   mov MIN,eax



Start:
      mov ebx,MAX                        ;compare MIN with MAX if equals then quit the program
      cmp   MIN,ebx 
	  JG    exitCode

    INVOKE isDivided,MIN,K               ;check is Min can divide with k
      CMP Eax,1                          ;if Min can't divide then print it.
      JE Print
      JMP Next

Print:
  MOV EAX,MIN                           
  ADD SUM,EAX                  
  INVOKE printf,ADDR output,MIN          ;print function
  INC COUNT                              ;check count with T,if count equals T, mean have to pint a new line
  INC LINE
  mov ecx,LINE
  mov ebx,T
  cmp ecx,ebx
  JNE Next

  NewLine:                              ;
  INVOKE printf,OFFSET BLANK
  mov ecx,0
  mov LINE,ecx
     


Next:
     INC MIN
     JMP Start                        ;retiepition

  
  exitCode:
  INVOKE printf,OFFSET BLANK
   INVOKE printf,ADDR output,COUNT     
   INVOKE printf,ADDR output,SUM        
   ret                              ;return to main class
   Source ENDP
   END