<<<<<<< Updated upstream
.data
    .balign 4
    getA: .asciz "Input num1 : "

    .balign 4 
    getB: .asciz "Input num2 : "

    .balign 4
    A: .word 0

    .balign 4
    B: .word 0

    .balign 4
    GCD: .word 0

    .balign 4
    result: .asciz "GCD of %d and %d is %d"

    .balign 4
    type_input: .asciz "%d"

    .balign 4
    lr_bu: .word 0

.text

mod_vals:
        @Save Link register
    @LDR R5, addr_lr_bu
    @STR lr,[R5] @ R5 <= LR

    @R0 = A , R1 = B
    @first assume ans = R0

    loop:
        CMP R0, R1
        BLT end
        SUB  R0, R0, R1
        B loop

    end:
        @ LDR lr, addr_lr_bu
        @ LDR lr,[lr]
        BX LR

GCD_vals:
        @Save Link register
    @LDR R5, addr_lr_bu
    @STR lr,[R5] @ R5 <= LR

    @R6 = A , R7 = B , GCD => R8
    @find min,max
    CMP R6,R7
    BLT swap
    B find
    swap:
        MOV R10,R7
        MOV R7,R6
        MOV R6,R10
    find:
        @set GCD to min
        MOV R8,R7
        @find GCD

        @ A % GCD => R10
    AmodGCD:
        MOV R0,R6
        MOV R1,R8
        BL mod_vals
        MOV R10,R0

        @ B % GCD => R11
    BmodGCD:
        MOV R0,R7
        MOV R1,R8
        BL mod_vals
        MOV R11,R0
        
    check:
        CMP R10, #0
        BNE nextGCD
        CMP R11, #0
        BNE nextGCD
        B found

    nextGCD:
        SUB R8, R8, #1
        B AmodGCD

    found:
        BX LR

    

.global main
main:
    @Save Link register
    LDR R5, addr_lr_bu
    STR lr,[R5] @ R5 <= LR

    @ask for num1
    LDR R0, =getA
    BL printf

    @get num1 , R0 = type, R1 = A
    LDR R0,=type_input
    LDR R1,=A
    BL scanf
    
    @ask for num2
    LDR R0, =getB
    BL printf

    @get num2 , R0 = type, R1 = B
    LDR R0,=type_input
    LDR R1,=B
    BL scanf

    @prepare for call GCD_vals function
    LDR R6, =A
    LDR R7, =B 

    BL GCD_vals
    @GCD is at R8

    @prepare to print result
    LDR R0, =result
    LDR R1, =A 
    LDR R2, =B 
    MOV R3, R8

    @print result
    BL printf

    LDR lr, addr_lr_bu
    LDR lr, [lr]
    BX lr

addr_lr_bu: .word lr_bu

.global printf
=======
.data
    .balign 4
    getA: .asciz "Input num1 : "

    .balign 4 
    getB: .asciz "Input num2 : "

    .balign 4
    A: .word 0

    .balign 4
    B: .word 0

    .balign 4
    GCD: .word 0

    .balign 4
    result: .asciz "GCD of %d and %d is %d"

    .balign 4
    type_input: .asciz "%d"

    .balign 4
    lr_bu: .word 0

.text

mod_vals:
        @Save Link register
    @LDR R5, addr_lr_bu
    @STR lr,[R5] @ R5 <= LR

    @R0 = A , R1 = B
    @first assume ans = R0

    loop:
        CMP R0, R1
        BLT end
        SUB  R0, R0, R1
        B loop

    end:
        @ LDR lr, addr_lr_bu
        @ LDR lr,[lr]
        BX LR

GCD_vals:
        @Save Link register
    @LDR R5, addr_lr_bu
    @STR lr,[R5] @ R5 <= LR

    @R6 = A , R7 = B , GCD => R8
    @find min,max
    CMP R6,R7
    BLT swap
    B find
    swap:
        MOV R10,R7
        MOV R7,R6
        MOV R6,R10
    find:
        @set GCD to min
        MOV R8,R7
        @find GCD

        @ A % GCD => R10
    AmodGCD:
        MOV R0,R6
        MOV R1,R8
        BL mod_vals
        MOV R10,R0

        @ B % GCD => R11
    BmodGCD:
        MOV R0,R7
        MOV R1,R8
        BL mod_vals
        MOV R11,R0
        
    check:
        CMP R10, #0
        BNE nextGCD
        CMP R11, #0
        BNE nextGCD
        B found

    nextGCD:
        SUB R8, R8, #1
        B AmodGCD

    found:
        BX LR

    

.global main
main:
    @Save Link register
    LDR R5, addr_lr_bu
    STR lr,[R5] @ R5 <= LR

    @ask for num1
    LDR R0, =getA
    BL printf

    @get num1 , R0 = type, R1 = A
    LDR R0,=type_input
    LDR R1,=A
    BL scanf
    
    @ask for num2
    LDR R0, =getB
    BL printf

    @get num2 , R0 = type, R1 = B
    LDR R0,=type_input
    LDR R1,=B
    BL scanf

    @prepare for call GCD_vals function
    LDR R6, =A
    LDR R7, =B 

    BL GCD_vals
    @GCD is at R8

    @prepare to print result
    LDR R0, =result
    LDR R1, =A 
    LDR R2, =B 
    MOV R3, R8

    @print result
    BL printf

    LDR lr, addr_lr_bu
    LDR lr, [lr]
    BX lr

addr_lr_bu: .word lr_bu

.global printf
>>>>>>> Stashed changes
.global scanf