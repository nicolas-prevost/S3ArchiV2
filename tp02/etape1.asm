			org 	$4
Vector_001	dc.l	Main
			org 	$500
			
Main		clr.l	d1				;clear d1
			move.l	#$80000007,d0	;stock 80000007 en d0  
loop1		addq.l	#1,d1			;ajoute 1 a d1
			subq.w	#1,d0			;soustrait 2 a d0, qui est passe en mort et qui vaut 0007
			bne		loop1			;rejoue la boucle tant que d0 n'est pas nul
			
			clr.l	d2
			move.l	#$fe2310,d0
loop2		addq.l	#1,d2
			subq.b	#2,d0
			bne 	loop2
			
			
			clr.l	d3
			move.l	#125,d0
loop3		addq.l	#1,d3
			dbra 	d0,loop3	;dbra = dbf
			
			clr.l	d4			
			moveq.l	#10,d0		;move quick (valeurs enter 128 et -128)
loop4		addq.l	#1,d4		
			addq.l 	#1,d0
			cmpi.l	#30,d0		;mets a jour le flag Z de D0 sans modif sa valeur
								;z = flag(droite-gauche)
								;le flag Z: 1 si non nul sinon 0
			bne		loop4		;check si le flag de z = 0 (vaut 0)
			
			illegal
