000100 IDENTIFICATION DIVISION.                  
000200 PROGRAM-ID. TOM.                          
000300 ENVIRONMENT DIVISION.                     
000400 INPUT-OUTPUT SECTION.                     
000500 FILE-CONTROL.                             
000600     SELECT IFILE ASSIGN TO CUSTDDI.       
000700     SELECT OFILE ASSIGN TO CUSTDDO.       
000800 DATA DIVISION.                            
000900 FILE SECTION.                             
001000 FD IFILE.                                 
001100 01 IFILE-RECS.                            
001200   05 EMP-ID   PIC 9(5).                   
001300   05 EMP-NAME PIC X(20).                  
001400   05 FILLER   PIC X(55).                  
001500 FD OFILE.                                 
001600 01 OFILE-RECS.                      
001610   05 EMP-IDO  PIC 9(5).             
001620   05 EMP-NAMEO PIC X(20).           
001630   05 FILLER   PIC X(55).            
001700 WORKING-STORAGE SECTION.            
001800 01 SWITCHZ    PIC X(1) VALUE "N".   
001900 PROCEDURE DIVISION.                 
002000 000-MAIN-PROCEDURE.                 
002100     OPEN INPUT IFILE.               
002200     OPEN OUTPUT OFILE.              
002300     PERFORM UNTIL SWITCHZ = "Y"     
002400     READ IFILE                      
002500     AT END                          
002600     MOVE "Y" TO SWITCHZ             
002700     NOT AT END                      
002800     MOVE EMP-ID TO EMP-IDO          
002900     MOVE EMP-NAME TO EMP-NAMEO      
002910     WRITE OFILE-RECS                
003000     END-READ                                                     
003100     END-PERFORM.                                                 
003200     STOP RUN.                                                    
**************************** Bottom of Data ****************************


COPYING INPUT READ FILE AND CREATING A NEW DSN WITH THE DATA


Command ===>                                
****** ***************************** Top of 
000001 00001 JAMES ANDERSON                 
000002 00002 THOMAS MICHAEL                 
000003 00003 BOBBY THOMASON                 
****** **************************** Bottom o
                                            
