			org		$4
	
Vector_001	dc.l	Main

			org 	$500
			
Main		movea.l	#String1,a0
			jsr		SpaceCount
			
			movea.l	#String2,a0
			jsr		SpaceCount
			
			illegal
			
SpaceCount	Movem.l	d1/a0,-(a7)	;sauvegarde des registres dans la pile
			
			clr.l	d0
			
\loop		move.b	(a0)+,d1
			beq		\quit
			
			cmp.b	#' ',d1
			bne		\loop
			
			addq.l	#1,d0
			bra		\loop
			
\quit		movem.l	(a7)+,d1/a0
			rts
			
String1		dc.b 	"cette chaine compotre 4 espaces.",0
String2		dc.b	"celle-ci en comporte 3.",0
