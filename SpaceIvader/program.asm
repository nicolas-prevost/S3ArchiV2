                    ; ==============================
                    ; Définition des constantes     
                    ; ==============================
                    
                    ; Mémoire vidéo                    
                    ; ------------------------------
                    
VIDEO_START         equ     $ffb500                         ; Adresse de départ
VIDEO_WIDTH         equ     480                             ; Largeur en pixels
VIDEO_HEIGHT        equ     320                             ; Hauteur en pixels
VIDEO_SIZE          equ     (VIDEO_WIDTH*VIDEO_HEIGHT/8)    ; Taille en octets
BYTE_PER_LINE       equ     (VIDEO_WIDTH/8)                 ; Nombre d'octets par ligne
                    ; ==============================                    
                    ; Initialisation des vecteurs                    
                    ; ==============================
                    org     $0
                    
vector_000          dc.l    VIDEO_START                     ; Valeur initiale de A7
vector_001			dc.l    Main                            ; Valeur initiale du PC

                    ; ==============================                    
                    ; Programme principal                    
                    ; ==============================
                    
                    org     $500
Main                move.l  #$0,d0                    
					jsr     FillScreen
					; ...                    
					; ...
					
                    illegal
                    
                    ; ==============================                    
                    ; Sous-programmes                    
                    ; ==============================
                    
FillScreen			;FFB500 -> FFFFFF (video memory)
					lea			VIDEO_START,A0					;move VIDEO_START

\loop				move.l		D0,(a0)+
					cmp.l		#$FFFFFC,A0
					bhi			\quit
					
					bra			\loop
\quit				rts


;======================================================================


HLines				lea			VIDEO_START,A0
					move.l		d0,d1,-(A7)
					clr.l		d0
					clr.l		d1
					
\loop				bra			\color
					move.l		D0,(a0)+
					cmp.l		#$FFFFFC,A0
					bhi			\quit
					bra			\loop

\color				cmp.l		#120,d1
					bra			\change
					addi.l		#1,d1
\change				not			d0
					move.l		#0,d1
					rts
					
\quit				move.l		(a7)+,d0,d1
					rts
                    
                    ; ==============================                    
                    ; Données                    
                    ; ==============================
                    ; ...                    
                    ; ...                    
                    ; ...
