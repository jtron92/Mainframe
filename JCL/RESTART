IN CASE NEED TO RETART FROM A STEP PROC
//MATEDK01 JOB (MVS),'JORGE CINTRON',                       
//             MSGLEVEL=(1,1),                              
//             MSGCLASS=H,                                  
//             CLASS=A,                                     
//             NOTIFY=&SYSUID,RESTART=STEP06.PRCSTEP        
//PROC100  PROC                                             
//PRC111   EXEC PGM=IDCAMS                                  
//SYSIN    DD *                                             
  LISTCAT ENTRIES(MATEDK.ABOOK1) ALL                        
  SET LASTCC = 0                                            
/*                                                          
//SYSPRINT DD SYSOUT=*                                      
//SYSOUT   DD SYSOUT=*                                      
//AMSDUMP  DD SYSOUT=*                                      
//         PEND                                             
//STEP02   EXEC PROC100                                     
//         IF (STEP02.PRC111.RC = 4) THEN                   
//         ENDIF                                   
//         IF (STEP02.PRC111.RC = 4) THEN          
//STEP04   EXEC PGM=IDCAMS                         
//SYSIN    DD *                                    
  DEFINE GDG(NAME(MATEDK.GDBASE11)-                
  LIMIT(3)-                                        
  NOEMPTY-                                         
  SCRATCH)                                         
/*                                                 
//SYSPRINT DD SYSOUT=*                             
//SYSOUT   DD SYSOUT=*                             
//AMSDUMP  DD SYSOUT=*                             
//         ENDIF                                   
//PROC100  PROC                                    
//PRCSTEP  EXEC PGM=IEFBR14                        
//DD1      DD DSN=MATEDK.GDBASE11(+1),             
//            DISP=(NEW,CATLG,DELETE),             
//            UNIT=SYSDA,                          
//            SPACE=(TRK,(8,8),RLSE),                           
//            DCB=DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800        
//         PEND                                                 
//STEP06   EXEC PROC100                                         
**************************** Bottom of Data ********************

Go find the step that its execing like step06 exec proc100

then go to the procname which is prco100
step go to the step in that proc thats execing PRCSTEP  EXEC PGM=IEFBR14 

so you would restart it by By STEP06.PRCSTEP



ALSO if you needed to restart a job and it start from a step that complies code example :

//Z38515AB JOB (MVS),'JORGE CINTRON',                        
//             MSGLEVEL=(1,1),                               
//             MSGCLASS=H,                                   
//             CLASS=A,                                      
//             NOTIFY=&SYSUID                                
//STEP01   EXEC ASMACL,MBR=PGM2                              
//C.SYSIN  DD DSN=&SYSUID..ALL.MIGHT(PGM2),DISP=SHR          
//L.SYSLMOD DD DSN=&SYSUID..CBLOADER(PGM2),DISP=SHR          
//C.SYSLIB  DD DSN=&SYSUID..ALL.MIGHT,DISP=SHR               
//          DD DSN=SYS1.MACLIB,DISP=SHR                      
//STEP02    EXEC PGM=PGM2                                    
//STEPLIB   DD DSN=&SYSUID..CBLOADER(PGM2),DISP=SHR          
//SYSPRINT  DD SYSOUT=*                                      
//SYSOUT    DD SYSOUT=*                                      
//AMSDUMP   DD SYSOUT=*                                      
//IFILE     DD DSN=Z38515.ALL.MIGHT(NUM),DISP=SHR            
//OFILE     DD SYSOUT=*                                      


so we want to restart it from step01 but if you just did that it would fail with a JCL error that the step is invalid

heres out to figure out whats the name of the step in proc for that ASMACL

either go to the sys1.proclib and find that procedure or you can find it in the logs if you ran the compliation also 

---------------------------------------------------------------------
     SYS1.PROCLIB(ASMACL) - 01.00                    Columns 00001 00
d ===>                                                  Scroll ===> C
 ***************************** Top of Data **************************
 //ASMACL   PROC                                                     
 //*                                                                 
 //***   ASMACL                                                      
 //*                                                                 
 //* THIS PROCEDURE RUNS THE HIGH LEVEL ASSEMBLER, LINK-EDITS THE    
 //* NEWLY ASSEMBLED PROGRAM.                                        
 //*                                                                 
 //C        EXEC PGM=ASMA90                                          
 //SYSLIB   DD  DSN=SYS1.MACLIB,DISP=SHR                             
 //SYSUT1   DD  DSN=&&SYSUT1,SPACE=(4096,(120,120),,,ROUND),UNIT=VIO,
 //             DCB=BUFNO=1                                          
 //SYSPRINT DD  SYSOUT=*                                             
 //SYSLIN   DD  DSN=&&OBJ,SPACE=(3040,(40,40),,,ROUND),UNIT=VIO,     
 //             DISP=(MOD,PASS),                                     
 //             DCB=(BLKSIZE=3040,LRECL=80,RECFM=FBS,BUFNO=1)        
 //L        EXEC PGM=HEWL,PARM='MAP,LET,LIST,NCAL',COND=(8,LT,C)     
 //SYSLIN   DD  DSN=&&OBJ,DISP=(OLD,DELETE)                          

so the step that starts the code is in PROC called ASMACL and the step name is C           C        EXEC PGM=ASMA90   


so to restart the job we wanted back from step01 it would be RESTART=STEP01.C







```jcl
****** ***************************** Top of Data ******************************
000100 //MATEDK01 JOB CLASS=A,                                                 
000200 //             MSGLEVEL=(1,1),                                          
000300 //             MSGCLASS=H,                                              
000400 //             NOTIFY=&SYSUID,                                          
000410 //             RESTART=STEP03                                           
000500 //STEP01   EXEC PGM=IEBGENER                                            
000600 //SYSUT1   DD DSN=MATEDK.BRAVO.TASK141,DISP=SHR                         
000700 //SYSUT2   DD DSN=&&TEMP,                                               
000800 //            DISP=(NEW,PASS,DELETE),                                   
000900 //            UNIT=SYSDA,                                               
001000 //            DCB=(DSORG=PS,LRECL=80,BLKSIZE=0,RECFM=FB),               
001100 //            VOL=SER=DEVHD3,                                           
001200 //            SPACE=(TRK,(1,1),RLSE)                                    
001300 //AMSDUMP  DD SYSOUT=*                                                  
001400 //SYSPRINT DD SYSOUT=*                                                  
001500 //SYSOUT   DD SYSOUT=*                                                  
001600 //SYSIN    DD DUMMY                                                     
001700 //STEP02   EXEC PGM=IEBGENER                                       
001800 //SYSUT1   DD DSN=&&TEMP,DISP=SHR                                  
001900 //SYSUT2   DD DSN=&SYSUID..GREEN89,                                
001910 //            DISP=(NEW,CATLG,DELETE),                             
001920 //            UNIT=SYSDA,                                          
001930 //            DCB=(DSORG=PS,LRECL=80,BLKSIZE=800,RECFM=FB),        
001940 //            VOL=SER=DEVHD3,                                      
001950 //            SPACE=(TRK,(1,1),RLSE)                               
001960 //AMSDUMP  DD SYSOUT=*                                             
001970 //SYSPRINT DD SYSOUT=*                                             
001980 //SYSOUT   DD SYSOUT=*                                             
001990 //SYSIN    DD DUMMY                                                
002000 //STEP03   EXEC PGM=IEFBR14                                        
002001 //DD1      DD DSN=&SYSUID..POPS1,                                  
002010 //            DISP=(NEW,CATLG,DELETE),                             
002020 //            UNIT=SYSDA,                                          
002030 //            DCB=(DSORG=PS,LRECL=80,BLKSIZE=800,RECFM=FB),        
002040 //            VOL=SER=DEVHD3,                                      
002050 //            SPACE=(TRK,(1,1),RLSE)                                    
002060 //SYSPRINT DD SYSOUT=*                                                  
002070 //SYSOUT   DD SYSOUT=*                                                  
****** **************************** Bottom of Data ****************************


IN CASE NEEDED YOU CAN ADD RESTART IN JOB CARD IF JOB NEEDS TO SKIP A STEP USE RESTART





ONCE SUBMITTED THE JOB HAS SKIPPED STEP01 STEP02 AND RAN ON STEP03

********************************* TOP OF DATA **********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O 
                                                                                
17.59.49 JOB03818 ---- TUESDAY,   12 DEC 2023 ----                              
17.59.49 JOB03818  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
17.59.49 JOB03818  IEF677I WARNING MESSAGE(S) FOR JOB MATEDK01 ISSUED           
17.59.49 JOB03818  ICH70001I MATEDK   LAST ACCESS AT 17:51:46 ON TUESDAY, DECEMB
17.59.49 JOB03818  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE   
17.59.49 JOB03818  IEF403I MATEDK01 - STARTED - TIME=17.59.49                   
17.59.49 JOB03818  -                                      -----TIMINGS (MINS.)--
17.59.49 JOB03818  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
17.59.49 JOB03818  -STEP03               00     13      0       .00       .00   
17.59.49 JOB03818  IEF404I MATEDK01 - ENDED - TIME=17.59.49                     
17.59.49 JOB03818  -MATEDK01 ENDED.  NAME-                     TOTAL TCB CPU TIM
17.59.49 JOB03818  $HASP395 MATEDK01 ENDED                                      









RESTARTING FROM A PROCEDURE STEP

SO RESTART=STEP01.STEP02  

FIRST SHOULD BE THE STEP THAT IS GOING TO EXEC THE PROC 

THEN 

WHATVER THE STEP IN THE PROC YOU WANT TO RESTART FROM

Command ===>                                                  Scroll ==
****** ***************************** Top of Data **********************
000100 //Z38515A  JOB CLASS=A,                                         
000200 //             MSGLEVEL=(1,1),                                  
000300 //             MSGCLASS=H,                                      
000400 //             NOTIFY=&SYSUID,RESTART=STEP01.STEP02             
000500 //         JCLLIB ORDER=(Z38515.ALPHA)                          
000600 //STEP01   EXEC PROC=P2                                         
000700 //STEP01.SYSUT1 DD *                                            
000800   THIS WAS LINE 1                                               
000900 /*                                                              
001000 //          DD * NULLOVRD                                       
001100 //          DD *                                                
001200   THIS WAS LINE 2                                               
001300 /*                                                              
****** **************************** Bottom of Data ********************


Command ===>                                                  Scroll ===> CS
****** ***************************** Top of Data ***************************
000100 //PROC100  PROC                                                      
000200 //STEP01   EXEC PGM=IEBGENER                                         
000300 //SYSUT1   DD *                                                      
000400   THIS IS LINE 1                                                     
000500 /*                                                                   
000600 //         DD *                                                      
000700   THIS IS LINE 2                                                     
000800 /*                                                                   
000900 //         DD *                                                      
001000   THIS IS LINE 3                                                     
001100 /*                                                                   
001200 //SYSUT2   DD DSN=&SYSUID..MUSIC2,                                   
001300 //            DISP=(NEW,CATLG,DELETE),                               
001400 //            UNIT=SYSDA,                                            
001500 //            SPACE=(TRK,(8,10),RLSE),                               
001600 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)           
001700 //SYSPRINT DD SYSOUT=*                                               

