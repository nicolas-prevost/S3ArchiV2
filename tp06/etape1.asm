; ======================================================================
; Initialisation des vecteurs
; ======================================================================

			org		$0

Vector_000	dc.l	$ffb500
Vector_001	dc.l	Main
PrintChar   incbin  "PrintChar.bin"

; ======================================================================
; Programme principal
; ======================================================================
			
			org		$500
			
Main		lea		sTest,a0
			move.b	#24,d1
			move.b	#20,d2
			jsr		Print
			
			illegal
; ======================================================================
; Sous Programmes
; ======================================================================

;IS CHAR ERROR..........................................................
IsCharError	movem.l	d0/a0,-(a7)	

\loop		move.b	(a0)+,d0
			beq		\false			;errreur si chaine nulle
			
			cmpi.b	#'0',d0
			blo		\true			;si d0<'0'erreur -> true
			
			cmpi.b	#9,d0
			bls		\loop			;si s0<=9 -> reboucle
			
\true		ori.b	#%00000100,ccr	;flag a 1
			bra		\quit
			
\false		andi	#%11111011,crr	;flag a 2

\quit		movem.l	(a7)+,d0/a0
			rts
			
;StrLen(mets a d0 la len de a1).........................................
StrLen		move.l	a0,-(a7)	;sauvegarde a0 dans la pile

			clr.l 	d0
			
\loop		tst.b	(a0)+
			beq		\quit
			
			addq.l	#1,d0
			bra		\loop
			
\quit		movea.l	(a7)+,a0	;restaure la valeur du registre a0
			rts			

;IS MAX ERROR...........................................................
IsMAxError	movem.l	d0/a0,-(a7)
			
			jsr 	StrLen			;on recupere la len dans d0
			cmpi.l	#5,d0
			bhi		\true			;longueur superieur a 5
			blo		\false			;longueur inferieur a 5
			
			;comparaison avec 32767 un par 1
			;superieur -> quit et erreur
			;inferieur -> quit sans erreurs
			;egal	   -> next
			
			cmpi.b	#3,(a0)+
			bhi     \true
			blo     \false
			
			cmpi.b	#2,(a0)+
			bhi     \true
			blo     \false
			
			cmpi.b	#7,(a0)+
			bhi     \true
			blo     \false
			
			cmpi.b	#6,(a0)+
			bhi     \true
			blo     \false
			
			cmpi.b	#7,(a0)+
			bhi     \true
			blo     \false
			
\false		andi.b	#%11111011,ccr                
			bra     \quit

\true  		ori.b   #%00000100,ccr

\quit		movem.l (a7)+,d0/a0
			rts
			
;CONVERT
Convert		movem.l	a0,-(a7)
			tst.l	(a0)
			beq		\error
			IsCharError
			beq		\error
			IsMaxerror
			beq		\error
			
			; Sauvegarde les registres dans la pile.
            movem.l d1/a0,-(a7)
            
            ; Initialise la variable de retour ?? 0.            
            clr.l   d0
            
            ; Initialise la variable de conversion ?? 0.            
            clr.l   d1
            
\loop       ; On copie le caract??re courant dans D1            
			; A0 pointe ensuite sur le caract??re suivant (post incr??mentation).            
			move.b  (a0)+,d1
			
            ; Si le caract??re copi?? est nul,            
            ; on quitte (fin de cha??ne).            
            beq     \quit
            
            ; Sinon, on r??alise la conversion num??rique du caract??re.            
            subi.b  #'0',d1
            
            ; On d??cale la variable de retour vers la gauche (x10),
            ; puis on y ajoute la valeur num??rique du caract??re.            
            mulu.w  #10,d0            
            add.l   d1,d0
            
            ; Passage au caract??re suivant.            
            bra     \loop
            
\quit       ; Restaure les registres puis sortie.  
			andi.b	#%11111011,ccr
			movem.l (a7)+,d1/a0            
			rts		

			
			
			
			
\error 		ori.b   #%00000100,ccr 	;flag a 0
			movem.l (a7)+,a0
			rts
			
;GETNUM
GetNum		move.l	d0/a0, -(a7)
			clr.l 	d0
			clr.l	d1
			andi.b  #%11111011,ccr  ; Positionne le flag Z ?? 0 (false).
			
\loop		move.l	(a0)+,d0
			muls	#10,d1
			addq.l	d1,d0
			
			
			

			

			

			
; ======================================================================
; Donnees
; ======================================================================

sTest		dc.b	"156",0
