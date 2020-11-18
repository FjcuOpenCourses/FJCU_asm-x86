.386
.model flat,stdcall
.stack 4096

includelib irvine32.lib
includelib legacy_stdio_definitions.lib
includelib ucrt.lib

computeArea PROTO,s:REAL8,m:REAL8,n:REAL8,k:REAL8

     printf PROTO C,                                           ; Std C library function
         format: PTR BYTE, args: VARARG                   ; (in libc.lib)
      scanf PROTO C,                                            ; STd C library function
         format: PTR BYTE, args: VARARG  

Point2D STRUCT
      x REAL8 ?
      y REAL8 ?
Point2D ENDS

Triangle STRUCT
      dimension1 REAL8  ?
      dimension2 REAL8  ?
      dimension3 REAL8  ?
      area       REAL8  ?
Triangle ENDS

		 .data
		 Point1 Point2D <0.0,0.0>
		 Point2 Point2D <0.0,0.0>
	     Point3 Point2D <0.0,0.0>
		 Trial Triangle <0.0,0.0,0.0,0.0>
		
         input  BYTE "%lf%lf%lf%lf%lf%lf",0                                 ;type of variable
         output BYTE "%.3f",0dh,0ah,0
	     xC REAL8 ?
	     yC REAL8 ?
        two REAL8 2.0
	    ans REAL8 ?

	  .code
Source PROC
readValue:
INVOKE scanf,ADDR input,ADDR Point1.x,ADDR Point1.y,ADDR Point2.x,ADDR Point2.y,ADDR Point3.x,ADDR Point3.y
computeDimension1:
              FLD Point1.x
              FLD Point2.x
              FSUB 
              FSTP xC

              FLD Point1.y
              FLD Point2.y
              FSUB 
              FSTP yC

              FLD xC
              FLD xC
              FMUL 
              FSTP xC

              FLD yC
              FLD yC
              FMUL 
              FSTP yC

              FLD xC
              FLD yC
              FADD 
              FSTP     Trial.dimension1

              FLD      Trial.dimension1
              FSQRT
              FSTP     Trial.dimension1

computeDimension2:
              FLD Point2.x
              FLD Point3.x
              FSUB 
              FSTP xC

              FLD Point2.y
              FLD Point3.y
              FSUB 
              FSTP yC

              FLD xC
              FLD xC
              FMUL 
              FSTP xC

              FLD yC
              FLD yC
              FMUL 
              FSTP yC

              FLD xC
              FLD yC
              FADD 
              FSTP      Trial.dimension2
              FLD       Trial.dimension2
              FSQRT
              FSTP      Trial.dimension2

computeDimension3:
              FLD Point3.x
              FLD Point1.x
              FSUB 
              FSTP xC

              FLD Point3.y
              FLD Point1.y
              FSUB 
              FSTP yC

              FLD xC
              FLD xC
              FMUL 
              FSTP xC

              FLD yC
              FLD yC
              FMUL 
              FSTP yC

              FLD xC
              FLD yC
              FADD 
              FSTP    Trial.dimension3
              FLD     Trial.dimension3
              FSQRT
              FSTP    Trial.dimension3

              FLD     Trial.dimension1
              FLD     Trial.dimension2
              FADD
              FLD Trial.dimension3
              FADD
              FDIV two
              FSTP Trial.area

	          INVOKE computeArea,Trial.area,Trial.dimension1,Trial.dimension2,Trial.dimension3
			  FSTP ans
			  INVOKE printf,ADDR output,ans
	          JMP    readValue


              exit:
              Source ENDP

computeArea PROC,s:REAL8,m:REAL8,n:REAL8,k:REAL8
              FLD s
              FLD m
              FSUB 
              FSTP m

              FLD s
              FLD n
              FSUB
              FSTP n

             FLD s
             FLD k
             FSUB
             FSTP k

             FLD s
             FLD m
             FMUL
             FLD n
             FMUL
             FLD k
             FMUL
             FSQRT
            
            RET
           computeArea ENDP  

            END




   



 
