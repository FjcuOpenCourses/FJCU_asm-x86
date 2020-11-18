.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:DWORD

includelib ucrt.lib
includelib legacy_stdio_definitions.lib
printf PROTO C,                                           ; Std C library function
         format: PTR BYTE, args: VARARG                   ; (in libc.lib)

scanf PROTO C,                                            ; STd C library function
         format: PTR BYTE, args: VARARG                   ; (in libc.lib) 
isPrime PROTO C,
n:DWORD

.data
  a BYTE "%d",0                    ;type of variable
  b BYTE "%d",0dh,0ah,0
  n DWORD ?
  m DWORD ?
  k DWORD ?

  .code
asmMain PROC C

 INVOKE scanf,ADDR a,ADDR n              ;read the input data
 INVOKE scanf,ADDR a,ADDR m              ;read the input data
 INVOKE scanf,ADDR a,ADDR k              ;read the input data
 

 L1:    
  INVOKE isPrime,n                      ;call the isPrime() int main.cpp to check the data
  CMP Eax,1                             ;compare with 1, if true ,print the reuslt, else 
  JE L2
  JMP L3

  L2:
  INVOKE printf,ADDR b,n              ;print function
  L3:
     INC n  
	 mov ebx,b
  CMP Ebx,m
  JG L1

   call Crlf
   ret                        ;return to main class
asmMain ENDP

   END