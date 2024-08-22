000100 //         PROC                                           
000200 //STEP01   EXEC PGM=IEFBR14                               
000300 //DD1      DD DSN=&SYSUID..TESTOZ,                        
000400 //            DISP=(NEW,DELETE),                          
000500 //            UNIT=SYSDA,                                 
000600 //            SPACE=(TRK,(8,10),RLSE),                    
000700 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)
000800 //         PEND                                           
000900 //STEO02   EXEC PROC                                      
001000 //SYSPRINT DD SYSOUT=*                                    
001100 //SYSOUT   DD SYSOUT=*                                    
****** **************************** Bottom of Data **************
                                                                 


IN-STREAM PROCEDURE , straight forward its in the JCL being coded up vs a catalog procedure which is in a different pds file that everyone can call 
