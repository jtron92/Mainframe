


 000010 //HLASMJO  JOB (MVS),'JORGE CINTRON',                                   
 000020 //             MSGLEVEL=(1,1),                                          
 000030 //             MSGCLASS=H,                                              
 000040 //             CLASS=A,                                                 
 000050 //             NOTIFY=&SYSUID                                           
 000100 //HLASMJOB PROC LOADLIB='IBMUSER.ALOAD',                                
 000200 //             SRCLIB='IBMUSER.HLASM.LIB',                              
 000300 //             MEMBER='TUES'                                            
 000600 //COMPILE  EXEC PGM=ASMA90                                              
 000700 //SYSLIB   DD DSN=SYS1.MACLIB,DISP=SHR                                  
 000800 //SYSIN    DD DSN=&SRCLIB(&MEMBER),DISP=SHR                             
 000900 //SYSUT1   DD DSN=&&SYSUT1,SPACE=(4096,(120,120),,,ROUND),UNIT=VIO,     
 001000 //            DCB=BUFNO=1                                               
 001100 //SYSLIN   DD DSN=&&OBJ,DISP=(MOD,PASS),UNIT=VIO,                       
 001200 //            SPACE=(3096,(40,40),,,ROUND),                             
 001300 //            DCB=(LRECL=80,RECFM=FBS,BLKSIZE=3200,BUFNO=1)             
 001400 //SYSPRINT DD SYSOUT=*                                                  
 001500 //AMSDUMP  DD SYSOUT=*                                                  
 001600 //SYSOUT   DD SYSOUT=*                     
 001700 //LKED     EXEC PGM=HEWL                                                
 001800 //SYSLMOD  DD DSN=&LOADLIB(&MEMBER),DISP=SHR                            
 001900 //SYSLIN   DD DSN=&&OBJ,DISP=(OLD,DELETE)                               
 002000 //SYSUT1   DD DSN=&&SYSUT1,SPACE=(4096,(120,120),,,ROUND),UNIT=VIO,     
 002100 //            DCB=BUFNO=1                                               
 002200 //SYSPRINT DD SYSOUT=*                                                  
 002300 //AMSDUMP  DD SYSOUT=*                                                  
 002400 //SYSOUT   DD SYSOUT=*                                                  
 002500 //RUN      EXEC PGM=*.LKED.SYSLMOD                                      
 002600 //OFILE    DD DSN=&SYSUID..APOD,                                        
 002700 //            DISP=SHR                                                  
 003400 //SYSPRINT DD SYSOUT=*                                                  
 003500 //AMSDUMP  DD SYSOUT=*                                                  
 003600 //SYSOUT   DD SYSOUT=*                                                  
 003700 //         PEND                                                         
 003800 //STEP01   EXEC HLASMJOB                                                
 ****** **************************** Bottom of Data ****************************
                                                                       
