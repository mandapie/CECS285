jmp main ;jump past interrupt vector
		
org 0x30 ;start at RAM location 0x30
		;--+ configuration section +--
main:
		mov p1, #0x00 ;set p1 as output
		mov TMOD, #0x10 ;set Timer1 to mode 1
		;--+ main program section +--
mainLoop:
		call checkInput
		call Delay
		mov p1, #0xFF ;LEDs on
		call checkInput
		call Delay
		mov p1, #0x00 ;LEDs off
		jmp mainLoop

		;--+ checkInput subroutine +--
checkInput:
		mov r7, p0 ;read switch positions into r7
		cjne r7, #0xFC, not0 ;if switch value is not FC jump to the label not0
		mov r5, #5 ;r5 has the value of #10
		jmp goback
not0:
		cjne r7, #0xFD, not1 ;if switch value is not FD jump to the label not1
		mov r5, #10 ;r5 has the value of #20
		jmp goback
not1:
		cjne r7, #0xFE, not2 ;if switch value is not FE jump to the label not2
		mov r5, #20 ;r5 has the value of #40
		jmp goback
not2:
		mov r5, #40 ;r5 has the value of #90
goback:
		ret ;return from subroutine

		;--+ Delay subroutine+--
Delay:
		mov TH1, #0x3C ;set high byte = 3C
		mov TL1, #0xAF ;set low byte =  AF
		setb TR1
Wait:
		jnb TF1, Wait
		clr TR1 ;stop timer
		clr TF1 ;clear timer flag
		djnz r5, Delay
		ret ;return from subroutine
end