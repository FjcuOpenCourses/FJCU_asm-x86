.386
.model flat, stdcall
.stack 4096
includelib irvine32.lib
includelib legacy_stdio_definitions.lib
computeGCD PROTO,divi:DWORD,divis:DWORD,re:DWORD
ReadInt PROTO
WriteInt PROTO
WriteString PROTO


.data
blank BYTE " ",0
blank1 BYTE " ",0dh,0ah,0
A SDWORD ?
B SDWORD ?
min SDWORD ?
max SDWORD ?
dividend SDWORD ?
divisor SDWORD ?
remainder SDWORD ?
LCM SDWORD ?

.code
Source PROC              

  inputData:
 call ReadInt             ;read A number,compare to 0,if greater,read B number
  mov A,eax
  mov ebx,A               ;f A less than 0 then end proc
  cmp ebx,0
  JL endProgram
  call ReadInt
  mov B,eax
    
mov eax,B                  ;compare A and B
cmp A,eax
JG change

change:              ;ifA>B
  mov eax,A                      
  mov max,eax        ;max=A
  mov eax,A
  mov LCM,eax        ;LCM=A
  mov eax,B
  mov min,eax        ;min=B
jmp compute

    mov eax,B       ;if B>A
    mov max,eax     ;max=B
    mov eax,B       
    mov LCM,eax     ;LCM=B	
    mov eax,A       ;min=A
    mov min,eax

 compute:		
	 mov eax,max
	 mov dividend,eax
	 mov ebx,min
	 mov divisor,ebx
	 INVOKE computeGCD,dividend,divisor,remainder
   	mov divisor,ebx
	  mov eax,divisor                   
	  call WriteInt                  
	  mov edx,OFFSET blank              
	  call WriteString			 

computeLCM:
L1:
				     mov edx,0                 ;ifLCM%min=0 then compute LCM%max else add 1 and repeat
				     mov eax,LCM
				     div min
					 cmp edx,0
					 JE L3
					 JMP L2
L2:
			        add LCM,1                 ;add LCM with 1
				    jmp L1
 L3:
				    mov edx,0                 ;if LCM%max=0 then print to the screen
				    mov eax,LCM
				    div max
				    cmp edx,0
                    JE L4        
			        jmp L2
             
  L4:
			     mov eax,LCM
				 call WriteInt
			   	mov edx,OFFSET blank1             
	            call WriteString
				 jmp inputData

				 endProgram:
				 ret
                 Source ENDP

 computeGCD PROC,divi:DWORD,divis:DWORD,re:DWORD            ;procedure of computeGCD
 start:
              mov edx,0
              mov eax,divi                                  ;if dividened 
              div divis
			  mov re,edx
			  cmp edx,0
			  JE  print                               
			  JMP back
 print:
	          mov ebx,divis
		      ret                                           ;jump to computeLCM to find the LCM
 back:
			  mov ebx,divis
			  mov divi,ebx
			  mov  ebx,re                   
			  mov divis,ebx
			  jmp start

			  computeGCD ENDP                ;end the procedure of computeGCD
			    
			  	end Source









     


