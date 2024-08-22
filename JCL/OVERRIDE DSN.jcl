000100 //MATEDK01 JOB CLASS=A,                                          
000200 //             MSGCLASS=H,                                       
000300 //             MSGLEVEL=(1,1),                                   
000400 //             NOTIFY=&SYSUID                                    
000410 //PROC001  PROC                                                  
000500 //STEP01   EXEC PGM=IEFBR14                                      
000600 //DD1      DD DSN=&SYSUID..FILE1,                                
000700 //            DISP=(NEW,CATLG,DELETE),                           
000800 //            UNIT=SYSDA,                                        
000900 //            SPACE=(TRK,(8,10),RLSE),                           
001000 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),      
001100 //            VOL=SER=DEVHD3                                     
001200 //SYSOUT   DD SYSOUT=*                                           
001300 //SYSPRINT DD SYSOUT=*                                           
001400 //PROC001  PEND                                                  
001500 //STEP02   EXEC PROC001                                          
001600 //STEP01.DD1 DD DSN=&SYSUID..FILE2,                           
001610 //            DISP=(NEW,CATLG,DELETE),                        
001620 //            UNIT=SYSDA,                                     
001630 //            SPACE=(TRK,(8,10),RLSE),                        
001640 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),   
001650 //            VOL=SER=DEVHD3                                  
****** **************************** Bottom of Data ******************

THIS IS A SIMPLE OVER RIDE DSN ,

CALLS THE PROC001 AND STEP01 TO CREATE A NEW DSN 
BUT SINCE THERE IS A STEP01.DD1 AND THE NAME OF THE DSN IS DIFFERENT WITH THE DSN PARAMS IN THE BOTTOM 

YOU CAN NAME YOUR FILE SOMETHING ELSE OTHER THAN DD1 BUT ITS JUST COMMON PRACTICE FOR A SIMPLE EXECUTION


000001 //JCLIEB01 JOB CLASS=A,                                         
000002 //             MSGCLASS=H,                                      
000003 //             MSGLEVEL=(1,1),                                  
000004 //             NOTIFY=&SYSUID                                   
000005 //PROC0001 PROC                                                 
000006 //STEP01   EXEC PGM=IEFBR14                                     
000007 //DD1      DD DSN=Z37931.&DNAME,                                
000008 //            DISP=(NEW,CATLG,DELETE),                          
000009 //            SPACE=(TRK,(8,10),RLSE),                          
000010 //            DCB=(DSORG=PS,LRECL=80,BLKSIZE=800,RECFM=FB),     
000011 //            UNIT=SYSDA                                        
000012 //SYSPRINT DD SYSOUT=*                                          
000013 //SYSOUT   DD SYSOUT=*                                          
000014 //PROC0001 PEND                                                 
000015 //STEP02   EXEC PROC=PROC0001,DNAME=MATRIX1                     
000016 //STEP02   EXEC PROC=PROC0001,DNAME=MATRIX2                     

THIS PROC IS TWO MAKE TWO DSNS NAMED DIFFERENTLY NO NEED TO WRITE THE SAME CODE TWICE TO MAKE FILE
