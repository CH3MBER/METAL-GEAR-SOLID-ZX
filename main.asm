    ORG $8000

    ATTR_P EQU $5C8D                                       ; Format: FLASH, BRIGHT, PAPER, INK (FBPP PIII)
    ATTR_T EQU $5C8F
    CL_ALL EQU $0DAF
    CL_SET EQU $0DD9
  
Start:
    LD A, $07                                               ; Black paper and white ink
    LD (ATTR_P), A
    CALL CL_ALL                                             ; Clear the whole display area    
    LD B, $18-$0A                                           ; 10th row
    LD C, $21-$05                                           ; 3rd column
    CALL CL_SET                                             ; CL-SET
    LD HL, title

TitleLoop:                                                  
    LD A, (HL)                                              ; Print the title
    OR A
    JR Z, EndTitle
    RST $10
    INC HL
    JR TitleLoop
EndTitle:
    JR EndTitle

    title defm 'TWENTY TWO: Blind Gun', $00

    END Start