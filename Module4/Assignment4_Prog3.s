#
#Programe name: Assignment4_Prog3.s
#Author: Kbrom Ghirmai
#Date: 2/12/2024
#Purpose: Put a users input name in a formatted string in  quotation marks
#

.text
.global main
main:
  #Push the stack record
  SUB sp, sp, #4
  STR lr, [sp, #0]
  
  #Print the prompt asking or users name
  LDR r0, =prompt1
  BL printf
  
  #Read the user's input name
  LDR r0, =format1
  LDR r1, =name1
  BL scanf

  #Print the output String
  LDR r0, =output1
  LDR r1, =name1
  BL printf

  #Pop the stack record
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "Hi, what is your name: "
  output1: .asciz "\"Hi %s it is nice to meet you\"\n"
  format1: .asciz "%s"
  name1:   .space 40
  
