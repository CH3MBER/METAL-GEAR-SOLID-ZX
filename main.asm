    ORG $8000

    ATTR_P EQU $5C8D                                        ; Format: FLASH, BRIGHT, PAPER, INK (FBPP PIII)
    ATTR_T EQU $5C8F
    CL_ALL EQU $0DAF
    CL_SET EQU $0DD9

; ======= "TWENTY TWO: Blind Gun" Title Print =======

StartTitle:
    LD A, $47                                               ; BLACK paper and WHITE ink
    LD (ATTR_P), A
    CALL CL_ALL                                             ; Clear the whole display area    
    LD B, $18-$0A                                           ; 10th row
    LD C, $21-$05                                           ; 5th column
    CALL CL_SET                                             ; CL-SET
    LD HL, msgTitle
    CALL PrintLoop

; ======= "Press 0 to Start" Print =======

    LD A, $86                                               ; BLACK paper and YELLOW ink
    LD (ATTR_T), A
    LD B, $18-$0D                                           ; 13th row
    LD C, $21-$08                                           ; 8th column
    CALL CL_SET                                             ; CL-SET
    LD HL, msgPressZero
    CALL PrintLoop

; ======= "Press 5 for Controls" Print =======

    LD A, $07                                               ; BLACK paper and YELLOW ink
    LD (ATTR_T), A
    LD B, $18-$10                                           ; 16th row
    LD C, $21-$07                                           ; 7th column
    CALL CL_SET                                             ; CL-SET
    LD HL, msgPressFive
    CALL PrintLoop

InfLoop:
    JR InfLoop


    msgTitle DEFM 'TWENTY TWO: Blind Gun', $00
    msgPressZero DEFM 'Press 0 to Play', $00
    msgPressFive DEFM 'Press 5 for Input', $00
    INCLUDE "print.asm"

    END StartTitle