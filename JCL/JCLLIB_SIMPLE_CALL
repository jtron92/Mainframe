Command ===>                                    
000100 //MATEDK01 JOB CLASS=A,                  
000200 //             MSGLEVEL=(1,1),           
000300 //             MSGCLASS=H,               
000400 //             NOTIFY=&SYSUID            
000500 //PROLOC   JCLLIB ORDER=MATEDK.FOLDER59  
000600 //STEP01   EXEC PROC=FRIDAY              
000700 //SYSPRINT  DD SYSOUT=*                  
000800 //SYSOUT    DD SYSOUT=*                  
****** **************************** Bottom of Da

CREATED A SIMPLE CALL USING JCLLIB 

THIS CALLS THE MODULE IN WHICH THE FILE WHERE THE PROC IS AT 

MATEDK.FOLDER59  

GOING INTO MATEDK.FOLDER59  PDS

EDIT              MATEDK.FOLDER59                  
Command ===>                                       
           Name     Prompt       Size   Created    
_________ COBCOMP                   8  2023/11/21  
_________ COBOL1                   88  2023/11/27  
_________ COBRUN                    9  2023/11/20  
_________ COMPLI                    9  2023/11/27  
_________ COPY                     19  2023/11/30  
_________ EDC                      63  2023/11/24  
_________ FILE77                   15  2023/11/21  
______E__ FRIDAY                    9  2023/12/01  

BELOW IS THE FILE MEMBER CALLED FRIDAY AND THE PROC WHICH JUST CREATES A NEW DSN

IN ORDER TO GET THIS RUNNING I GO BACK TO THE FILE THAT CALLS THIS AND SUBMIT IT

****** ***************************** Top of Data *************************
000100 //PROC10   PROC                                                    
000200 //STEP01   EXEC PGM=IEFBR14                                        
000300 //DD1      DD DSN=&SYSUID..FRI1,                                   
000400 //            DISP=(NEW,CATLG,DELETE),                             
000500 //            UNIT=SYSDA,                                          
000600 //            SPACE=(TRK,(8,10),RLSE),                             
000700 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),        
000800 //            VOL=SER=DEVHD3                                       
000900 //PROC10   PEND                                                    
****** **************************** Bottom of Data ***********************

JES2 LOG SHOWS RC 00 SUCCESSFUL RUN WITH THE DSN MATEDK.FRI1  BEING  CATALOGED   
********************************* TOP OF DATA **********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O 
                                                                                
12.59.12 JOB04512 ---- FRIDAY,    01 DEC 2023 ----                              
12.59.12 JOB04512  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
12.59.12 JOB04512  ICH70001I MATEDK   LAST ACCESS AT 12:55:10 ON FRIDAY, DECEMBE
12.59.12 JOB04512  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE   
12.59.12 JOB04512  IEF403I MATEDK01 - STARTED - TIME=12.59.12                   
12.59.12 JOB04512  -                                      -----TIMINGS (MINS.)--
12.59.12 JOB04512  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
12.59.12 JOB04512  -STEP01   PROC100     00     13      0       .00       .00   
12.59.12 JOB04512  IEF404I MATEDK01 - ENDED - TIME=12.59.12                     
12.59.12 JOB04512  -MATEDK01 ENDED.  NAME-                     TOTAL TCB CPU TIM
12.59.12 JOB04512  $HASP395 MATEDK01 ENDED                                      
------ JES2 JOB STATISTICS ------                                               


IEF237I JES2 ALLOCATED TO SYSOUT                                      
IEF142I MATEDK01 PROC100 STEP01 - STEP WAS EXECUTED - COND CODE 0000  
IEF285I   MATEDK.FRI1                                  CATALOGED      
IEF285I   VOL SER NOS= DEVHD3.                                        




A maximum of 15 libraries can be coded using the ORDER parameter, 
with the system searching them in the order that they are coded. 
If you need to expand the library list to the next line, you must do this following a comma, 
with the continued text beginning anywhere from column 4 through 16.



000100 //MATEDK01 JOB CLASS=A,                                                
000200 //             MSGCLASS=H,                                             
000300 //             MSGLEVEL=(1,1),                                         
000400 //             NOTIFY=&SYSUID                                          
000500 //         JCLLIB ORDER=(MATEDK.BIGBOOK,VENDOR.PROCLIB,SVTSC.PROCLIB,  
000510 //         LVL.PROCLIB)                                                
000600 //STEP01   EXEC PROC1                                                  


