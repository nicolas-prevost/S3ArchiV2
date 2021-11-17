                    ; ==============================
                    ; Définition des constantes     
                    ; ==============================
                    
                    ; Mémoire vidéo                    
                    ; ------------------------------
                    
VIDEO_START         equ     $ffb500                         ; Adresse de départVIDEO_WIDTH         
					equ     480                             ; Largeur en pixelsVIDEO_HEIGHT        
					equ     320                             ; Hauteur en pixelsVIDEO_SIZE          
					equ     (VIDEO_WIDTH*VIDEO_HEIGHT/8)    ; Taille en octetsBYTE_PER_LINE       
					equ     (VIDEO_WIDTH/8)                 ; Nombre d'octets par ligne
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
Main                ; ...                    
					; ...                    
					; ...
					
                    illegal
                    
                    ; ==============================                    
                    ; Sous-programmes                    
                    ; ==============================
                    
                    ; ...                    
                    ; ...                    
                    ; ...
                    
                    ; ==============================                    
                    ; Données                    
                    ; ==============================
                    ; ...                    
                    ; ...                    
                    ; ...
