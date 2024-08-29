         CSECT                             
         YREGS                             
         SAVE (14,12)                      
         STM  R14,R12,12(R13)              
         BASR R12,0                        
         USING *,R12                       
         ST   R13,SAVEA+4                  
         LA   R13,SAVEA                    
         OPEN (OFILE,(OUTPUT))             
         MVC  OUTREC1,JCL1                 
         PUT  OFILE,OUTREC1                
         MVC  OUTREC2,JCL2                 
         PUT  OFILE,OUTREC2                
         MVC  OUTREC3,JCL3                 
         PUT  OFILE,OUTREC3                
         MVC  OUTREC4,JCL4                 
         PUT  OFILE,OUTREC4                
         MVC  OUTREC5,JCL5  
         PUT  OFILE,OUTREC5                                     
         MVC  OUTREC6,JCL6                                      
         PUT  OFILE,OUTREC6                                     
         MVC  OUTREC7,JCL7                                      
         PUT  OFILE,OUTREC7                                     
         MVC  OUTREC8,JCL8                                      
         PUT  OFILE,OUTREC8                                     
         CLOSE (OFILE)                                          
         L    R13,SAVEA+4                                       
         RETURN (14,12),RC=0                                    
         LM   R14,R12,12(R13)                                   
         LA   R15,0                                             
         BR   R14                                               
OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=80,RECFM=FB  
SAVEA    DS   18F                                               
OUTREC1  DS   CL80                                              
JCL1     DC   CL80'       IDENTIFICATION DIVISION.'             
OUTREC2  DS   CL80                                              
JCL2     DC   CL80'       PROGRAM-ID. HERC01.'                      
OUTREC3  DS   CL80                                                  
JCL3     DC   CL80'       ENVIRONMENT DIVISION.'                    
OUTREC4  DS   CL80                                                  
JCL4     DC   CL80'       DATA DIVISION.'                           
OUTREC5  DS   CL80                                                  
JCL5     DC   CL80'       WORKING-STORAGE SECTION.'                 
OUTREC6  DS   CL80                                                  
JCL6     DC   CL80'       PROCEDURE DIVISION.'                      
OUTREC7  DS   CL80                                                  
JCL7     DC   CL80'           DISPLAY "HELLO WORLD".'               
OUTREC8  DS   CL80                                                  
JCL8     DC   CL80'           STOP RUN.'                            
         END                                                        


Now the JCL to complie bind and run the asm pgm

***************************** Top of Data ******************
//MATEDK01 JOB (MVS),'JORGE CINTRON',                       
//             MSGLEVEL=(1,1),                              
//             MSGCLASS=H,                                  
//             CLASS=A,                                     
//             NOTIFY=&SYSUID                               
//STEP01   EXEC ASMACL                                      
//C.SYSIN  DD DSN=MATEDK.AAZOZ(ASM2),DISP=SHR               
//L.SYSLMOD DD DSN=&SYSUID..LOADLIB(ASM2),DISP=SHR          
//C.SYSLIB DD DSN=SYS1.MACLIB,DISP=SHR                      
//         DD DSN=MATEDK.AAZOZ,DISP=SHR                     
//STEP02   EXEC PGM=ASM2                                    
//STEPLIB  DD DSN=&SYSUID..LOADLIB(ASM2),DISP=SHR           
//SYSPRINT DD SYSOUT=*                                      
//SYSOUT   DD SYSOUT=*                                      
//OFILE    DD DSN=MATEDK.XXA2,                              
//            DISP=(NEW,CATLG,DELETE),                      
//            UNIT=SYSDA,                                   
//            SPACE=(TRK,(2,2),RLSE),                           
//            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)      
//STEP099  EXEC PGM=IEBGENER                                    
//SYSUT1   DD DSN=MATEDK.XXA2,DISP=SHR                          
//SYSUT2   DD DSN=MATEDK.AAZOZ(COBOI),DISP=SHR                  
//SYSIN    DD DUMMY                                             
//SYSOUT   DD SYSOUT=*                                          
//SYSPRINT DD SYSOUT=*                                          
//AMSDUMP  DD SYSOUT=*                                          
//STEP04   EXEC IGYWCL                                          
//COBOL.SYSIN DD DSN=MATEDK.AAZOZ(COBOI),DISP=SHR               
//LKED.SYSLMOD DD DSN=MATEDK.LOAD.LIB(COBOI),DISP=SHR           
//STEP05   EXEC PGM=COBOL                                       
//STEPLIB  DD DSN=MATEDK.LOAD.LIB(COBOI),DISP=SHR               
//SYSPRINT DD SYSOUT=*                                          
//SYSOUT   DD SYSOUT=*                                          
//AMSDUMP  DD SYSOUT=*                                          


Since to compile you need a member i am using IEBGENER to create a member in an exist pds once this is completed in step099

then we can compile and run the cobol pgm in step04


********************************* TOP OF DATA *********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O
                                                                               
19.15.19 JOB04755 ---- THURSDAY,  29 AUG 2024 ----                             
19.15.19 JOB04755  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.           
19.15.19 JOB04755  IEF677I WARNING MESSAGE(S) FOR JOB MATEDK01 ISSUED          
19.15.19 JOB04755  ICH70001I MATEDK   LAST ACCESS AT 19:04:23 ON THURSDAY, AUGU
19.15.19 JOB04755  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE  
19.15.19 JOB04755  IEF403I MATEDK01 - STARTED - TIME=19.15.19                  
19.15.20 JOB04755  -                                      -----TIMINGS (MINS.)-
19.15.20 JOB04755  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  
19.15.20 JOB04755  -STEP01   C           00    276      0       .00       .00  
19.15.20 JOB04755  -STEP01   L           00     61      0       .00       .00  
19.15.20 JOB04755  -STEP02               00     29      0       .00       .00  
19.15.20 JOB04755  -STEP099              00     47      0       .00       .00  
19.15.20 JOB04755  -STEP04   COBOL       00    210      0       .00       .00  
19.15.21 JOB04755  -STEP04   LKED        00    159      0       .00       .00  


 ------------------------------------------
 SDSF OUTPUT DISPLAY MATEDK01 JOB04755  DSI
 COMMAND INPUT ===>                        
HELLO WORLD                                
******************************** BOTTOM OF 
                                           
                                           
