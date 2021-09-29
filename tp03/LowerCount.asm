			org		$4

Vector_001	dc.l	Main

			org 	$500
			
Main		movea.l	#String1,a0
			jsr		LowerCount
			
			movea.l	#String2,a0
			jsr		LowerCount
			
			illegal
			
LowerCount	clr.l	d1
			move.l	-(a7),a0
			
\loop		move.b	(a0)+,d1
			beq		\quit
			
			cmp.b	#'a',d1
			blo		\loop
			
			cmp.b	#'z',d1
			bhi		\loop
			
			addq.l	#1,d1
			bne		\loop
			bne		\quit
			
			
		
\quit       movem.l   (a7)+,d1/a0   ; Restaure les registres
			rts

String1		dc.b	"Cette chaine comporte 28 minuscules.",0
String2		dc.b	"Celle-ci en comporte 16.",0

