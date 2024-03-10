IEFBR14 is an IBM supplied program that doesnt anything. Instead it performs an assembler language command that causes it to return control to the OS and terminate.
This forces OS to allocate and deallocate any data sets defined in the job steps DD statement.

IEFBR14 is derived from the return to the program in Assembler called Branch (BR) register 14, which contains the address to return to after a call.

Command ===>                                                  Scroll ===> CSR  
=COLS> ----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
****** ***************************** Top of Data ******************************
000100 //MATEDK01 JOB CLASS=A,                                                 
000200 //             MSGCLASS=H,                                              
000300 //             MSGLEVEL=(1,1),                                          
000400 //             NOTIFY=&SYSUID                                           
000500 //STEP01   EXEC PGM=IEFBR14                                             
000600 //DD1      DD DSN=&SYSUID..BRAVO.TASK141,                               
000700 //            DISP=(NEW,CATLG,DELETE),                                  
000800 //            UNIT=SYSDA,                                               
000900 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),             
001000 //            SPACE=(TRK,(8,10),RLSE),                                  
001100 //            VOL=SER=DEVHD3                                            
001200 //SYSOUT   DD SYSOUT=*                                                  
001300 //SYSPRINT DD SYSOUT=*                                                  
****** **************************** Bottom of Data ****************************

Above is a basic utility called IEFBR14 which is mainly used to exec a simple program like this one

This is to create a new file with the parameters added on space, data control block , etc 

You can also delete a dsn using IEFBR14 just change the disp = (old,delete) and delete the rest of the dsn params like below: 


Command ===>                                                  Scroll ===> CSR  
=COLS> ----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
****** ***************************** Top of Data ******************************
000100 //MATEDK01 JOB CLASS=A,                                                 
000200 //             MSGCLASS=H,                                              
000300 //             MSGLEVEL=(1,1),                                          
000400 //             NOTIFY=&SYSUID                                           
000500 //STEP01   EXEC PGM=IEFBR14                                             
000600 //DD1      DD DSN=&SYSUID..BRAVO.TASK141,DISP=(OLD,DELETE)                                                                          
001200 //SYSOUT   DD SYSOUT=*                                                  
001300 //SYSPRINT DD SYSOUT=*                                                  
****** **************************** Bottom of Data ****************************


YOU CAN ALSO ADD ADD A GDG FILE LIKE BELOW 


000021 //STEP02   EXEC PGM=IEFBR14                                        
000022 //DD1      DD DSN=Z37931.NOV30.GDGBASE(+1),                        
000023 //            DISP=(NEW,CATLG,DELETE),                             
000024 //            UNIT=SYSDA,                                          
000025 //            SPACE=(TRK,(8,10),RLSE),                             
000026 //            DCB=(DSORG=PS,LRECL=80,BLKSIZE=800,RECFM=FB)         
000027 //SYSPRINT DD SYSOUT=*                                             
000028 //SYSOUT   DD SYSOUT=*                                             
****** **************************** Bottom of Data ***********************

TO DEFINE THE GDG BASE CLICK ON TAB IDCAMS
