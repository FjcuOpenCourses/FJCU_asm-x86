.386
.model flat,stdcall
.stack 4096
includelib legacy_stdio_definitions.lib
includelib ucrt.lib

printf PROTO C,                                           
 format: PTR BYTE, args: VARARG                         
scanf PROTO C,                                           
  format: PTR BYTE, args: VARARG  
ExitProcess proto STDCALL :SDWORD

.data 
                    count SDWORD ?
					average SDWORD ?
					remainder SDWORD ?
	         currentValue SDWORD ?
	                  SUM SDWORD ?
	            input BYTE "%ld",0                
              output BYTE  "%ld ",0
         BLANK BYTE " ",0dh,0ah,0
 .code
		 Source PROC

		 mov count,0
		 mov sum,0
ReadValue:
INVOKE scanf,ADDR input,ADDR currentValue  ;read the value and then check it with zero, if euqals then quit the program
cmp currentValue,0
JE Result

isOdd:                                      ;divide number with 2, check is the odd number
     mov eax,currentValue
     mov edx,0
     mov ecx,2
     div ecx
     cmp edx,0
     JE Next

Acummulate:                               ;if nummber is odd number, then add to sum and add ont with count
inc count
mov eax,currentValue
add sum,eax

Next:                                      ;next number
JMP ReadValue

 Result:
  INVOKE printf,ADDR output,count
  INVOKE printf,ADDR output,sum
   INVOKE printf,OFFSET BLANK
  mov eax,sum
  mov edx,0
  mov ecx,count
  div ecx
  mov average,eax
  mov remainder,edx
  INVOKE printf,ADDR output,average
  INVOKE printf,ADDR output,remainder

 exitCode:        
   ret                              ;return to main class
   Source ENDP
   END