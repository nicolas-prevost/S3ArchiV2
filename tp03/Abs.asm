			org 	$4
vector_001	dc.l	Main

			org 	$500
			
Main		move.l	#-4,d0
			jsr 	Abs
			illegal
			
Abs 		tst.l	d0
			bpl		\quit
			
			negl	d0
			
\quit		rts
