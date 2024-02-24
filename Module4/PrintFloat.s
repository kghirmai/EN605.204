.text
.global main
main:
  #Push the stack record
  SUB sp, sp, #8
  STR lr, [sp, #0]

  #Prompt the user to enter a decimal
  LDR r0, =prompt1
  BL printf
  
  #Read the input decimal value
  LDR r0, =format1
  LDR r1, =float1
  BL scanf

  #Print the user input float value
  LDR r0, =output1
  LDR r1, =float1
  VLDR s0, [r1,#0]
  
  VCVT.F64.F32 D0,S0
  
  MOV r0, r1
  BL printf  

  #Pop the stack record
  LDR lr, [sp, #0]
  ADD sp, sp, #8
  MOV pc, lr

.data
  prompt1: .asciz "Enter a decimal value: "
  format1: .asciz "%f"
  float1:  .float 0.0
  output1: .asciz "You entered the number: %f\n"


