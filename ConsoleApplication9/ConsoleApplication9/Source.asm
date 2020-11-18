.386
.model flat,stdcall
.stack 4096

includelib ucrt.lib
includelib legacy_stdio_definitions.lib
isPrime PROTO,min:SDWORD,max:SDWORD
factor PROTO,dividend:SDWORD,divisor:SDWORD
printf PROTO C,
    format: PTR BYTE, args:VARARG
scanf PROTO C,
    format: PTR BYTE, args:VARARG

.data
 input BYTE "%d",0
 output BYTE "%d",0
 blank BYTE '^',0
  plus BYTE ' * ',0
 line BYTE " ",0dh,0ah,0
 number SDWORD ?
 exponent SDWORD ?
 count SDWORD ?
 

.code
     Source PROC  
readInput:
     INVOKE scanf,ADDR input,ADDR number
	 mov eax,2
	 mov count,eax
     cmp number,0
     JL Exit
     JMP isOne
 Exit :
     ret
  
  isOne:
	  cmp number,1                                      ;check number with one, if number euqal  to ne then start a newline
	  JE newLine
	  JMP L1
  
  newLine:                                                             ;start newline
	 INVOKE printf,ADDR line
	 JMP readInput
L1:	                                                                ;create a for loope from  from 2 to n to check is any factor n can div
         mov ebx,number
	     cmp count,ebx
	     JG  L3                                                         ;if edx equal 0, then invoke the funciton to find out exponent
	     mov edx,0
		 mov eax,number
		 div count
		 cmp edx,0
		 JE findFactor

L2:
		 inc count                                               ;add ont to countand continue the next loop
		 JMP L1
L3:
       cmp number,1                                              ;check is the number is one if there's any ex ponent left
	   JLE newline
	   INVOKE printf,ADDR output,number
	   JMP newline



findFactor:                                                      ;in the factor inoke the factor function, the output of that funciton is ecx, represented to number, ebx, represetned to ebx
	  INVOKE factor,number,count                    
	  mov exponent,ebx
	  mov number,ecx
       INVOKE printf,ADDR output,count
	  
	   cmp exponent,1                                        ;if the expoenent is 1, skipt the printf, turn back to L2	and go to next loop
	  JNE ex
	   JMP star
	   ex:
	    INVOKE printf,ADDR blank
	  INVOKE printf,ADDR output,exponent
	  star:
	   cmp number,1
	   JG starsign
	   JMP L2
starsign:
	  INVOKE printf,ADDR plus
	  JMP L2
	  Source ENDP



factor PROC,devidend:SDWORD,divisor:SDWORD
	      mov ebx,0
startFactor:   
          mov ecx,devidend
	      mov edx,0
		  mov eax,devidend
		  
		  div divisor
		  
		  cmp edx,0
		  JE contFactor
		  JMP outFactor
  outFactor:
           ret
 contFactor: 
           inc ebx
		   mov devidend,eax
		   JMP startFactor
		   factor ENDP

		  END Source

		 





	      


	  



	 

	  




   
   

