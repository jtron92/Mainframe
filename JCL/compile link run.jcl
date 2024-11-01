//MATEDK01 JOB (MVS),'JORGE CINTRON',                          
//             MSGLEVEL=(1,1),                                 
//             MSGCLASS=H,                                     
//             CLASS=A,                                        
//             NOTIFY=&SYSUID                                  
//COBOL    EXEC PGM=IGYCRCTL,REGION=0M                         
//STEPLIB  DD DSNAME=IGY420.SIGYCOMP,DISP=SHR                  
//SYSIN    DD DSN=IBMUSER.ACOBOL.LIB(COBOL),DISP=SHR           
//SYSLIN   DD DSNAME=&&LOADSET,UNIT=SYSALLDA,                  
//            DISP=(MOD,PASS),SPACE=(TRK,(3,3)),               
//            DCB=(BLKSIZE=3200)                               
//SYSUT1   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))                  
//SYSUT2   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))                  
//SYSUT3   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))                  
//SYSUT4   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))                  
//SYSUT5   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))                  
//SYSUT6   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))                  
//SYSUT7   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))                  
//SYSLIN   DD DSN=IBMUSER.ALOAD,DISP=SHR                       
//SYSPRINT DD SYSOUT=*  
//LKED     EXEC PGM=IEWBLINK,COND=(8,LT,COBOL),REGION=0M        
//SYSLIB   DD DSNAME=CEE.SCEELKED,DISP=SHR                      
//         DD DSNAME=IBMUSER.ALOAD,DISP=SHR                     
//SYSPRINT DD SYSOUT=*                                          
//SYSLIN   DD DSNAME=&&LOADSET,DISP=(OLD,DELETE)                
//         DD DDNAME=SYSIN                                      
//SYSLMOD  DD DSN=IBMUSER.ALOAD(COBOL),DISP=SHR                 
//SYSUT1   DD UNIT=SYSALLDA,SPACE=(TRK,(10,10))                 
//SYSIN    DD DUMMY                                             
//RUN      EXEC PGM=COBOL                                       
//STEPLIB  DD DSN=IBMUSER.ALOAD(COBOL),DISP=SHR                 
//SYSPRINT DD SYSOUT=*                                          
//AMSDUMP  DD SYSOUT=*                                          
//SYSOUT   DD SYSOUT=*                                          
