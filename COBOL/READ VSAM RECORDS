------------------------------------------------------------------------
    Z38515.CBCOMPL(VSAMC) - 01.01                   Columns 00001 00072 
***************************** Top of Data ******************************
000100 IDENTIFICATION DIVISION.                                         
000200 PROGRAM-ID. VSMC.                                                
000210************************************************************      
000220*    PROGRAM TO RETRIEVE A RECORD FROM EMPLOYEE VSAM FILE  *      
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
003600     OPEN INPUT EMPLOYEE-VS-FILE.                           
003700     INITIALIZE EMPLOYEE.                                   
003800     MOVE "3217" TO EMP-ID.                                 
003900 P200-MAINLINE.                                             
004000* READ THE INPUT FILE TO GET THE REQUESTED RECORD           
004100* AND DISPLAY THE DATA VALUES                               
004200     READ EMPLOYEE-VS-FILE                                  
004300     IF EMP-FILE-STATUS = "00" THEN                         
004400     DISPLAY "EMPLOYEE DATA IS " EMPLOYEE                   
004500     ELSE                                                   
004600     DISPLAY "RECORD WAS NOT FOUND".                        
004700 P300-TERMINATION.                                          
004800     CLOSE EMPLOYEE-VS-FILE                                 
004900     DISPLAY "SUCCESSFULLY ENDED".                          
*********************************************************************************


COMPLIER JCL
****** ***************************** Top of Data **************************
000100 //COBCOP   JOB CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1),NOTIFY=&SYSUID     
000110 //PROCLOC  JCLLIB ORDER=IGY630.SIGYPROC                             
000200 //STEP01   EXEC PROC=IGYWCL,LNGPRFX='IGY630'                        
000300 //COBOL.SYSIN DD DSN=Z38515.CBCOMPL(VSAMC),DISP=SHR                 
000400 //LKED.SYSLMOD DD DSN=Z38515.CBLOADER(VSAMC),DISP=SHR               
****** **************************** Bottom of Data ************************

RUN JCL 
 000100 //COBRUN   JOB CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1),NOTIFY=&SYSUID     
 000200 //STEP01   EXEC PGM=VSAMC                                           
 000400 //STEPLIB  DD DSN=Z38515.CBLOADER(VSAMC),DISP=SHR                   
 000500 //SYSPRINT DD SYSOUT=*                                              
 000600 //SYSOUT   DD SYSOUT=*                                              
 000700 //EMPVSFIL DD DSN=Z38515.EMPLOYEE,DISP=SHR                          
 ****** **************************** Bottom of Data ************************

SDSF OUTPUT
   Display  Filter  View  Print  Options  Search  Help                          
 -------------------------------------------------------------------------------
 SDSF OUTPUT DISPLAY COBRUN   JOB01017  DSID   102 LINE 1       COLUMNS 02- 81  
 COMMAND INPUT ===>                                            SCROLL ===> CSR  
COBOL SAMPLE PROGRAM : VSAM INPUT                                               
EMPLOYEE DATA IS 3217JOHNSON                       EDWARD              042017-01
SUCCESSFULLY ENDED                                                              
******************************** BOTTOM OF DATA ********************************
                                                                                
                                                                                
                                                                                



FILE MANAGER 

----------------------------------------------------------------------------
View             Z38515.EMPLOYEE                                   Top of 6 
                            Type KSDS     RBA                      Format CH
Key                                          Col 1       Insert Length 80   
       <==>+----10---+----2----+----3----+----4----+----5----+----6----+----
****** ****  Top of data  ****                                              
000001 1122JENKINS                       DEBORAH             052016-09-01   
000002 3217JOHNSON                       EDWARD              042017-01-01   
000003 4720SCHULTZ                       TIM                 092017-01-01   
000004 6288WILLARD                       JOE                 062016-01-01   
000005 7459STEWART                       BETTY               072016-07-31   
000006 9134FRANKLIN                      BRIANNA             032016-10-01   
****** ****  End of data  ****                                              
                                                                            
                                                                            
