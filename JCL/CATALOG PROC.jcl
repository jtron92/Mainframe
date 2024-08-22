EDIT       MATEDK.ABOOK1(SOLD) - 01.00                  
Command ===>                                            
=COLS> ----+----1----+----2----+----3----+----4----+----
****** ***************************** Top of Data *******
000100 //MATEDK01 JOB (MVS),'JORGE CINTRON',            
000200 //             MSGLEVEL=(1,1),                   
000300 //             MSGCLASS=H,                       
000400 //             CLASS=A,                          
000500 //             NOTIFY=&SYSUID                    
000600 //         JCLLIB ORDER=MATEDK.ASM.RUSH2         
000700 //STEP01   EXEC EIGHT                            
****** **************************** Bottom of Data *****
                                                        
                                                        


FROM THIS JCL, I AM CALLING PROCEDURE EIGHT, WHICH IS A MEMBER IN THE LOCATION OF MATEDK.ASM.RUSH2    

THIS IS THE PROCEDURE THAT HAS BEEN ALREADY COMPILED AND LOADED IN THE MODULE MATEDK.LOADLIB
EDIT       MATEDK.ASM.RUSH2(EIGHT) - 01.01               
Command ===>                                             
****** ***************************** Top of Data ********
000100 //PROCAA   PROC                                   
000200 //PSTEP1   EXEC PGM=ALPHA                         
000300 //STEPLIB  DD DSN=MATEDK.LOADLIB(ALPHA),DISP=SHR  
000400 //PSTEP2   EXEC PGM=GAMMA                         
000500 //STEPLIB  DD DSN=MATEDK.LOADLIB(GAMMA),DISP=SHR  
000600 //PSTEP3   EXEC PGM=DELTA                         
000700 //STEPLIB  DD DSN=MATEDK.LOADLIB(DELTA),DISP=SHR  
****** **************************** Bottom of Data ******


COBOL CODE FOR EACH PGM 

     MATEDK.ASM.RUSH2(DELTA) - 01.01        
d ===>                                      
 ***************************** Top of Data *
 000100 IDENTIFICATION DIVISION.            
 000200 PROGRAM-ID. DELTA.                  
 000300 ENVIRONMENT DIVISION.               
 000400 DATA DIVISION.                      
 000500 WORKING-STORAGE SECTION.            
 000600 PROCEDURE DIVISION.                 
 000700 MAIN-PARA.                          
 000800     MOVE 8 TO RETURN-CODE.          
 000900     STOP RUN.                       
 **************************** Bottom of Data

MATEDK.ASM.RUSH2(GAMMA) - 01.00   
>                                 
************************* Top of D
00 IDENTIFICATION DIVISION.       
00 PROGRAM-ID. GAMMA.             
00 ENVIRONMENT DIVISION.          
00 DATA DIVISION.                 
00 WORKING-STORAGE SECTION.       
00 PROCEDURE DIVISION.            
00 MAIN-PARA.                     
00     MOVE 0 TO RETURN-CODE.     
00     STOP RUN.                  
************************ Bottom of
                                  
MATEDK.ASM.RUSH2(ALPHA) - 01.02   
>                                 
************************* Top of D
00 IDENTIFICATION DIVISION.       
00 PROGRAM-ID. ALPHA.             
00 ENVIRONMENT DIVISION.          
00 DATA DIVISION.                 
00 WORKING-STORAGE SECTION.       
00 PROCEDURE DIVISION.            
00 MAIN-PARA.                     
00     MOVE 4 TO RETURN-CODE.     
00     STOP RUN.                  
************************ Bottom of


RESULTS WHEN EXECUTING THE JCL 

********************************* TOP OF DATA **********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O 
                                                                                
19.02.21 JOB08638 ---- SUNDAY,    21 JUL 2024 ----                              
19.02.21 JOB08638  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
19.02.21 JOB08638  ICH70001I MATEDK   LAST ACCESS AT 18:57:51 ON SUNDAY, JULY 21
19.02.21 JOB08638  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE   
19.02.21 JOB08638  IEF403I MATEDK01 - STARTED - TIME=19.02.21                   
19.02.21 JOB08638  -                                      -----TIMINGS (MINS.)--
19.02.21 JOB08638  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
19.02.21 JOB08638  -STEP01   PSTEP1      04     23      0       .00       .00   
19.02.21 JOB08638  -STEP01   PSTEP2      00     24      0       .00       .00   
19.02.21 JOB08638  -STEP01   PSTEP3      08     23      0       .00       .00   
19.02.21 JOB08638  IEF404I MATEDK01 - ENDED - TIME=19.02.21                     
19.02.21 JOB08638  -MATEDK01 ENDED.  NAME-JORGE CINTRON        TOTAL TCB CPU TIM
19.02.21 JOB08638  $HASP395 MATEDK01 ENDED                                      
------ JES2 JOB STATISTICS ------                                               

******************

IF WONDERING HOW TO RESTART FROM THE STEP HERE IS THE RESTART

STEP01.PSTEP1
STEP01.PSTEP2
STEP01.PSTEP3

ALSO HERE IS HOW YOU WOULD HAVE AN IF ELSE STATEMENT IF NEEDED

***************************** Top of Data ******
//MATEDK01 JOB (MVS),'JORGE CINTRON',           
//             MSGLEVEL=(1,1),                  
//             MSGCLASS=H,                      
//             CLASS=A,                         
//             NOTIFY=&SYSUID                   
//         JCLLIB ORDER=MATEDK.ASM.RUSH2        
//STEP01   EXEC EIGHT                           
//         IF (STEP01.PSTEP1.RC = 0 ) THEN      
//STEP02   EXEC PGM=IEFBR14                     
//         ENDIF                                
**************************** Bottom of Data ****
                                                

