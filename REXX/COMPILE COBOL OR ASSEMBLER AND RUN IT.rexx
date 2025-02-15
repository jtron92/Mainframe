/* REXX PROGRAM TO GENERATE AND SUBMIT COBOL OR ASSEMBLER JCL */      
SAY;SAY;SAY;                                                          
ADDRESS TSO                                                           
/* PROMPT THE USER TO CHOOSE COBOL (C) OR ASSEMBLER (A) */            
SAY "ENTER 'C' FOR COBOL OR 'A' FOR ASSEMBLER:"                       
PULL PGMTYPE                                                          
/* CHECK IF THE USER ENTERED A VALID CHOICE */                        
IF TRANSLATE(PGMTYPE) <> 'C' & TRANSLATE(PGMTYPE) <> 'A' THEN DO      
SAY "INVALID CHOICE. PLEASE ENTER 'C' FOR COBOL OR 'A' FOR ASSEMBLER."
EXIT                                                                  
END                                                                   
/* PROMPT FOR THE SOURCE AND LOAD MODULE DSNS */                      
SAY "ENTER THE SOURCE CODE DATASET NAME:"                            
PULL SOURCEDSN                                                        
SAY "ENTER THE LOAD LIBRARY DATASET NAME:"                       
PULL LOADDSN                                                          
/* PROMPT FOR THE MEMBER NAME */                             
SAY "ENTER THE MEMBER NAME:"                                 
PULL MEMBERNAME                                              
/* PROMPT FOR THE DATASET TO STORE THE GENERATED JCL */      
SAY "ENTER A DATASET NAME TO COMPILE, LINK AND RUN YOUR CODE."       
PULL JCLDSN                                                  
/* CHECK IF THE USER ENTERED VALID INPUT */                  
IF SOURCEDSN = "" |,                                         
   LOADDSN   = "" |,                                         
  MEMBERNAME = "" |,                                         
   JCLDSN = "" THEN DO                                       
   SAY "ONE OR MORE REQUIRED INPUTS ARE MISSING. EXITING."   
   EXIT                                                      
END                                                          
/* ALLOCATE THE OUTPUT DATASET FOR THE JCL */                
RC = 0                                                       
"ALLOCATE DD(ZZZDSN) DSN('" || JCLDSN || "')",               
"NEW SPACE(1,1) LRECL(80)",                                         
"RECFM(F,B) UNIT(SYSDA) BLKSIZE(800) DSORG(PS) TRACKS"              
IF RC <> 0 THEN DO                                                  
   SAY "UNABLE TO ALLOCATE DATASET. IT MIGHT BE IN USE OR LOCKED."  
