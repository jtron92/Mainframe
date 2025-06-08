
000100 IDENTIFICATION DIVISION.                                      
000200 PROGRAM-ID. VSMC.                                             
000210************************************************************   
000220*    PROGRAM TO DELETE  A RECORD FROM EMPLOYEE VSAM FILE  *    
000240************************************************************   
000300 ENVIRONMENT DIVISION.                                         
000400 INPUT-OUTPUT SECTION.                                         
000500 FILE-CONTROL.                                                 
000600     SELECT EMPLOYEE-VS-FILE ASSIGN TO EMPVSFIL                
000700     ORGANIZATION IS INDEXED                                   
000800     ACCESS MODE  IS RANDOM                                    
000900     RECORD KEY   IS EMP-ID                                    
001000     FILE STATUS  IS EMP-FILE-STATUS.                          
001100 DATA DIVISION.                                                
001200 FILE SECTION.                                       
001300 FD EMPLOYEE-VS-FILE.                                
001400 01 EMPLOYEE.                                        
001500   05 EMP-ID             PIC 9(4).                   
001600   05 EMP-LAST-NAME      PIC X(30).                  
001700   05 EMP-FIRST-NAME     PIC X(20).                  
001800   05 EMP-SERVICE-NAME   PIC 9(2).                   
001900   05 EMP-PROMOTION-DATE PIC X(10).                  
002000   05 FILLER             PIC X(14).                  
002100 WORKING-STORAGE SECTION.                            
002200 01 WS-FLAGS.                                        
002300   05 SW-END-OF-FILE-SWITCH PIC X(1) VALUE "N".      
002400     88 SW-EOF     VALUE "Y".                        
002500     88 SW-NOT     VALUE "N".                        
002600 01 EMP-FILE-STATUS.                                 
002700     05 EMPFILE-STAT1   PIC X.                       
002800     05 EMPFILE-STAT2   PIC X.                       
002900 PROCEDURE DIVISION.                                     
003000 000-MAIN.                                               
003100     PERFORM P100-INITIALIZATION.                        
003200     PERFORM P200-MAINLINE.                              
003300     PERFORM P300-TERMINATION.                           
003400     STOP RUN.                                           
003500 P100-INITIALIZATION.                                    
003510     DISPLAY "COBOL SAMPLE PROGRAM : VSAM INPUT" .       
003600     OPEN I-O  EMPLOYEE-VS-FILE.                         
003700     INITIALIZE EMPLOYEE.                                
003900 P200-MAINLINE.                                          
004000* DELETE THE REQUESTED RECORD                            
004100* AND DISPLAY THE DATA VALUES                            
           MOVE "3217" TO EMP-ID.                              
           DELETE EMPLOYEE-VS-FILE                             
004300     IF EMP-FILE-STATUS = "00" THEN                      
004400     DISPLAY "EMPLOYEE DELETED IS : " EMPLOYEE           
004500     ELSE                                                         
004600     DISPLAY "RECORD WAS NOT FOUND".                              
004700 P300-TERMINATION.                                                
004800     CLOSE EMPLOYEE-VS-FILE                                       
004900     DISPLAY "SUCCESSFULLY ENDED".                                
**************************** Bottom of Data ****************************




 -------------------------------------------------------------------------------
 SDSF OUTPUT DISPLAY COBRUN   JOB01610  DSID   102 LINE 1       COLUMNS 02- 81  
 COMMAND INPUT ===>                                            SCROLL ===> CSR  
COBOL SAMPLE PROGRAM : VSAM INPUT                                               
EMPLOYEE DELETED IS : 3217                                                  00  
SUCCESSFULLY ENDED                                                              
******************************** BOTTOM OF DATA ********************************


                            Type KSDS     RBA                      Format
Key                                          Col 1       Insert Length 80
       <==>+----10---+----2----+----3----+----4----+----5----+----6----+-
****** ****  Top of data  ****                                           
000002 1122JENKINS                       DEBORAH             052016-09-01
000003 1992MCGEE                         JAMES               102020-12-01
000004 2021WAYNE                         BRUCE               2023-01-0123
000005 4720SCHULTZ                       TIM                 092017-01-01
000006 6288WILLARD                       JOE                 062016-01-01
000007 7459STEWART                       BETTY               072016-07-31
000008 9134FRANKLIN                      BRIANNA             032016-10-01
****** ****  End of data  ****                                           
                                                                         
                                                                         
                                                                                
                                                                                
                                                                                
