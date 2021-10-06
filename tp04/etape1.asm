			org		$4

Vector_001	dc.l	Main

			
Main		org 	$50
			movea.l	#String1,a0
			jsr 	removeSpace
			illegal

removeSpace	move.l 	#123,d1
			movem.l a0/d1/a1,-(a7)	;on empiles les valeurs dans la pile pour les garder en memoire 
									;et les recuperer apres le programme
									
			move.l	a0,a1			;on fait pointer a1 a a0
			clr.l	d1
			
\loop		move.b 	(a0)+,d1		;d1 au premier char et a0 incremente
			
			
			cmp.b	#0,d1			;si d1 est nul
			beq		\quit
			
			cmp.b	#' ',d1			;si d1 n'est un espace
			bne		\notspace
			
			bra		\loop			;si d1 est un espace (on ne fait rien)
			
\notspace	move.b	d1,(a1)			;on mets d1 dans d0
			add.l	#1,a1 			;on incremente d0
			bra		\loop
			
			
\quit		move.b	#0,(a1)			;on mets le 0 de fin de chaine
			movem.l (a7)+,a0/d1/a1	;on depile pour restaurer les variables
			rts



String1 	dc.b	"   456 + 12 +    9  + 4",0
				    ;456+12+9+4",0