TSOUSER = SYSVAR('SYSUID')                                          
TEMPDSN = "'" || TSOUSER || ".TEMP.JCL'"                            
"ALLOCATE DD (ZZZDSN) DSN(" || TEMPDSN || ")",                      
"NEW LIKE (" || AFILE1 || ")"                                       
IF RC <> 0 THEN DO                                                  
SAY "UNABLE TO ALLOCATE DATASET."                                   
EXIT                                                                
END                                                                 
JCLDSN = TEMPDSN                                                    
SAY "TEMP DATASET" JCLDSN " HAS BEEN ALLOCATED FOR THE JCL STORAGE" 
END                                                                 
/* GENERATE COBOL JCL */                                            
IF TRANSLATE(PGMTYPE) = 'C' THEN DO                                 
JCLLINES.1 = "//MATEDK01 JOB (MVS),'JORGE CINTRON',"             
JCLLINES.2 = "//             MSGLEVEL=(1,1),"                    
JCLLINES.3 = "//             MSGCLASS=H,"                        
JCLLINES.4 = "//             CLASS=A,"                           
JCLLINES.5 = "//             NOTIFY=&SYSUID"                     
JCLLINES.6 = "//STEP01   EXEC IGYWCL"                            
JCLPART1   = "//COBOL.SYSIN DD DSN=" || SOURCEDSN                
JCLPART2   = "(" || MEMBERNAME || "),DISP=SHR"                   
JCLLINES.7 = JCLPART1 || JCLPART2                                
JCLPART3   = "//LKED.SYSLMOD DD DSN=" || LOADDSN                 
JCLPART4   = "(" || MEMBERNAME || "),DISP=SHR"                   
JCLLINES.8 = JCLPART3 || JCLPART4                                
JCLLINES.9 = "//STEP02     EXEC PGM=" || MEMBERNAME              
JCLPART5   = "//STEPLIB  DD DSN=" || LOADDSN                     
JCLPART6   = "(" || MEMBERNAME || "),DISP=SHR"                   
JCLLINES.10 = JCLPART5  || JCLPART6                              
JCLLINES.11 ="//SYSPRINT DD SYSOUT=*"                            
JCLLINES.12 ="//SYSOUT   DD SYSOUT=*"                        
JCLLINES.14 ="//AMSDUMP  DD SYSOUT=*"                        
END                                                          
ELSE IF TRANSLATE(PGMTYPE) = 'A' THEN DO                     
JCLLINES.1 = "//MATEDK01 JOB (MVS),'JORGE CINTRON',"         
JCLLINES.2 = "//             MSGLEVEL=(1,1),"                
JCLLINES.3 = "//             MSGCLASS=H,"                    
JCLLINES.4 = "//             CLASS=A,"                       
JCLLINES.5 = "//             NOTIFY=&SYSUID"                 
JCLLINES.6 = "//STEP01   EXEC ASMACL"                        
JCLPART1   = "//C.SYSIN  DD DSN=" || SOURCEDSN               
JCLPART2   = "(" || MEMBERNAME || "),DISP=SHR"               
JCLLINES.7 = JCLPART1 || JCLPART2                            
JCLPART3   = "//L.SYSLMOD DD DSN=" || LOADDSN                
JCLPART4   = "(" || MEMBERNAME || "),DISP=SHR"               
JCLLINES.8 = JCLPART3 || JCLPART4                            
JCLLINES.9 = "//STEP02     EXEC PGM=" || MEMBERNAME          
JCLPART5   = "//STEPLIB  DD DSN=" || LOADDSN                
JCLPART6   = "(" || MEMBERNAME || "),DISP=SHR"              
JCLLINES.10 = JCLPART5 || JCLPART6                          
JCLLINES.11 ="//SYSPRINT DD SYSOUT=*"                       
JCLLINES.12 ="//SYSOUT   DD SYSOUT=*"                       
JCLLINES.14 ="//AMSDUMP  DD SYSOUT=*"                       
END                                                         
"EXECIO * DISKW ZZZDSN (STEM JCLLINES. FINIS)"              
"FREE DD(ZZZDSN)"      
SAY "SUBMITTING THE JCL FOR EXECUTION"                      
"SUBMIT '"JCLDSN"'"                                         
SAY "JCL SUBMITTED SUCCESSFULLY."  "MAXCC =" RC                            
EXIT                                                        






