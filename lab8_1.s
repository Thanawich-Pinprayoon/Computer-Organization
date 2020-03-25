.global main
    main:
        MOV R0, #0 
        MOV R1, #1 
        B _continue_loop 
        _loop: 
            ADD R0, R0, R1 
        _continue_loop: 
            CMP R0, #9 
            BLE _loop 
        end: MOV R7, #1 
            SWI 0
