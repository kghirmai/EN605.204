#
#Program Name: isPrime.s
#Author: Kbrom Ghirmai
#Date: 3/28/2024
#Purpose: Determine if a user input number is prime or not and display the result
#

.text
.global main

#
#Register Dictionary
#r4-Input value that will be tested to see if it's a prime number
#r5-Loop Limit for inner check prime loop
#r6-Loop counter for check prime loop
#r7- current divisor value for checking if prime
#r8-boolean for result of check prime
#

main:

 #Push to OS stack
 SUB sp, sp, #4
 STR lr, [sp, #0]

 #Sentinel Loop
 #Prompt user to input a value to begin or quit the program
#Start the loop using input value
StartLoop:
   LDR r0,=prompt1
   BL printf
   LDR r0,=format
   LDR r1,=num1
   BL scanf
   
   #Put user input decision in r1
   LDR r1,=num1
   LDR r1,[r1]
   #Quit program if -1 is input
   CMP r1,#-1
   BEQ EndLoop
     
     #Get user to input number to check if they didn't input -1
     LDR r0,=prompt2
     BL printf
     LDR r0,=format
     LDR r1,=num1
     BL scanf
     LDR r4,=num1
     LDr r4,[r4]
     B CheckError
 
  CheckError:
  CMP r4,#2
  BLE ErrMsg  
   B CheckPrime

  ErrMsg:
   #Print error message 
    LDR r0,=ErrorMsg
    BL printf
    B StartLoop
 
  CheckPrime:
    
     #get number of iterations loop must run through (n/2 - 2)
     MOV r0, r4
     MOV r1, #2
     BL __aeabi_idiv
     SUB r0, r0, #2
     
     MOV r5, r0        //loop limit
     MOV r6, #0        //loop counter
     MOV r7, #2        //current divisor
     MOV r8, #1        //boolean result 
    
   StartCheckPrimeLoop:

     #check if end conditon is met (loop limit reached)
     CMP r6, r5
     BGE EndCheckPrimeLoop

     #check if input value is divisible by current divisor
     MOV r0, r4
     MOV r1, r7
     BL __aeabi_idiv
     MOV r2,r0
     MOV r3,r4
     MUL r2,r1,r2
     SUB r3,r3,r2
     #Move remainder into r0 and check if it is 0
     MOV r0,r3
     CMP r0, #0
     MOVEQ r8, #0
     BEQ EndCheckPrimeLoop

     #increment loop counter and current divisor and run checkprime loop again
     ADD r6, r6, #1
     ADD r7, r7, #1
     B StartCheckPrimeLoop

    EndCheckPrimeLoop:
       
    #Check for result,print the result and then return to the main(sentinel) startloop
    MOV r1, r4
    CMP r8, #1
    BEQ ResultPrime
     B ResultNotPrime

    ResultPrime:
     LDR r0, =PrimeOutput
     BL printf
     B StartLoop

    ResultNotPrime:
     LDR r0, =NotPrimeOutput
     BL printf
     B StartLoop
 
  EndLoop:
 #Pop from OS Stack
 LDR lr, [sp, #0]
 ADD sp, sp, #4
 MOV pc, lr

.data
prompt1: .asciz "Enter any value to continue to the program or enter -1 to exit the program: "
prompt2:.asciz "Enter a value to check if it is a prime number: "
format: .asciz "%d"
num1: .word 0
ErrorMsg: .asciz "Sorry that is an invalid value...Goodbye\n"
PrimeOutput: .asciz "Number %d is Prime\n"
NotPrimeOutput: .asciz "Number %d is not Prime\n"
