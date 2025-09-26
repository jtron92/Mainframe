/* REXX */                                                           
SAY;SAY;SAY;                                                         
ADDRESS TSO                                                          
/* PROMPT THE USER TO ASK WHAT DSN THEY WOULD LIKE TO COPY */        
SAY "WHAT IS THE DATASET YOU NEED TO BACKUP ?"                       
PULL DSN                                                             
DSN = STRIP(DSN)                                                     
IF DSN = "" THEN DO                                                  
   SAY "NO DATASET IN PLACE"                                         
   EXIT                                                              
END                                                                  
SAY "WHAT IS THE NAME OF THE NEW DATASET YOU WANT TO BACKUP ?"       
PULL BDSN                                                            
BDSN = STRIP(BDSN)                                                   
IF BDSN = "" THEN DO                                                 
   SAY "NO DATASET IN PLACE"                                         
   EXIT                                                              
END
ADDRESS TSO "LISTCAT ENTRIES('" || DSN || ".BACKUP.JCL')"           
IF RC = 0 THEN DO                                                   
SAY "DATASET '" || DSN || ".BACKUP.JCL' ALREADY EXITS."             
SAY "DO YOU WANT TO DELETE IT AND RECREATE IT? (YES/NO)"            
PULL ANSWER                                                         
ANSWER = STRIP(ANSWER)                                              
IF TRANSLATE(ANSWER) = 'YES' THEN DO                                
ADDRESS TSO "DELETE '" || DSN || ".BACKUP.JCL'"                     
SAY "DELETEING EIXITING DATASET."                                   
END                                                                 
ELSE DO                                                             
SAY "NOT DELETING. EXITIING."                                       
EXIT                                                                
END                                                                 
END                                                                 
SAY "GENERATING BACKUP JCL FOR DATASET" || DSN || ,                 
    "WITH BACKUP " || BDSN                                          
ADDRESS TSO "ALLOCATE DD (FALLDSN) DSN('" || DSN ||".BACKUP.JCL')", 
"NEW SPACE(1,1) LRECL(80) BLKSIZE(800) RECFM(F,B) DSORG(PS)"      
JCLLINES.1 = "//MATEDK01 JOB (MVS),"              
JCLLINES.2 = "//             MSGLEVEL=(1,1),"                     
JCLLINES.3 = "//             MSGCLASS=H,"                         
JCLLINES.4 = "//             CLASS=A,"                            
JCLLINES.5 = "//             NOTIFY=&SYSUID"                      
JCLLINES.6 = "//STEP01   EXEC PGM=IEBCOPY"                        
JCLLINES.7 = "//SYSUT1   DD DSN=" || DSN ||",DISP=SHR"            
JCLLINES.8 = "//SYSUT2   DD DSN=" || BDSN ||","                   
JCLLINES.9 = "//            DISP=(NEW,CATLG,DELETE),"             
JCLLINES.10 ="//            UNIT=SYSDA,"                          
JCLLINES.11 ="//            SPACE=(TRK,(2,2),RLSE),"              
JCLLINES.12 ="//  DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)"   
JCLLINES.13 ="//SYSIN    DD *"                                    
JCLLINES.14 ="  COPY INDD=SYSUT1,OUTDD=SYSUT2"                    
JCLLINES.15 ="/*"                                                 
JCLLINES.16 ="//SYSPRINT DD SYSOUT=*"                             
JCLLINES.17 ="//AMSDUMP  DD SYSOUT=*"                             
JCLLINES.18 ="//SYSOUT   DD SYSOUT=*"             
"EXECIO * DISKW FALLDSN (STEM JCLLINES. FINIS)"   
"FREE F(FALLDSN)"                                 
"SUBMIT '"|| DSN ||".BACKUP.JCL'"   
"DELETE '"|| DSN ||".BACKUP.JCL'"  
EXIT                                              
