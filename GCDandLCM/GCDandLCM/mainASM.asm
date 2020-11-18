.386
.model flat, stdcall
.stack 4096


includelib ucrt.lib
includelib legacy_stdio_definitions.lib
printf PROTO C,                                           ; Std C library function
         format: PTR BYTE, args: VARARG                   ; (in libc.lib)

scanf PROTO C,                                            ; STd C library function
         format: PTR BYTE, args: VARARG                   ; (in libc.lib) 
       .data	   
  m BYTE "%ld",0                                           ;type of variable
  n BYTE "%ld",0dh,0ah,0
  a SDWORD ?  
  b SDWORD ? 
  min SDWORD ? 
  max SDWORD ? 
  GCD SDWORD ?
  LCM SDWORD ?
  diver SDWORD ?
 .code
  mainASM PROC C
    INVOKE scanf,ADDR m,ADDR a
    INVOKE scanf,ADDR m,ADDR b
	  mov eax,a
	  CMP b,eax	    
	   JG minMax
	   minMax:
	        mov eax,b   ;b>a
			mov max,eax
			mov LCM,eax
			mov eax,a
			mov min,eax
			mov GCD,eax
		    JMP computeGCD
     mov eax,a   ;b<a
	 mov max,eax
	 mov LCM,eax
	 mov eax,b
	 mov min,eax
	 mov GCD,eax
	
	          computeGCD:
			     mov edx,0
				 mov eax,max
				 div  GCD
				 mov diver,edx
				 cmp edx,0			
				 JE printGCD
		 printGCD:
		     INVOKE printf,ADDR n,GCD
			 JMP  computeLCM
			     mov ebx,diver
				 mov min,ebx
				 mov ebx,min
				 mov max,ebx
				 JMP computeGCD
		  computeLCM:
		         mov edx,0
				 mov eax,LCM
				 div  min
				 cmp edx,0
				 JE printLCM
		 printLCM:
		      INVOKE printf,ADDR n,LCM
			   JMP exit

			     INC LCM
				 JMP computeLCM
		 exit :
		  
			  mainASM ENDP
			  END 


		         
				 

		         

				    
			    
			     
			     
				
			      
			    
		         

	  


