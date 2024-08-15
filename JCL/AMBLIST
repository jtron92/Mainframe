****** ***************************** Top of Data ****************
000100 //MATEDK10 JOB CLASS=A,                                   
000200 //             MSGLEVEL=(1,1),                            
000300 //             MSGCLASS=H,                                
000400 //             NOTIFY=&SYSUID                             
000500 //STEP01   EXEC PGM=AMBLIST                               
000600 //SYSPRINT DD SYSOUT=*                                    
000700 //SYSLIB   DD DSN=MATEDK.LOAD.LIB,DISP=SHR                
000800 //SYSIN    DD *                                           
000900   LISTIDR  MEMBER=HELLO                                   
001000 /*                                                        
001100 //SYSOUT   DD SYSOUT=*                                    
****** **************************** Bottom of Data **************
                                                                 
                                                                 
use LISTLOAD

****** ***************************** Top of Data ***************
000100 //MATEDK10 JOB CLASS=A,                                  
000200 //             MSGLEVEL=(1,1),                           
000300 //             MSGCLASS=H,                               
000400 //             NOTIFY=&SYSUID                            
000500 //STEP01   EXEC PGM=AMBLIST                              
000600 //SYSPRINT DD SYSOUT=*                                   
000700 //SYSLIB   DD DSN=MATEDK.LOAD.LIB,DISP=SHR               
000800 //SYSIN    DD *                                          
000900   LISTLOAD MEMBER=HELLO                                  
001000 /*                                                       
001100 //SYSOUT   DD SYSOUT=*                                   
****** **************************** Bottom of Data *************


The AMBLIST utility in IBM's z/OS is used to generate listings of load modules, program objects, and related information. It can provide detailed information about the contents of load modules, including entry points, sections, and individual machine instructions. This utility is helpful for debugging, verifying, and documenting load modules.


                                                                
                                                                