/* REXX */                                                            
SAY;SAY;SAY;                                                          
ADDRESS TSO                                                           
/* PROMPT THE USER TO ASK WHAT PGMTYPE? */                            
SAY "ENTER 'C' FOR COBOL OR 'A' FOR ASSEMBLER"                        
PULL PGMTYPE                                                          
IF TRANSLATE(PGMTYPE) <> 'C' & TRANSLATE(PGMTYPE) <> 'A' THEN DO      
SAY "INVALID CHOICE. PLEASE ENTER 'C' FOR COBOL OR 'A' FOR ASSEMBLER."
EXIT                                                                  
END                                                                   
/* PROMPT THE USER TO ENTER THE DSN SOURCE */                         
SAY "ENTER THE DSN SOURCE"                                            
PULL DSN                                                              
IF DSN = "" THEN DO                                                   
SAY "NO DSN"                                                          
EXIT                                                                  
END                                                                   
/* PROMPT THE USER TO ENTER THE LOAD MODULE */   
SAY "ENTER THE LIBRARY DSN"                      
PULL LDSN                                                     
IF LDSN = " " THEN DO                                         
SAY "NO DSN"                                                  
EXIT                                                          
END                                                           
/* PROMPT THE USER TO ENTER THE MEMBER */                     
SAY "ENTER THE MEMBER"                                        
PULL MEMBER                                                   
IF MEMBER = " " THEN DO                                       
EXIT                                                          
END                                                           
/* PROMPT THE USER TO CREATE A NEW DSN TO SUBMIT */           
SAY "ENTER THE NEW DSN TO COMPILE AND RUN YOUR PGM"           
PULL JCLDSN                                                   
IF JCLDSN = " " THEN DO                                       
SAY "ONE OR MORE REQUIRED INPUTS ARE MISSING. EXITING."       
EXIT                                                          
END                                                           
"ALLOCATE DD(OUTDSN) DSN('" || JCLDSN ||".TEMP.JCL')",        
"NEW SPACE(1,1) LRECL(80)",                                   
"RECFM(F,B) UNIT(SYSDA) BLKSIZE(800) DSORG(PS) TRACKS"               
IF TRANSLATE(PGMTYPE) = 'C' THEN DO                                  
JCL.1 = "//MATEDK01 JOB (MVS),'JORGE CINTRON',"                      
JCL.2 = "//             MSGLEVEL=(1,1),"                             
JCL.3 = "//             MSGCLASS=H,"                                 
JCL.4 = "//             CLASS=A,"                                    
JCL.5 = "//             NOTIFY=&SYSUID"                              
JCL.6 = "//         JCLLIB ORDER=IGY410.SIGYPROC"                    
JCL.7 = "//STEP01   EXEC IGYWCL,LNGPRFX='IGY410'"                    
JCL1  = "//COBOL.SYSIN DD DSN=" || DSN                               
JCL2  = "(" || MEMBER || "),DISP=SHR"                                
JCL.8 = JCL1 || JCL2                                                 
JCL3  = "//LKED.SYSLMOD DD DSN=" || LDSN                             
JCL4  = "(" || MEMBER || "),DISP=SHR"                                
JCL.9 = JCL3 || JCL4                                                 
JCL.10 ="//STEP02   EXEC PGM=" || MEMBER                             
JCL.11 ="//STEPLIB  DD DSN=" || LDSN || "(" || MEMBER || "),DISP=SHR"
JCL.12 ="//SYSPRINT DD SYSOUT=*"                                     
JCL.13 ="//SYSOUT   DD SYSOUT=*"                                     
JCL.14 ="//AMSDUMP  DD SYSOUT=*"                                     
END                                                                   
ELSE IF TRANSLATE(PGMTYPE) = 'A' THEN DO                              
JCL.1 = "//MATEDK88 JOB (MVS),'JORGE CINTRON',"                       
JCL.2 = "//             MSGLEVEL=(1,1),"                              
JCL.3 = "//             MSGCLASS=H,"                                  
JCL.4 = "//             CLASS=A,"                                     
JCL.5 = "//             NOTIFY=&SYSUID"                               
JCL.6 = "//STEP01   EXEC ASMACL"                                        
JCL.7 = "//C.SYSIN  DD DSN=" || DSN || "(" || MEMBER || "),DISP=SHR"    
JCL.8 = "//L.SYSLMOD DD DSN=" || LDSN || "(" || MEMBER || "),DISP=SHR"  
JCL.9 = "//C.SYSLIB DD DSN=SYS1.MACLIB,DISP=SHR"                        
JCL.10 ="//STEP02   EXEC PGM=" || MEMBER                                
JCL.11 ="//STEPLIB  DD DSN=" || LDSN || "(" || MEMBER || "),DISP=SHR"   
JCL.12 ="//SYSPRINT DD SYSOUT=*"                                        
JCL.13 ="//SYSOUT   DD SYSOUT=*"                                        
JCL.14 ="//AMSDUMP  DD SYSOUT=*"                                                                        
END                                                                   
"EXECIO * DISKW OUTDSN (STEM JCL. FINIS)"                             
"FREE F(OUTDSN)"                                                      
"SUBMIT '"|| JCLDSN ||".TEMP.JCL'"                                    
"DELETE '"|| JCLDSN ||".TEMP.JCL'"                                    
EXIT                                             




