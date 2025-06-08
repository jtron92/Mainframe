         CSECT                                        
         YREGS                                        
         SAVE (14,12)                                 
         STM  R14,R12,12(R13)                         
         BASR R12,0                                   
         USING *,12                                   
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
         MVC  OUTREC66,JCL66            
         PUT  OFILE,OUTREC66            
         MVC  OUTREC77,JCL77            
         PUT  OFILE,OUTREC77            
         MVC  OUTREC7,JCL7              
         PUT  OFILE,OUTREC7             
         MVC  OUTREC8,JCL8              
         PUT  OFILE,OUTREC8             
         MVC  OUTREC9,JCL9              
         PUT  OFILE,OUTREC9             
         MVC  OUTREC10,JCL10            
         PUT  OFILE,OUTREC10            
         MVC  OUTREC11,JCL11            
         PUT  OFILE,OUTREC11            
         MVC  OUTREC12,JCL12            
         PUT  OFILE,OUTREC12                                     
         MVC  OUTREC13,JCL13                                     
         PUT  OFILE,OUTREC13                                     
         MVC  OUTREC14,JCL14                                     
         PUT  OFILE,OUTREC14                                     
         MVC  OUTREC15,JCL15                                     
         PUT  OFILE,OUTREC15                                     
         CLOSE (OFILE)                                           
         L    R13,SAVEA+4                                        
         RETURN (14,12),RC=0                                     
         LM   R14,R12,12(R13)                                    
         LA   R15,0                                              
         BR   R14                                                
OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=80,EODAD=EXIT 
EXIT     DS   0H                                                 
SAVEA    DS   18F                                                
OUTREC1  DS   CL80                                               
JCL1     DC   CL80'//MATEDK11 JOB (MVS),'          
OUTREC2  DS   CL80                                             
JCL2     DC   CL80'//             MSGLEVEL=(1,1),'             
OUTREC3  DS   CL80                                             
JCL3     DC   CL80'//             MSGCLASS=H,'                 
OUTREC4  DS   CL80                                             
JCL4     DC   CL80'//             CLASS=A'                     
OUTREC5  DS   CL80                                             
JCL5     DC   CL80'//STEP01   EXEC PGM=IEBGENER'               
OUTREC6  DS   CL80                                             
JCL6     DC   CL80'//SYSUT1   DD *'                            
OUTREC66 DS   CL80                                             
JCL66    DC   CL80'HELLO WORLD'                                
OUTREC77 DS   CL80                                             
JCL77    DC   CL80'/*'                                         
OUTREC7  DS   CL80                                             
JCL7     DC   CL80'//SYSUT2   DD DSN=MATEDK.PAPER1,'           
OUTREC8  DS   CL80                                             
JCL8     DC   CL80'//            DISP=(NEW,CATLG,DELETE),'     
OUTREC9  DS   CL80                                                
JCL9     DC   CL80'//            UNIT=SYSDA,'                     
OUTREC10 DS   CL80                                                
JCL10    DC   CL80'//            SPACE=(TRK,(2,2),RLSE),'         
OUTREC11 DS   CL80                                                
JCL11    DC   CL80'//            DCB=(DSORG=PS,LRECL=80,RECFM=FB)'
OUTREC12 DS   CL80                                                
JCL12    DC   CL80'//SYSPRINT DD SYSOUT=*'                        
OUTREC13 DS   CL80                                                
JCL13    DC   CL80'//SYSOUT   DD SYSOUT=*'                        
OUTREC14 DS   CL80                                                
JCL14    DC   CL80'//AMSDUMP  DD SYSOUT=*'                        
OUTREC15 DS   CL80                                                
JCL15    DC   CL80'//SYSIN    DD DUMMY'                           
         END                                                      


this code above is to make a file that has JCL file that creates a dsn 

below is the compile bind and run jcl



