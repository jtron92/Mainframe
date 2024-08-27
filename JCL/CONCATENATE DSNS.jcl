000100 //JCLCOMB1 JOB (ACCT),'JORGE',                                
000200 //             CLASS=A,                                               
000300 //             MSGLEVEL=(1,1),                                        
000400 //             MSGCLASS=H,                                            
000500 //             NOTIFY=&SYSUID                                         
000510 //******************************************************************  
000520 //* CONCATENATE TWO PS FILES INTO ONE                                 
000530 //******************************************************************  
000600 //STEP01   EXEC PGM=IEBGENER                                          
000700 //SYSUT1   DD DSN=Z38515.ALPHA(FLEX1),DISP=SHR                          
000800 //         DD DSN=Z38515.ALPHA(FLEX2),DISP=SHR                         
000900 //SYSUT2   DD DSN=&SYSUID..BACKUP1.FILEX,                             
001000 //            DISP=(NEW,CATLG,DELETE),                                
001100 //            UNIT=SYSDA,                                             
001200 //            SPACE=(TRK,(8,10),RLSE),                                
001300 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)            
001400 //SYSIN    DD DUMMY                                                   
001500 //SYSOUT   DD SYSOUT=*                                                  
001600 //SYSPRINT DD SYSOUT=*                                                  
001700 //AMSDUMP  DD SYSOUT=*                                                  
****** **************************** Bottom of Data ****************************
                                                                               
                                                                               

Z38515.ALPHA(FLEX1)
EDIT       Z38515.ALPHA(FLEX1) - 01.01                       Columns 00001 00072 
Command ===>                                                  Scroll ===> CSR  
****** ***************************** Top of Data ******************************
000100 EMPLOYEE NAME           EMPLOYEE NUMBER                                 
000200 JAMES                   0001                                            
000300 BLAKE                   0002                                            
000400 ANNA                    0003                                            
000500 THOMAS                  0004                                            
000600 BRAXTON                 0005                                            
000700 *********************************************************************   
****** **************************** Bottom of Data ****************************



Z38515.ALPHA(FLEX2)

EDIT       Z38515.ALPHA(FLEX2) - 01.01                      Columns 00001 00072
Command ===>                                                  Scroll ===> CSR 
****** ***************************** Top of Data *****************************
000100 EMPLOYEE NAME           EMPLOYEE NUMBER                                
000200 TOMMY                   0001                                           
000300 JESSICA                 0002                                           
000400 MELISSA                 0003                                           
000500 BRAIN                   0004                                           
000600 SETH                    0005                                           
****** **************************** Bottom of Data ***************************
                                                                              
                                                                              



Z38515.BACKUP1.FILEX 

 EDIT       Z38515.BACKUP1.FILEX                            Columns 00001 00072 
 Command ===>                                                  Scroll ===> CSR  
 ****** ***************************** Top of Data ******************************
 000001 EMPLOYEE NAME           EMPLOYEE NUMBER                                 
 000002 JAMES                   0001                                            
 000003 BLAKE                   0002                                            
 000004 ANNA                    0003                                            
 000005 THOMAS                  0004                                            
 000006 BRAXTON                 0005                                            
 000007 *********************************************************************   
 000008 EMPLOYEE NAME           EMPLOYEE NUMBER                                 
 000009 TOMMY                   0001                                            
 000010 JESSICA                 0002                                            
 000011 MELISSA                 0003                                            
 000012 BRAIN                   0004                                            
 000013 SETH                    0005                                            
 ****** **************************** Bottom of Data ****************************
                                                                                                                     
