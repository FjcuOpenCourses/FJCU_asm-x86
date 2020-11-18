.386
.model flat, stdcall
.stack 4096

includelib irvine32.lib
includelib legacy_stdio_definitions.lib
includelib ucrt.lib

printf PROTO C,                                           ; Std C library function
 format: PTR BYTE, args: VARARG                           ; (in libc.lib)
scanf PROTO C,                                            ; STd C library function
  format: PTR BYTE, args: VARARG  
ExitProcess proto STDCALL :SDWORD

.data
Dimension REAL8 3 DUP (?)
          A REAL8 ?
          B REAL8 ?
      COUNT SDWORD ?
      input BYTE "%ld",0                    ;type of variable
     output BYTE "%ld ",0
      BLANK BYTE " ",0dh,0ah,0

.code

Source PROC
MOV EAX,6
MOV COUNT,EAX

inputValue:
CMP EAX,0
JE  sourceExit
  INVOKE scanf,ADDR input,ADDR A
  INVOKE scanf,ADDR input,ADDR B

  mov ebp,OFFSET Dimension
  mov EAX,A
  ADD EAX,B
  mov [ebp],EAX
  ADD EBP,4
  DEC COUNT
  JMP inputValue






sourceExit:
  ret
  Source ENDP
  END
