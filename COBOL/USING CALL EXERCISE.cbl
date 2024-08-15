000100 IDENTIFICATION DIVISION.                         
000200 PROGRAM-ID. SCRIM.                                
000300 ENVIRONMENT DIVISION.                            
000400 INPUT-OUTPUT SECTION.                            
000500 FILE-CONTROL.                                    
000600 DATA DIVISION.                                   
000700 FILE SECTION.                                    
000800 WORKING-STORAGE SECTION.                         
000900 01 STORE.                                        
001000   05 STORE-ID   OCCURS 3 TIMES.                  
001100     10 PRODUCTS OCCURS 5 TIMES PIC 9(8).         
001200 01 WS-TIME  PIC 9(8).                            
001210 01 J        PIC 9(1).                            
001220 01 I        PIC 9(1).                                  
001300 LINKAGE SECTION.                                         
001400 01 WS-SEQ PIC   9(8).                                    
001500 PROCEDURE DIVISION USING WS-SEQ.                         
001600 000-MAIN.                                                
001700      DISPLAY "THIS IS A 2 D TABLE".                      
001800      PERFORM NEXT-PARA VARYING I FROM 1 BY 1 UNTIL I > 3 
001900      AFTER J FROM 1 BY 1 UNTIL J > 5.                    
002000      STOP RUN.                                           
002100 NEXT-PARA.                                               
002200      ACCEPT WS-SEQ FROM TIME.                            
002300      MOVE WS-SEQ TO PRODUCTS(I, J).                      
002400      DISPLAY "PRODUCTS: " I " , " J "  "                 
002500      PRODUCTS(I, J).                                             
002600      ADD 1 TO WS-SEQ.                                            
**************************** Bottom of Data ****************************



ABOVE THIS CODE IS PERFORMING LOOPS USING I AND J 

BOTH I AND J ARE STARTING FROM 1 AND BEING ADDED BY 1 UNTIL THEY ARE BOTH GREATER THAN THE NUMBERS IN QUESTION. 

THIS LOOPS THE NEXT PARAGRAPH CALLED NEXT-PARA IN THE PERFORM SECTION

WE SET PRODUCTS TO OCCUR 5 TIMES WHICH IS WHY J IS GOING TO LOOP 5 TIMES AND THE PIC IS 9(8) 99999999 FOR ACCEPTING THE CURRENT TIME

WS-SEQ IS STORING THE CURRENT TIME --> ACCEPT WS-SEQ FROM TIME.

THEN MOVING THE TIME WITH WS-SEQ TO PRODUCTS(I, J) SUBSCRIPTS 

AFTER GOING TO DISPLAY PRODUCTS(I, J)

THEN ADDING 1 TO WS-SEQ (TIME)

I IS GOING TO LOOP PRODUCTS SHOWING PRODUCTS1 , PRODUCTS2 AND PRODUCTS 3 ALSO AT THE END SHOWING THE TIME ADDED BY 1
J IS GOING TO LOOP 5 TIMES DOWN WITH PRODUCTS AND TIME IT WILL MAKE MORE SENSE WITH THE OUTPUT BELOW


THEN WE ARE GOING TO USE THIS PROGRAM TO CALL THE PROGRAM ABOVE

000100 IDENTIFICATION DIVISION.                 
000200 PROGRAM-ID. RUBY.                        
000300 ENVIRONMENT DIVISION.                    
000400 INPUT-OUTPUT SECTION.                    
000500 FILE-CONTROL.                            
000600 DATA DIVISION.                           
000700 FILE SECTION.                            
000800 WORKING-STORAGE SECTION.                 
000900 01 WS-SEQ     PIC 9(8).                  
001000 PROCEDURE DIVISION.                      
001100 000-MAIN.                                
001200      ACCEPT WS-SEQ FROM TIME.            
001300      DISPLAY "TIME : " WS-SEQ.           
001400      CALL "SCRIM" USING WS-SEQ.          
001500      STOP RUN.                           

NOTHING SPECIAL BUT WE ARE MAKING A CALL TO SCRIM USING WS-SEQ. THE PROCEDURE FROM SCRIM SHOULD NOW WORK IN SYNC WITH THIS PROGRAM

ONCE COMPLIED AND RAN THIS IS THE OUTPUT

 SDSF OUTPUT DISPLAY MATEDKZ  JO
 COMMAND INPUT ===>             
THIS IS A 2 D TABLE             
PRODUCTS: 1 , 1  09225962       
PRODUCTS: 1 , 2  09225963       
PRODUCTS: 1 , 3  09225964       
PRODUCTS: 1 , 4  09225965       
PRODUCTS: 1 , 5  09225966       
PRODUCTS: 2 , 1  09225967       
PRODUCTS: 2 , 2  09225968       
PRODUCTS: 2 , 3  09225969       
PRODUCTS: 2 , 4  09225970       
PRODUCTS: 2 , 5  09225971       
PRODUCTS: 3 , 1  09225972       
PRODUCTS: 3 , 2  09225973       
PRODUCTS: 3 , 3  09225974       
PRODUCTS: 3 , 4  09225975       
PRODUCTS: 3 , 5  09225976       
********************************
