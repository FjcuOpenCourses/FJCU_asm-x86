.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
includelib ucrt.lib
includelib legacy_stdio_definitions.lib
includelib irvine32.lib
includelib intersion.inc
scanf PROTO C,
    format: PTR BYTE, args:VARARG
    input PROTO
	 sort PROTO
	 output PROTO

.data
   inVal BYTE "%ld",0   
   count SDWORD 1000
   array SDWORD 1000 DUP(?)
   blank BYTE " ",0       

.code
  Source PROC
readCount:
  INVOKE scanf,ADDR inVal,ADDR count         ;read count value of the array,count value represented the length of array
  cmp count,1                                ; if the count below 1 that's mean the array is emtied,go to exit directly
  JL  exit

 push OFFSET array                           ;push the array into stack and the position is [epb+12]
 push count                                  ;push count value into stack with the position is [ebp+8]
 call input                                  ; call input procedure to read element of array
 add esp, 8                                  ;when returning to the Soureprocedure,keep 2 position of count and array

 mov esi, 0                                  ;set the element of array into 0

 push OFFSET array                           ;push array
 push count                                  ;push count value
  call sort                                  ;call sort procedure to sort the array
  add esp,8                                  ;after calling, keep 2 position of array, count value by adding esp with 8

  MOV ESI, 0                                 ;set the element of array into 0

 push OFFSET array                           ;push array 
 push count                                  ; push count value
 push OFFSET blank                           ;push bank value to print the space between 2 array's element 
 call output                                 ;call the output procedure to print the value of array into the screen

 add esp,12                                  ;keep 3 position
  
 JMP readCount                               ;turn back to readCount to begin a new array

exit:
invoke ExitProcess,0
Source ENDP
  END 
   