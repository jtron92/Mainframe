000100 //IEFBR14  JOB (DSNJOB),JORGE.CINTRON,                           
000200 //             CLASS=A,                                          
000300 //             MSGCLASS=H,                                       
000400 //             MSGLEVEL=(1,1),                                   
000500 //             NOTIFY=&SYSUID                                    
000600 //*-----------------------------------------------               
000700 //* END OF JOB CARD                                              
000800 //*-----------------------------------------------               
000900 //STEP01   EXEC PGM=IEFBR14                                  
001000 //DD1      DD DSN=&SYSUID..JOB2,                             
001100 //            DISP=(NEW,CATLG,DELETE),                       
001200 //            UNIT=SYSDA,                                    
001300 //            SPACE=(TRK,(8,10,10),RLSE),                    
001400 //            DCB=(DSORG=PO,LRECL=80,RECFM=FB,BLKSIZE=800)   
001500 //STEP02   EXEC PGM=IEBGENER,COND=(0,EQ,STEP01)          */ IF STEP01 RETURNS WITH A ZERO SKIP THIS STEP02 AND GO TO STEP04    
001600 //SYSUT1   DD *                                              
001700   DEREK                                                      
001800 /*                                                           
001900 //SYSPRINT DD SYSOUT=*                                              
002000 //AMSDUMP  DD SYSOUT=*                                              
002100 //SYSOUT   DD SYSOUT=*                                              
002200 //SYSUT2   DD DSN=Z38515.JOB2(JOB1),                                
002210 //            DISP=(MOD,CATLG,DELETE),                              
002220 //            UNIT=SYSDA,                                           
002230 //            SPACE=(TRK,(8,10),RLSE),                              
002240 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)          
002250 //SYSIN    DD DUMMY                                                 
002260 //STEP04   EXEC PGM=IEFBR14                                         
002270 //DD1      DD DSN=Z38515.JOB2,DISP=(OLD,DELETE)                     
****** **************************** Bottom of Data ************************
                                                                           








COND EVEN AND ONLY ***********************



000100 //IEFBR14  JOB (DSNJOB),JORGE.CINTRON,                                
000200 //             CLASS=A,                                               
000300 //             MSGCLASS=H,                                            
000400 //             MSGLEVEL=(1,1),                                        
000500 //             NOTIFY=&SYSUID                                         
000600 //*-----------------------------------------------                    
000700 //* END OF JOB CARD                                                   
000800 //*-----------------------------------------------                    
000900 //STEP01   EXEC PGM=IDCAMS                                            
001000 //SYSIN    DD *                                                       
001100   DEFINE GDG (Z38515.TEST.GDGBASE)-                                   
001200   LIMIT(3)-                                                           
001300   NOEMPTY-                                                            
001400   SCRATCH)                                                            
001410 /*                                                                    
001420 //AMSDUMP  DD SYSOUT=*                                                  
001430 //SYSOUT   DD SYSOUT=*                                                  
001440 //SYSPRINT DD SYSOUT=*                                                  
001500 //STEP03   EXEC PGM=IEBGENER,COND=EVEN           <-------------------                       
001600 //SYSUT1   DD *                                                         
001700   DEREK                                                                 
001800 /*                                                                      
001900 //SYSPRINT DD SYSOUT=*                                                  
002000 //AMSDUMP  DD SYSOUT=*                                                  
002100 //SYSOUT   DD SYSOUT=*                                                  
002200 //SYSUT2   DD DSN=&SYSUID..EMIN2,                                       
002210 //            DISP=(NEW,CATLG,DELETE),                                  
002220 //            UNIT=SYSDA,                                               
002230 //            SPACE=(TRK,(8,10),RLSE),                                  
002240 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)              
002250 //SYSIN    DD DUMMY                                                     
****** **************************** Bottom of Data ****************************


SINCE THE CONDITION IS SET TO EVEN

MEANING EVEN IF STEP01 ABENDS STEP03 WILL EXECUTE AS SHOWN BELOW :


11.23.16 JOB06273 ---- WEDNESDAY, 06 MAR 2024 ----                              
11.23.16 JOB06273  IRR010I  USERID Z38515   IS ASSIGNED TO THIS JOB.            
11.23.17 JOB06273  ICH70001I Z38515   LAST ACCESS AT 11:22:44 ON WEDNESDAY, MARC
11.23.17 JOB06273  $HASP373 IEFBR14  STARTED - INIT 4    - CLASS A        - SYS 
11.23.17 JOB06273  -                                      -----TIMINGS (MINS.)--
11.23.17 JOB06273  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
11.23.17 JOB06273  -STEP01               12     21      2       .00       .00   
11.23.17 JOB06273  -STEP03               00     24      3       .00       .00   
11.23.17 JOB06273  -IEFBR14  ENDED.  NAME-JORGE.CINTRON        TOTAL TCB CPU TIM
11.23.17 JOB06273  $HASP395 IEFBR14  ENDED - RC=0012                            
------ JES2 JOB STATISTICS ------                                               
  06 MAR 2024 JOB EXECUTION DATE                                                


NOW APPLYING ONLY CONDITION

000100 //IEFBR14  JOB (DSNJOB),JORGE.CINTRON,                       
000200 //             CLASS=A,                                      
000300 //             MSGCLASS=H,                                   
000400 //             MSGLEVEL=(1,1),                               
000500 //             NOTIFY=&SYSUID                                
000600 //*-----------------------------------------------           
000700 //* END OF JOB CARD                                          
000800 //*-----------------------------------------------           
000900 //STEP01   EXEC PGM=IDCAMS                                   
001000 //SYSIN    DD *                                              
001100   DEFINE GDG (Z38515.TEST.GDGBASE)-                          
001200   LIMIT(3)-                                                  
001300   NOEMPTY-                                                   
001400   SCRATCH)                                                   
001410 /*                                                           
001420 //AMSDUMP  DD SYSOUT=*                                       
001430 //SYSOUT   DD SYSOUT=*                                       
001440 //SYSPRINT DD SYSOUT=*                                       
001500 //STEP03   EXEC PGM=IEBGENER,COND=ONLY               <----------------------------------          
001600 //SYSUT1   DD *                                              
001700   DEREK                                                      
001800 /*                                                           
001900 //SYSPRINT DD SYSOUT=*                                       
002000 //AMSDUMP  DD SYSOUT=*                                       
002100 //SYSOUT   DD SYSOUT=*                                       
002200 //SYSUT2   DD DSN=&SYSUID..EMIN3,                            
002210 //            DISP=(NEW,CATLG,DELETE),                       
002220 //            UNIT=SYSDA,                                    
002230 //            SPACE=(TRK,(8,10),RLSE),                       
002240 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)   
002250 //SYSIN    DD DUMMY                                          
****** **************************** Bottom of Data *****************

BELOW SINCE WE HAVE THE CONDITION SET TO ONLY THE STEP03 DID NOT RUN SINCE STEP01 ABENDED BELOW IS THE OUTPUT:


                   J E S 2  J O B  L O G  --  S Y S T E M  S 0 W 1  --  N O D E
                                                                               
11.26.28 JOB06280 ---- WEDNESDAY, 06 MAR 2024 ----                             
11.26.28 JOB06280  IRR010I  USERID Z38515   IS ASSIGNED TO THIS JOB.           
11.26.29 JOB06280  ICH70001I Z38515   LAST ACCESS AT 11:23:17 ON WEDNESDAY, MAR
11.26.29 JOB06280  $HASP373 IEFBR14  STARTED - INIT 4    - CLASS A        - SYS
11.26.29 JOB06280  -                                      -----TIMINGS (MINS.)-
11.26.29 JOB06280  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  
11.26.29 JOB06280  -STEP01               12     21      2       .00       .00  
11.26.29 JOB06280  -STEP03            FLUSH      0      0       .00       .00  
11.26.29 JOB06280  -IEFBR14  ENDED.  NAME-JORGE.CINTRON        TOTAL TCB CPU TI
11.26.29 JOB06280  $HASP395 IEFBR14  ENDED - RC=0012                           
------ JES2 JOB STATISTICS ------                                              
  06 MAR 2024 JOB EXECUTION DATE                                               

