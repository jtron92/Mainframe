I addded parmeters and made the jcl which was orginally a job at first to a proc with the parms in place you can just plugin what you need and it will execute on the bottom 
where it says STEP01 EXEC HLASMJOB then it goes thru the entire compile link and run process

 000010 //HLASMJO  JOB (MVS),                                   
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





HERE YOU CAN ADD MULITPLE COMPILE LINK AND RUNS 

ALSO YOU CAN ADD A OUTPUT FILE AS WELL 'ODSN' OUTPUT DATASET




         //HLASMJO  JOB (MVS),                                   
 000020 //             MSGLEVEL=(1,1),                                          
 000030 //             MSGCLASS=H,                                              
 000040 //             CLASS=A,                                                 
 000050 //             NOTIFY=&SYSUID                                           
 000100 //HLASMJOB PROC LOADLIB='IBMUSER.ALOAD',                                
 000200 //             SRCLIB='IBMUSER.HLASM.LIB',                              
 000300 //             MEMBER='TUES',                                           
 000400 //             ODSN='IBMUSER.APOD'                                      
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
 002600 //OFILE    DD DSN=&ODSN,DISP=SHR                                        
 002610 //SYSPRINT DD SYSOUT=*                                                  
 002620 //AMSDUMP  DD SYSOUT=*                                                  
 002630 //SYSOUT   DD SYSOUT=*                                                  
 003700 //         PEND                                                         
 003800 //STEP01   EXEC HLASMJOB                                                
 003900 //STEP02   EXEC HLASMJOB,                                               
 004000 //             LOADLIB=IBMUSER.ALOAD,                                   
 004100 //             SRCLIB=IBMUSER.HLASM.LIB, 
 004200 //             MEMBER=ONE,                                              
 004300 //             ODSN=IBMUSER.AVALON                                      
 ****** **************************** Bottom of Data ****************************



RESTARTS AND REFERBACKS BELOW EXAMPLE











********************************GOOD EXAMPLE****************************************************

Restarting the job 

has to the step from the execution of the procedure so 

find the exec procname 

STEP01 EXEC HLASMJOB 

OR 

STEP02 EXEC HLASMJOB

Next add what step you want that procedure to start on 

since we are compiling code start from the first step which is compile

so you can either start it from STEP01.COMPILE OR STEP02.COMPILE

next

go view STEP03 exec IBEGENER

SYSUT1 is going to copy from an existing dsn 

kinda the same logic 

find the procedure step

STEP02 

Then find the step you want to copy from so step named RUN , since we have already ran this code the loadlib is ready 

Next

OFILE since its poiting to the dsn

OFILE DD DSN=


SO LIKE THIS =*.STEP02.RUN.OFILE,DISP=SHR


 000000 //HLASMJO  JOB (MVS),                                   
 000020 //             MSGLEVEL=(1,1),                                          
 000030 //             MSGCLASS=H,                                              
 000040 //             CLASS=A,                                                 
 000050 //             NOTIFY=&SYSUID,RESTART=STEP02.COMPILE                    
 000100 //HLASMJOB PROC LOADLIB='IBMUSER.ALOAD',                                
 000200 //             SRCLIB='IBMUSER.HLASM.LIB',                              
 000300 //             MEMBER='TUES',                                           
 000400 //             ODSN='IBMUSER.APOD'                                      
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
 002600 //OFILE    DD DSN=&ODSN,DISP=SHR                                        
 002610 //SYSPRINT DD SYSOUT=*                                                  
 002620 //AMSDUMP  DD SYSOUT=*                                                  
 002630 //SYSOUT   DD SYSOUT=*                                                  
 003700 //         PEND                                                         
 003800 //STEP01   EXEC HLASMJOB                                                
 003900 //STEP02   EXEC HLASMJOB,                                               
 004000 //             LOADLIB=IBMUSER.ALOAD,                                   
 004100 //             SRCLIB=IBMUSER.HLASM.LIB,       
 004200 //             MEMBER=ONE,                                              
 004300 //             ODSN=IBMUSER.AVALON                                      
 004400 //STEP03   EXEC PGM=IEBGENER                                            
 004500 //SYSUT1   DD DSN=*.STEP02.RUN.OFILE,DISP=SHR                           
 004600 //SYSUT2   DD DSN=&SYSUID..ADRAKE,                                      
 004700 //            DISP=(OLD,CATLG,DELETE),                                  
 004800 //            UNIT=SYSDA,                                               
 004900 //            SPACE=(TRK,(2,2),RLSE),                                   
 005000 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=3200)             
 005100 //SYSIN    DD DUMMY                                                     
 005200 //SYSPRINT DD SYSOUT=*                                                  
 005300 //AMSDUMP  DD SYSOUT=*                                                  
 005400 //SYSOUT   DD SYSOUT=*                                                  
 ****** ***************************

                                                                       

                                                                       
