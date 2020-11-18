.386
.model flat,stdcall
.stack 4096
includelib legacy_stdio_definitions.lib
includelib ucrt.lib

printf PROTO C,                                           ; Std C library function
 format: PTR BYTE, args: VARARG                           ; (in libc.lib)
scanf PROTO C,                                            ; STd C library function
  format: PTR BYTE, args: VARARG  
ExitProcess proto STDCALL :SDWORD

 .data
                   LENG  SDWORD ?                         ;length of value
	        currentValue SDWORD ?                         ;current value of number
	     currentPosition SDWORD ?                         ;current position to check with leng
        	maximumValue SDWORD ?                         ;maximum
	maximumvaluePosition SDWORD ?                         ;maximum value
	            input BYTE  "%ld",0                
              output  BYTE  "%ld ",0
                BLANK BYTE  " ",0dh,0ah,0

 .code
 Source PROC
 inputLength:                                           ; input the length and check the length with 0, quit the program if it equals
   INVOKE scanf,ADDR input,ADDR  LENG
   CMP  LENG,0
   JL exitCode

readFirstValue:                                         ;read the first value and initial it to maximum value
     INVOKE scanf,ADDR input,ADDR currentValue
	 mov eax,currentValue
	 mov maximumValue,eax
	 mov eax,1
	 mov maximumvaluePosition,eax
	 mov currentPosition,eax
	 cmp  LENG,1
	 JE   result

start:                                                  ;read the the value from second number
	  INVOKE scanf,ADDR input,ADDR currentValue
	  INC currentPosition                               ; move current position to 1
	  mov ebx,currentValue                              ;compare current value with max value change the value and position if it larger
	  cmp ebx,maximumValue
	  JL Next

Change:                                                 ;change max value and max position   
      mov ebx,currentValue
	  mov maximumValue,ebx
	  mov ebx,currentPosition
	  mov maximumvaluePosition,ebx
Next:                                                  ;read next position
mov eax, LENG
cmp currentPosition,eax
JE result
JMP  start




result:                                                  ;print position and value of maimum number   
     INVOKE printf,ADDR output,maximumvaluePosition
     INVOKE printf,ADDR output,maximumValue    
     INVOKE printf,OFFSET BLANK
   JMP  inputLength





   exitCode:        
   ret                              ;return to main class
   Source ENDP
   END

