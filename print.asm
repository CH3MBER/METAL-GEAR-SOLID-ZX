PrintLoop:
    LD A, (HL)                                              
    OR A
    JR Z, EndLoop
    RST $10
    INC HL
    JR PrintLoop
EndLoop:
    RET