******************************MASTER****REXX***SCRIPT***************************************************



/* REXX */
SAY;SAY;SAY;
ADDRESS TSO
/* PROMPT THE USER TO ASK WHAT PGMTYPE? */
SAY "ENTER 'C' FOR COBOL OR 'A' FOR ASSEMBLER"
PULL PGMTYPE
IF TRANSLATE(PGMTYPE) <> 'C' & TRANSLATE(PGMTYPE) <> 'A' THEN DO
SAY "INVALID CHOICE. PLEASE ENTER 'C' FOR COBOL OR 'A' FOR ASSEMBLER."
EXIT
END
/* PROMPT THE USER TO ENTER THE DSN SOURCE */
SAY "ENTER THE DSN SOURCE"
PULL DSN
IF DSN = "" THEN DO
SAY "NO DSN"
EXIT
END
/* PROMPT THE USER TO ENTER THE LOAD MODULE */
SAY "ENTER THE LIBRARY DSN"
PULL LDSN
IF LDSN = " " THEN DO
SAY "NO DSN"
EXIT
END
/* PROMPT THE USER TO ENTER THE MEMBER */
SAY "ENTER THE MEMBER"
PULL MEMBER
IF MEMBER = " " THEN DO
EXIT
END
/* PROMPT THE USER TO CREATE A NEW DSN TO SUBMIT */
SAY "ENTER THE NEW DSN TO COMPILE AND RUN YOUR PGM"
PULL JCLDSN
IF JCLDSN = " " THEN DO
SAY "ONE OR MORE REQUIRED INPUTS ARE MISSING. EXITING."
EXIT
END
"ALLOCATE DD(OUTDSN) DSN('" || JCLDSN ||".TEMP.JCL')",
"NEW SPACE(1,1) LRECL(80)",
"RECFM(F,B) UNIT(SYSDA) BLKSIZE(800) DSORG(PS) TRACKS"
IF TRANSLATE(PGMTYPE) = 'C' THEN DO
JCL.1 = "//COBRUN01 JOB (MVS),'JORGE CINTRON',"
JCL.2 = "//             MSGLEVEL=(1,1),"
JCL.3 = "//             MSGCLASS=H,"
JCL.4 = "//             CLASS=A,"
JCL.5 = "//             NOTIFY=&SYSUID"
JCL.6 = "//COMPILE  EXEC PGM=IGYCRCTL,REGION=0M"
JCL.7 = "//STEPLIB  DD DSN=IGY520.SIGYCOMP,DISP=SHR"
JCL.8 = "//SYSIN    DD DSN=" || DSN || "(" || MEMBER || "),DISP=SHR"
JCL.9 = "//SYSLIN   DD DSN=&&LOADSET,DISP=(MOD,PASS),"
JCL.10 ="//            SPACE=(CYL,(3,3)),UNIT=SYSALLDA"
JCL.11 ="//SYSUT1   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.12 ="//SYSUT2   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.13 ="//SYSUT3   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.14 ="//SYSUT4   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.15 ="//SYSUT5   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.16 ="//SYSUT6   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.17 ="//SYSUT7   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.18 ="//SYSUT8   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.19 ="//SYSUT9   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.20 ="//SYSUT10  DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.21 ="//SYSUT11  DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.22 ="//SYSUT12  DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.23 ="//SYSUT13  DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.24 ="//SYSUT14  DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.25 ="//SYSUT15  DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.26 ="//SYSMDECK DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))"
JCL.27 ="//SYSPRINT DD SYSOUT=*"
JCL.28 ="//SYSOUT   DD SYSOUT=*"
JCL.29 ="//AMSDUMP  DD SYSOUT=*"
JCL.30 ="//LKED     EXEC PGM=IEWBLINK"
JCL.31 ="//SYSLMOD  DD DSN=" || LDSN || "(" || MEMBER || "),DISP=SHR"
JCL.32 ="//SYSPRINT DD SYSOUT=*"
JCL.33 ="//SYSOUT   DD SYSOUT=*"
JCL.34 ="//AMSDUMP  DD SYSOUT=*"
JCL.35 ="//SYSLIN   DD DSN=&&LOADSET,DISP=(OLD,DELETE)"
JCL.36 ="//SYSLIB   DD DSN=CEE.SCEELKED,DISP=SHR"
JCL.37 ="//SYSUT1   DD DSN=&&SYSUT1,SPACE=(CYL,(1,1)),UNIT=SYSALLDA"
JCL.38 ="//STEP02   EXEC PGM=" || MEMBER
JCL.39 ="//STEPLIB  DD DSN=" || LDSN || "(" || MEMBER || "),DISP=SHR"
JCL.40 ="//SYSPRINT DD SYSOUT=*"
JCL.41 ="//SYSOUT   DD SYSOUT=*"
END
ELSE IF TRANSLATE(PGMTYPE) = 'A' THEN DO
JCL.1 = "//ASMRUN01 JOB (MVS),'JORGE CINTRON',"
JCL.2 = "//             MSGLEVEL=(1,1),"
JCL.3 = "//             MSGCLASS=H,"
JCL.4 = "//             CLASS=A,"
JCL.5 = "//             NOTIFY=&SYSUID"
JCL.6 = "//COMPILE  EXEC PGM=ASMA90"
JCL.7 = "//SYSIN    DD DSN=" || DSN || "(" || MEMBER || "),DISP=SHR"
JCL.8 = "//SYSLIB   DD DSN=SYS1.MACLIB,DISP=SHR"
JCL.9 = "//SYSUT1   DD DSN=&&SYSUT1,SPACE=(4080,(120,120),,,ROUND),"
JCL.10 ="//            DCB=BUFNO=1,UNIT=VIO"
JCL.11 ="//SYSLIN   DD DSN=&&OBJ,DISP=(MOD,PASS),UNIT=VIO,"
JCL.12 ="//            SPACE=(3080,(40,40),,,ROUND),"
JCL.13 ="//            DCB=(LRECL=80,RECFM=FBS,BUFNO=1,BLKSIZE=3200)"
JCL.14 ="//SYSPRINT DD SYSOUT=*"
JCL.15 ="//AMSDUMP  DD SYSOUT=*"
JCL.16 ="//SYSOUT   DD SYSOUT=*"
JCL.17 ="//LKED     EXEC PGM=HEWL"
JCL.18 ="//SYSLMOD  DD DSN=" || LDSN || "(" || MEMBER || "),DISP=SHR"
JCL.19 ="//SYSLIB   DD DSN=SYS1.MACLIB,DISP=SHR"
JCL.20 ="//SYSUT1   DD DSN=&&SYSUT1,SPACE=(4080,(120,120),,,ROUND),"
JCL.21 ="//            UNIT=VIO,DCB=BUFNO=1"
JCL.22 ="//SYSPRINT DD SYSOUT=*"
JCL.23 ="//AMSDUMP  DD SYSOUT=*"
JCL.24 ="//SYSOUT   DD SYSOUT=*"
JCL.25 ="//SYSLIN   DD DSN=&&OBJ,DISP=(OLD,DELETE)"
JCL.26 ="//STEP02   EXEC PGM=" || MEMBER
JCL.27 ="//STEPLIB  DD DSN=" || LDSN || "(" || MEMBER || "),DISP=SHR"
JCL.28 ="//SYSPRINT DD SYSOUT=*"
JCL.29 ="//SYSOUT   DD SYSOUT=*"
JCL.30 ="//AMSDUMP  DD SYSOUT=*"
END
"EXECIO * DISKW OUTDSN (STEM JCL. FINIS)"
"FREE F(OUTDSN)"
"SUBMIT '"|| JCLDSN ||".TEMP.JCL'"
"DELETE '"|| JCLDSN ||".TEMP.JCL'"
EXIT
