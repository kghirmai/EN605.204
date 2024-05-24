#
#
#Program Name: guessRand.s
#Author: Kbrom Ghirmai
#Date: 3/28/2024
#Purpose: Have user pick a range for a random number,then have user select a random number and have computer guess that number using binary search alg 
#

.text
.global main

#register dictionary
#r4-user input max value for range of the secret number
#r5-user input secret number that is between 1 and the maximum that was input and stored in r4
#r6-boolean for check error and if no error r6 holds value of mid range needed for binary search alg use in computer guess
#r7-Holds minimum value of the range for the secret number which is 1
#r8-max range value that will be changed every guess by the binary serch alg
#r9-holds the value 2 which is the divisor needed for binary guess (min+max)/2
#r10-loop limit for guessing game which is equal to the max possible iterations for binary search alg
#r11-guessing game loop counter
#r12-users input for result of computers guess 
#

main:

 #Push to OS stack
 SUB sp, sp, #4
 STR lr, [sp, #0]

 #Start main loop
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
     
   #Prompt user to input maximum value for random number range,read and store max range value
   LDR r0,=prompt2
   BL printf
   LDR r0,=format
   LDR r1,=num1
   BL scanf
   LDR r4,=num1
   LDR r4,[r4]
   #Prompt user to input secret number between 1 and input max range value and store secret value
   MOV r1,r4
   LDR r0,=prompt3
   BL printf
   LDR r0,=format
   LDR r1,=num1
   BL scanf
   #Save secret number to r5
   LDR r5,=num1
   LDR r5,[r5]
  #Check if input maximum value of range is less than 1
  MOV r2,#0
  CMP r4,#1
  ADDLT r2,#1
  #Compare secret number to maximum of range
  MOV r3,#0
  CMP r5,r4
  ADDGT r3,#1 
  ORR r3,r2,r3
  #Check if secret value is less than or equal to the max of range
  MOV r6,#0 
  CMP r5,#1
  ADDLT r6,#1
  ORR r6,r3,r6
  B CheckError

  CheckError: 
  #Check if secret value is less than the minimum possible
   CMP r6,#1
   BEQ ErrMsg
     B GuessGame

  ErrMsg:
   #Print error message 
    LDR r0,=ErrorMsg
    BL printf
    B StartLoop

  GuessGame:
  #Calculate max number of iterations for binary search alg (max number of range/2)
  MOV r0,r4
  MOV r11,#2
  MOV r1,r11
  MOV r10,r0 //r10 will be the loop limit
 
  #Intialize values for guessing game
  MOV r7,#1  //minimum value of the possible range
  MOV r8,r4  //max range value that will be changed every guess by the binary serch alg
  MOV r9,#2  //2 is needed for binary guess (min+max)/2
  MOV r11,#0 //loop counter
  MOV r12,#0 //users input for result of computers guess 

    StartGuess:

      #Stop the loop if the maxim number of iterations are reached
      CMP r10,r11
      BEQ EndGuess

      #Computers initial guess based on binary search algorithm
      ADD r0,r7,r8
      MOV r1,r9
      BL __aeabi_idiv
      MOV r6,r0
      MOV r1,r0
      LDR r0,=compGuess
      BL printf
      #Ask your user if you guess is correct,too low or too high and store decision
      LDR r0,=userInput
      BL printf
      LDR r0,=format2
      LDR r1,=num2
      BL scanf
      LDR r12,=num2
      LDR r12,[r12]
      CMP r12,#1
      BLT userErr
       #if user input is valid
       B checkGuess
      
     userErr:
     LDR r0,=Error2
     BL printf
    
     checkGuess:
     CMP r12,#1
     BGT CheckTooLow
      MOV r1,r6
      LDR r0,=correctGuess
      BL printf
      B StartLoop

     CheckTooLow:
     CMP r12,#2
     BGT CheckTooHigh
      MOV r0,#0
      ADD r0,r8,r7
      MOV r1,r9
      BL __aeabi_idiv
      MOV r7,r0
      B StartGuess
    
    CheckTooHigh:
    MOV r0,#0
    ADD r0,r8,r7
    MOV r1,r9
    BL __aeabi_idiv
    MOV r8,r0
    B StartGuess
        

   EndGuess:
         
 EndLoop:
 #Pop from OS Stack
 LDR lr, [sp, #0]
 ADD sp, sp, #4
 MOV pc, lr

.data
prompt1: .asciz "Enter any value to continue to the program or enter -1 to exit the program: "
prompt2: .asciz "Enter a value greater than 1 to be the maximum of the range for the secret number you will choose: "
prompt3: .asciz "Enter a number between 1 and %d for me to guess: "
compGuess: .asciz "Is your secret number: %d\n"
Error2: .asciz "Sorry your input about my guess was invalid...Please make sure to enter 1 2 or 3 for this question....Game will restart now\n"
format: .asciz "%d"
num1: .word 0
ErrorMsg: .asciz "Invalid Input: Make sure to input a max value for the range that's greater than 1 and make sure the secret number is within that range\n"
userInput: .asciz "Please input 1 if my guess was your secret number,input 2 if my guess was too low and input 3 if my guess was too high: "
format2: .asciz "%d"
num2: .word 0
correctGuess: .asciz "Great, looks your secret number was %d!\n"
