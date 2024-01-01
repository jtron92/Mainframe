000100 IDENTIFICATION DIVISION.                                    
000200 PROGRAM-ID. VSMA.                                           
      *****************************************************        
      * PROGRAM TO ADD A RECODED TO VSAM FILE                      
      *****************************************************        
000300 ENVIRONMENT DIVISION.                                       
000400 INPUT-OUTPUT SECTION.                                       
000500 FILE-CONTROL.                                               
000600     SELECT IFILE ASSIGN TO CUSTDDI                          
000700     ORGANIZATION IS INDEXED                                 
000800     ACCESS MODE  IS RANDOM                                  
000900     FILE STATUS  IS FLAG                                    
001000     RECORD KEY   IS EMP-ID.                                 
001100 DATA DIVISION.                                              
001200 FILE SECTION.                                               
001300 FD IFILE.                                            
001400 01 IFILE-RECS.                                       
001500   05 EMP-ID      PIC 9(4).                           
001600   05 EMP-LAST-NAME PIC X(30).                        
001700   05 EMP-FIRST-NAME PIC X(20).                       
001800   05 EMP-SERVICE-YEARS PIC 9(2).                     
001900   05 EMP-PROMOTION-DATE PIC X(10).                   
002000   05 FILLER             PIC X(14).                   
       WORKING-STORAGE SECTION.                             
002100 01 WS-FLAGS.                                         
002200   05 SWITCH-FLAG        PIC X(1) VALUE "N".          
002300     88 EOF     VALUE "Y".                            
002400     88 NOT-EOF VALUE "N".                            
002500 01 FLAG.                                             
002600    05 EMPFILE-STAT1   PIC X.                         
002700    05 EMPFILE-STAT2   PIC X.                         
002800 PROCEDURE DIVISION.                                  
002900 000-MAIN.                                            
003000     PERFORM P100.                                       
003100     PERFORM P200.                                       
003200     PERFORM P300.                                       
003300     STOP RUN.                                           
003400 P100.                                                   
003500     OPEN I-O IFILE.                                     
003600     INITIALIZE IFILE-RECS.                              
003601     DISPLAY "COBOL PROGRAM UPDATE A VSAM RECORD" .      
003602     IF FLAG = "00" OR "97" THEN                         
003603     NEXT SENTENCE                                       
003604     ELSE                                                
003605     DISPLAY "ERROR ON OPEN FILE STATUS" FLAG            
003606     END-IF.                                             
003610 P200.                                                   
003700     MOVE "1111" TO EMP-ID.                              
003800     MOVE "CINTRON" TO EMP-LAST-NAME.                    
003900     MOVE "JORGE"   TO EMP-FIRST-NAME.                   
004000     MOVE "03"      TO EMP-SERVICE-YEARS.                
004100     MOVE "2018-05-01" TO EMP-PROMOTION-DATE.    
004200     WRITE IFILE-RECS.                           
004300     IF FLAG = "00" THEN                         
004400     DISPLAY "ADD WAS SUCCESSFUL" IFILE-RECS     
004500     ELSE                                        
004600     DISPLAY "ADD WAS NOT SUCCESSFUL" FLAG       
004700     END-IF.                                     
004800 P300.                                           
004900     CLOSE IFILE.                                
005000     DISPLAY "SUCCESSFULLY ENDED".               
***********************************************************************************************************


TO UPDATE A RECORD ALREADY IN VSAM: 


000100 IDENTIFICATION DIVISION.                    
000200 PROGRAM-ID. VSAMB.                          
000300 ENVIRONMENT DIVISION.                       
000400 INPUT-OUTPUT SECTION.                       
000500 FILE-CONTROL.                               
000600     SELECT IFILE ASSIGN TO CUSTDDI          
000700     ORGANIZATION IS INDEXED                 
000800     ACCESS MODE  IS RANDOM                  
000900     RECORD KEY   IS EMP-ID                  
001000     FILE STATUS  IS FLAG.                   
001100 DATA DIVISION.                              
001200 FILE SECTION.                               
001300 FD IFILE.                                   
001400 01 IFILE-RECS.                              
001500   05 EMP-ID      PIC 9(4).                  
 ===>                                              
001600   05 EMP-LAST-NAME PIC X(30).                 
001700   05 EMP-FIRST-NAME PIC X(20).                
001800   05 EMP-SERVICE-DATE PIC 9(2).               
001900   05 EMP-PROMOTION-DATE PIC X(10).            
002000   05 FILLER             PIC X(14).            
002100 WORKING-STORAGE SECTION.                      
002200 01 FLAG.                                      
002300   05 EMPIFILE-STAT1 PIC X.                    
002400   05 EMPIFILE-STAT2 PIC X.                    
002500 01 WS-FLAGS.                                  
002600   05 SWITCH         PIC X(1) VALUE "N".       
002700     88 EOF      VALUE "Y".                    
002800     88 NOT-EOF  VALUE "N".                    
002900 PROCEDURE DIVISION.                           
003000 000-MAIN.                                     
003100     PERFORM P100.                             
003200     PERFORM P200.                             
003300     PERFORM P300.                             
003400     STOP RUN.                           
003500 P100.                                   
003600     OPEN I-O IFILE.                     
           INITIALIZE IFILE-RECS.              
003800     IF FLAG = "00" OR "97" THEN         
003900     NEXT SENTENCE                       
004000     ELSE                                
004100     DISPLAY "ERROR HAS OCCURED" FLAG    
           END-IF.                             
004300 P200.                                   
004400     MOVE "1992" TO EMP-ID               
           READ IFILE                          
           MOVE "JAMES" TO EMP-FIRST-NAME      
           MOVE "MCGEE" TO EMP-LAST-NAME       
004900     REWRITE IFILE-RECS                  
005000     IF FLAG = "00"                      
005100     DISPLAY "SUCCESSFUL UPDATE" FLAG    
005200     ELSE                                
005300     DISPLAY "ERROR ON INSERT" FLAG                               
005400     END-IF.                                                      
005500 P300.                                                            
005600     CLOSE IFILE.                                                 
**************************** Bottom of Data ****************************

FILE MANAGER AFTER ADDING AND UPDATING RECORDS

-------------------------------------------------------------------------
View             Z38515.EMPLOYEE                                   Top of
                            Type KSDS     RBA                      Format
Key                                          Col 1       Insert Length 80
       <==>+----10---+----2----+----3----+----4----+----5----+----6----+-
****** ****  Top of data  ****                                           
000001 1111CINTRON                       JORGE               032018-05-01
000002 1122JENKINS                       DEBORAH             052016-09-01
000003 1992MCGEE                         JAMES               102020-12-01
000004 3217JOHNSON                       EDWARD              042017-01-01
000005 4720SCHULTZ                       TIM                 092017-01-01
000006 6288WILLARD                       JOE                 062016-01-01
000007 7459STEWART                       BETTY               072016-07-31
000008 9134FRANKLIN                      BRIANNA             032016-10-01
****** ****  End of data  ****                                           
                                                                         
                                                                         

