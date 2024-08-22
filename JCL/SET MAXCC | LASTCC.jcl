000100 //MATEDK01 JOB (MVS),'JORGE CINTRON',        
000200 //             MSGLEVEL=(1,1),               
000300 //             MSGCLASS=H,                   
000400 //             CLASS=A,                      
000500 //             NOTIFY=&SYSUID                
000600 //STEP01   EXEC PGM=IDCAMS                   
000700 //SYSIN    DD *                              
000710   LISTCAT ENTRIES(MATEDK.ABOOK1) ALL         
000800   SET MAXCC = 4                              
000900 /*                                           
001000 //SYSPRINT DD SYSOUT=*                       
001100 //SYSOUT   DD SYSOUT=*                       
001200 //AMSDUMP  DD SYSOUT=*                       
001210 //         IF (STEP01.RC = 4)  THEN          
001300 //STEP02   EXEC PGM=IEFBR14                  
001400 //         ENDIF   


********************************* TOP OF DATA **********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O 
                                                                                
18.38.30 JOB08285 ---- SATURDAY,  20 JUL 2024 ----                              
18.38.30 JOB08285  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
18.38.30 JOB08285  ICH70001I MATEDK   LAST ACCESS AT 18:34:22 ON SATURDAY, JULY 
18.38.30 JOB08285  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE   
18.38.30 JOB08285  IEF403I MATEDK01 - STARTED - TIME=18.38.30                   
18.38.30 JOB08285  -                                      -----TIMINGS (MINS.)--
18.38.30 JOB08285  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
18.38.30 JOB08285  -STEP01               04     50      0       .00       .00   
18.38.30 JOB08285  -STEP02               00      8      0       .00       .00   
18.38.30 JOB08285  IEF404I MATEDK01 - ENDED - TIME=18.38.30                     
18.38.30 JOB08285  -MATEDK01 ENDED.  NAME-JORGE CINTRON        TOTAL TCB CPU TIM
18.38.30 JOB08285  $HASP395 MATEDK01 ENDED                                      
------ JES2 JOB STATISTICS ------                                               


STEP02 RAN SINCE STEP01 HAD A RC OF 4

NOW I WILL CHANGE THE SET MAXCC = 8 FOR FUN

********************************* TOP OF DATA **********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O 
                                                                                
18.39.33 JOB08286 ---- SATURDAY,  20 JUL 2024 ----                              
18.39.33 JOB08286  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
18.39.33 JOB08286  ICH70001I MATEDK   LAST ACCESS AT 18:38:30 ON SATURDAY, JULY 
18.39.33 JOB08286  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE   
18.39.33 JOB08286  IEF403I MATEDK01 - STARTED - TIME=18.39.33                   
18.39.33 JOB08286  -                                      -----TIMINGS (MINS.)--
18.39.33 JOB08286  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
18.39.33 JOB08286  -STEP01               08     50      0       .00       .00   
18.39.33 JOB08286  -STEP02            FLUSH      0      0       .00       .00   
18.39.33 JOB08286  IEF404I MATEDK01 - ENDED - TIME=18.39.33                     
18.39.33 JOB08286  -MATEDK01 ENDED.  NAME-JORGE CINTRON        TOTAL TCB CPU TIM
18.39.33 JOB08286  $HASP395 MATEDK01 ENDED                                      
------ JES2 JOB STATISTICS ------                                               
  20 JUL 2024 JOB EXECUTION DATE                                                
  F1=HELP      F2=SPLIT     F3=END       F4=RETURN    F5=IFIND     F6=BOOK      

Since step01 has an abend code of 8 it did not satisy the conditon for step02




***********   LASTCC 


Command ===>                                                 
****** ***************************** Top of Data ************
000100 //MATEDK01 JOB (MVS),'JORGE CINTRON',                 
000200 //             MSGLEVEL=(1,1),                        
000300 //             MSGCLASS=H,                            
000400 //             CLASS=A,                               
000500 //             NOTIFY=&SYSUID                         
000600 //STEP01   EXEC PGM=IDCAMS                            
000700 //SYSIN    DD *                                       
000710   LISTCAT ENTRIES(MATEDK.ABOOK1) ALL                  
000800   SET LASTCC = 0                                      
000900 /*                                                    
001000 //SYSPRINT DD SYSOUT=*                                
001100 //SYSOUT   DD SYSOUT=*                                
001200 //AMSDUMP  DD SYSOUT=*                                
001210 //         IF (STEP01.RC = 4)  THEN                   
001300 //STEP02   EXEC PGM=IEFBR14                           
001400 //         ENDIF                                      
****** **************************** Bottom of Data **********


********************************* TOP OF DATA **********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O 
                                                                                
18.40.42 JOB08287 ---- SATURDAY,  20 JUL 2024 ----                              
18.40.42 JOB08287  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
18.40.42 JOB08287  ICH70001I MATEDK   LAST ACCESS AT 18:39:33 ON SATURDAY, JULY 
18.40.42 JOB08287  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE   
18.40.42 JOB08287  IEF403I MATEDK01 - STARTED - TIME=18.40.42                   
18.40.42 JOB08287  -                                      -----TIMINGS (MINS.)--
18.40.42 JOB08287  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
18.40.42 JOB08287  -STEP01               00     50      0       .00       .00   
18.40.42 JOB08287  -STEP02            FLUSH      0      0       .00       .00   
18.40.42 JOB08287  IEF404I MATEDK01 - ENDED - TIME=18.40.42                     
18.40.42 JOB08287  -MATEDK01 ENDED.  NAME-JORGE CINTRON        TOTAL TCB CPU TIM
18.40.42 JOB08287  $HASP395 MATEDK01 ENDED                                      
------ JES2 JOB STATISTICS ------                                               
  20 JUL 2024 JOB EXECUTION DATE                                                
