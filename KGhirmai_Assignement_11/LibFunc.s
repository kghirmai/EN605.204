#
#Program name: LibFunc.s
#Author: Kbrom Ghirmai
#Date: 04/07/2024
#Purpose: To be library of functions used to solve Module 11 Assignment
#Functions RecurMult,RecurFib
#

#Function Name:RecurMult
#Purpose:Calculate multiplication using successive addition with recursion
.global RecurMult
.text

RecurMult:

#Push stack
 SUB sp, sp, #4
 STR lr, [sp, #0]

#Move m to r3 and n to r4
 MOV r4, r0
 MOV r5, r1

#base case if either numbers are zero
 MOV r6,#0
 MOV r7,#0
 CMP r4,#0
 MOVEQ r6,#1
 CMP r5,#0
 MOVEQ r7,#1
 ORR r6,r6,r7
 CMP r6,#1
 MOVEQ r0,#0
 BEQ Return

#Base Case: if n is 1 return m
 CMP r5, #1
 BNE else
  MOV r0, r4
   B Return

#Else return m+Mult(m,n-1)
 else:
  SUB r1, r5, #1
  BL RecurMult
  ADD r0, r4, r0
   B Return 

#Pop stack and return 
 Return:
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
.data
#End of RecurMult

#Function Name: RecurFib
#Purpose: Calculate a fibonacci number recursively
.global RecurFib
.text

RecurFib:
#Push to stack
 SUB sp, sp, #12
 STR lr, [sp]
 STR r4, [sp, #4]
 STR r5, [sp, #8] 

#Move nth value safe register (r4) for function call
 MOV r4,r0

#Base Case:F(0)=0 for when n is 0
 CMP r4, #0
 BNE checkBs1
  MOV r0, #0
  B return

checkBs1:
#Base Case:F(1)=1 for when n is 1
 CMP r4, #1
 BNE Else
  MOV r0, #1
  B return

#Else F(n)=F(n-1)+F(n-2) when n is greater than 1
 Else:
  SUB r0, r4, #1
  BL RecurFib
  MOV r5, r0
  SUB r0, r4, #2
  BL RecurFib
  ADD r0, r0, r5
  B return

#Pop Stack
 return:
 LDR lr, [sp]
 LDR r4, [sp, #4]
 LDR r5, [sp, #8]
 ADD sp, sp, #12
 MOV pc, lr

.data
#End of RecurFib