//MATEDK91 JOB (MVS),                            
//             MSGLEVEL=(1,1),                                   
//             MSGCLASS=H,                                       
//             CLASS=A,                                          
//             NOTIFY=&SYSUID                                    
//STEP01   EXEC ASMACL                                           
//C.SYSIN  DD DSN=MATEDK.AHLASM(FILEX),DISP=SHR                  
//L.SYSLMOD DD DSN=&SYSUID..LOADLIB(FILEX),DISP=SHR              
//C.SYSLIB DD DSN=SYS1.MACLIB,DISP=SHR                           
//         DD DSN=MATEDK.AHLASM,DISP=SHR                         
//STEP02   EXEC PGM=FILEX                                        
//STEPLIB  DD DSN=&SYSUID..LOADLIB(FILEX),DISP=SHR               
//SYSPRINT DD SYSOUT=*                                           
//SYSOUT   DD SYSOUT=*                                           
//AMSDUMP  DD SYSOUT=*                                           
//OFILE    DD DSN=&SYSUID..AJCLX,                                
//            DISP=(NEW,CATLG,DELETE),                           
//            UNIT=SYSDA,                            
//            SPACE=(TRK,(2,2),RLSE),                
//            DCB=(DSORG=PS,LRECL=80,RECFM=FB)       
//STEP03   EXEC PGM=IKJEFT01                         
//SYSEXEC  DD DSN=MATEDK.AHLASM(ASMJCL),DISP=SHR     
//SYSTSPRT DD SYSOUT=*                               
//SYSTSIN  DD *                                      
  EXEC 'MATEDK.AHLASM(REXX1)'                        
/*                                                   
//SYSOUT   DD SYSOUT=*                               
//AMSDUMP  DD SYSOUT=*                               



below is the &SYSUID..AJCLX and the JCL that the Assmbler added

***************************** Top of Data ***********
//MATEDK11 JOB (MVS),                  
//             MSGLEVEL=(1,1),                       
//             MSGCLASS=H,                           
//             CLASS=A                               
//STEP01   EXEC PGM=IEBGENER                         
//SYSUT1   DD *                                      
HELLO WORLD                                          
/*                                                   
//SYSUT2   DD DSN=MATEDK.PAPER1,                     
//            DISP=(NEW,CATLG,DELETE),               
//            UNIT=SYSDA,                            
//            SPACE=(TRK,(2,2),RLSE),                
//            DCB=(DSORG=PS,LRECL=80,RECFM=FB)       
//SYSPRINT DD SYSOUT=*                               
//SYSOUT   DD SYSOUT=*                               
//AMSDUMP  DD SYSOUT=*                               
//SYSIN    DD DUMMY                                  




********************************* TOP OF DATA **********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O 
                                                                                
17.14.33 JOB04263 ---- WEDNESDAY, 28 AUG 2024 ----                              
17.14.33 JOB04263  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
17.14.33 JOB04263  IEF677I WARNING MESSAGE(S) FOR JOB MATEDK91 ISSUED           
17.14.33 JOB04263  ICH70001I MATEDK   LAST ACCESS AT 16:59:39 ON WEDNESDAY, AUGU
17.14.33 JOB04263  $HASP373 MATEDK91 STARTED - INIT 1    - CLASS A - SYS MATE   
17.14.33 JOB04263  IEF403I MATEDK91 - STARTED - TIME=17.14.33                   
17.14.34 JOB04263  -                                      -----TIMINGS (MINS.)--
17.14.34 JOB04263  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
17.14.34 JOB04263  -STEP01   C           00    284      0       .00       .00   
17.14.34 JOB04263  -STEP01   L           00     65      0       .00       .00   
17.14.34 JOB04263  -STEP02               00     31      0       .00       .00   
17.14.34 JOB04264  $HASP100 MATEDK11 ON INTRDR      JORGE.CINTRON         FROM J
17.14.34 JOB04264  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
17.14.34 JOB04263  -STEP03               00     82      0       .00       .00   

job Matedk11 executed 


here is madedk11

EDIT       MATEDK.PAPER1                                   C
Command ===>                                                
****** ***************************** Top of Data ***********
000001 HELLO WORLD                                          
****** **************************** Bottom of Data *********
                                                            
                                                            




