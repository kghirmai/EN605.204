#
#Program Name: RecurFib.s
#Author:Kbrom Ghirmai
#Date: 04/07/2024
#Purpose: Implement recurFib function that caluclates a fibonacci number using recursion
#

.text
.global main
main:
 
 #Push to stack record
  SUB sp, sp, #4
  STR lr, [sp, #0]
 
 #Prompt for nth value for fibonacci function
  LDR r0, =prompt1
  BL printf

  #Read and store feet input
  LDR r0, =format1
  LDR r1, =Input1
  BL scanf

  #Move input nth value into r0 for recurFib function
  LDR r0,=Input1
  LDR r0,[r0]

  #Implement recursive fib function and output result
  BL RecurFib
  MOV r1,r0
  LDR r0, =output1
  BL printf

  #Pop from stack record
  LDR lr, [sp, #0]
  ADD sp,sp,#4
  MOV pc,lr

.data
 prompt1: .asciz "Enter a value (n) greater than 0 to calculate the fibonacci number F(n) at the value: "
 format1: .asciz "%d"
 Input1:  .word 0
 output1: .asciz "The fibonacci number at your corresponding nth value is: %d\n"
