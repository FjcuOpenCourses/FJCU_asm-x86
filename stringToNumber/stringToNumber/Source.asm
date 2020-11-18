.386
.model flat,stdcall
.stack 4096

includelib ucrt.lib
includelib legacy_stdio_definitions.lib
includelib irvine32.lib
includelib convertlibary.inc
ExitProcess proto,dwExitCode:dword


input PROTO
output PROTO
input PROTO
change PROTO

.data
S          BYTE 1000 DUP (?)
COUNT SDWORD ?
NUMBER     SDWORD -10

.code
     Source PROC

inputValue:
	 push OFFSET S
	 push SIZEOF S
	 push COUNT
	 call input 
	 add esp,12

changeIntoNumber:
	 push OFFSET S
	 push SIZEOF S
	 push NUMBER
	 call change
	 add esp,12
	 ;pop eax
	 mov NUMBER,eax

outputValue:
	 push NUMBER
	 call output
	 add esp,4
	 
	;ret
	invoke ExitProcess,0
    Source ENDP
    END
