/* REXX SCRIPT TO GENERATE BACKUP JCL WITH DSN PROMPTS */            
SAY;SAY;SAY;                                                         
ADDRESS TSO                                                          
/* PROMPT FOR THE DATASET (DSN) TO BACK UP */                        
SAY "PLEASE ENTER THE DATASET NAME (DSN) YOU WOULD LIKE TO BACK UP:" 
PULL DSN  /* PULL INPUT FROM THE USER */                             
/* CHECK IF THE USER ENTERED SOMETHING */                            
IF DSN = "" THEN DO                                                  
  SAY "NO DATASET NAME PROVIDED. EXITING."                           
  EXIT                                                               
END                                                                  
/* PROMPT FOR THE BACKUP DATASET NAME */                             
SAY "PLEASE ENTER THE NAME FOR THE BACKUP DATASET:"                  
PULL BACKUPDSN  /* PULL INPUT FROM THE USER */                       
/* CHECK IF THE USER ENTERED SOMETHING */                            
IF BACKUPDSN = "" THEN DO                                            
  SAY "NO BACKUP DATASET NAME PROVIDED. EXITING."                    
/* PROMPT FOR THE DATASET (DSN) TO BACK UP */                          
SAY "PLEASE ENTER THE DATASET NAME (DSN) YOU WOULD LIKE TO BACK UP:"   
PULL DSN  /* PULL INPUT FROM THE USER */                               
/* CHECK IF THE USER ENTERED SOMETHING */                              
IF DSN = "" THEN DO                                                    
  SAY "NO DATASET NAME PROVIDED. EXITING."                             
  EXIT                                                                 
END                                                                    
/* PROMPT FOR THE BACKUP DATASET NAME */                               
SAY "PLEASE ENTER THE NAME FOR THE BACKUP DATASET:"                    
PULL BACKUPDSN  /* PULL INPUT FROM THE USER */                         
/* CHECK IF THE USER ENTERED SOMETHING */                              
IF BACKUPDSN = "" THEN DO                                              
  SAY "NO BACKUP DATASET NAME PROVIDED. EXITING."                      
  EXIT                                                                 
END                                                                    
SAY "GENERATING BACKUP JCL FOR DATASET" DSN "WITH BACKUP DSN" BACKUPDSN
/* ALLOCATE THE OUTPUT DATASET FOR THE JCL */                          
"ALLOCATE DD(OUTDSN) DSN('"DSN".BACKUP.JCL')",                   
"NEW SPACE(1,1) LRECL(80) RECFM(F,B) UNIT(SYSDA) TRACKS"         
/* OPEN OUTPUT FILE */                                           
"EXECIO * DISKW OUTDSN (STEM JCLLINES."                          
/* GENERATE JCL FOR THE USER-SPECIFIED DSNS */                   
JCLLINES.1 = "//MATEDK01 JOB (BACKUP),"                          
JCLLINES.2 = "//        CLASS=A,MSGCLASS=H,NOTIFY=&SYSUID,"      
JCLLINES.3 = "//        MSGLEVEL=(1,1)"                          
JCLLINES.4 = "//STEP01 EXEC PGM=IEBCOPY"                         
JCLLINES.5 = "//SYSPRINT DD SYSOUT=*"                            
JCLLINES.6 = "//SYSUT1 DD DSN=" || DSN || ",DISP=SHR"            
JCLLINES.7 = "//SYSUT2 DD DSN=" || BACKUPDSN || ",DISP=(,CATLG),"
JCLLINES.8 = "//    UNIT=SYSDA,SPACE=(TRK,(8,8,8),RLSE),"        
JCLLINES.9 = "//    DCB=(LRECL=80,BLKSIZE=800,RECFM=FB,DSORG=PO)"
JCLLINES.10 ="//SYSIN DD *"                                      
JCLLINES.11 =" COPY INDD=SYSUT1,OUTDD=SYSUT2"                    
JCLLINES.12 ="/*"                                                
JCLLINES.13 ="//SYSOUT DD SYSOUT=*"                              
JCLLINES.14 ="//AMSDUMP DD SYSOUT=*"                   
/* WRITE JCL TO FILE */                                
"EXECIO 14 DISKW OUTDSN (STEM JCLLINES. FINIS"         
/* CLOSE THE FILE */                                   
SAY "JCL GENERATED AND SAVED IN" DSN".BACKUP.JCL"      
/* SUBMIT THE JCL FOR EXECUTION */                     
SAY "SUBMITTING THE JCLLINES..."                       
"SUBMIT '"DSN".BACKUP.JCL'"                            
SAY "JCL SUBMITTED SUCESSFULLY."                       
EXIT                                                   
