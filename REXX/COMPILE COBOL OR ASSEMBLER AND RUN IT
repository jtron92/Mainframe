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
SAY "ENTER THE SOURCE DATASET NAME (DSN):"                            
PULL SOURCEDSN                                                        
SAY "ENTER THE LOAD MODULE DATASET NAME (DSN):"                       
PULL LOADDSN                                                          
/* PROMPT FOR THE MEMBER NAME */                             
SAY "ENTER THE MEMBER NAME:"                                 
PULL MEMBERNAME                                              
/* PROMPT FOR THE DATASET TO STORE THE GENERATED JCL */      
SAY "ENTER THE DATASET NAME (DSN) TO STORE THE JCL:"         
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
SAY "JCL SUBMITTED SUCCESSFULLY."                           
EXIT                                                        
