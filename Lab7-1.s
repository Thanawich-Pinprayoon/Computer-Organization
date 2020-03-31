.data
    .balign 4
    A: .word 0

    .balign 4
    B: .word 0

    .balign 4
    C: .word 0
    .balign 4
    lr_bu: .word 0

    .balign 4
    type: .asciz "%d"

    .balign 4
    output: .asciz "%d %% %d = %d \n"

    .balign 4
    get_A: .asciz "Number 1 : \n"

    .balign 4
    get_B: .asciz "Number 2 : \n"

    .text
    @can make function here

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



    .global main
    .func main
main:
    @Save Link register
    LDR R5, addr_lr_bu
    STR lr,[R5] @ R5 <= LR

    @print msg ask for Num 1
    LDR R0, addr_get_A
    BL printf

    @get num1 , R0 = type, R1 = A
    LDR R0,addr_type
    LDR R1,addr_A
    BL scanf

    @print msg ask for Num 2
    LDR R0, addr_get_B
    BL printf

    @get num 2, R0 = type, R1 = B
    LDR R0,addr_type
    LDR R1,addr_B
    BL scanf

    @prepare for calling function
    @R0 = A, R1 = B
    LDR R0, addr_A
    LDR R0,[R0]

    LDR R1, addr_B
    LDR R1,[R1]

    BL mod_vals

    @Move value returned from function to R3
    MOV R3, R0

    @Prepare to print A, B
    LDR R0, addr_output
    LDR R1, addr_A
    LDR R1, [R1]
    LDR R2, addr_B
    LDR R2,[R2]
    BL printf

    @Restore link register
    LDR lr, addr_lr_bu
    LDR lr, [lr]
    BX lr


addr_A: .word A
addr_B: .word B
addr_get_A: .word get_A
addr_get_B: .word get_B
addr_type: .word type
addr_C: .word C
addr_output: .word output
addr_lr_bu: .word lr_bu

.global printf
.data
    .balign 4
    A: .word 0

    .balign 4
    B: .word 0

    .balign 4
    C: .word 0
    .balign 4
    lr_bu: .word 0

    .balign 4
    type: .asciz "%d"

    .balign 4
    output: .asciz "%d %% %d = %d \n"

    .balign 4
    get_A: .asciz "Number 1 : \n"

    .balign 4
    get_B: .asciz "Number 2 : \n"

    .text
    @can make function here

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
    .global main
    .func main
main:
    @Save Link register
    LDR R5, addr_lr_bu
    STR lr,[R5] @ R5 <= LR

    @print msg ask for Num 1
    LDR R0, addr_get_A
    BL printf

    @get num1 , R0 = type, R1 = A
    LDR R0,addr_type
    LDR R1,addr_A
    BL scanf

    @print msg ask for Num 2
    LDR R0, addr_get_B
    BL printf

    @get num 2, R0 = type, R1 = B
    LDR R0,addr_type
    LDR R1,addr_B
    BL scanf

    @prepare for calling function
    @R0 = A, R1 = B
    LDR R0, addr_A
    LDR R0,[R0]

    LDR R1, addr_B
    LDR R1,[R1]

    BL mod_vals

    @Move value returned from function to R3
    MOV R3, R0

    @Prepare to print A, B
    LDR R0, addr_output
    LDR R1, addr_A
    LDR R1, [R1]
    LDR R2, addr_B
    LDR R2,[R2]
    BL printf

    @Restore link register
    LDR lr, addr_lr_bu
    LDR lr, [lr]
    BX lr


addr_A: .word A
addr_B: .word B
addr_get_A: .word get_A
addr_get_B: .word get_B
addr_type: .word type
addr_C: .word C
addr_output: .word output
addr_lr_bu: .word lr_bu

.global printf
.global scanf