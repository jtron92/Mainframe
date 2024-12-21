IKJEFT01 , performs the below functions

Submit TSO commands
BIND COBOL + DB2 Program
RUNS COBOL + DB2 Program
Unload DB2 Table

***********************************

WHEN USING IKJEFT01 

key things to make sure to add in the JCL 

SYSTSIN - used to specify the executable commands and subcommands

SYSTSPRT - used to control the output from teh background job




EXAMPLE 1 EXEC TSO COMMAND/ REXX 
****** ***************************** Top of Data ************************
000100 //MATEDK01 JOB CLASS=A,MSGLEVEL=(1,1),MSGCLASS=H,NOTIFY=&SYSUID   
000200 //STEP01   EXEC PGM=IKJEFT01                                      
000300 //SYSTSPRT DD SYSOUT=*                                            
000400 //SYSTSIN  DD *                                                   
000500   EXEC 'MATEDK.BIGBOOK(REX)'                                      
000600 /*                                                                
000800 //SYSUDUMP DD SYSOUT=*                                            
000900 //SYSEXEC  DD DSN=MATEDK.BIGBOOK,DISP=SHR                         
****** **************************** Bottom of Data **********************
                                                                         


Command ===>                                                  Scroll
****** ***************************** Top of Data *******************
000100 /*REXX*/                                                     
000200 SAY;SAY;SAY;                                                 
000400 ADDRESS TSO "SUBMIT 'MATEDK.BIGBOOK(COBCOMP)'"               
000500 IF RC = 0 THEN                                               
000600 SAY "SUBMIT SUCESSFULLY MAXCC = " RC                         
000800 ELSE                                                         
000900 SAY "JOB HAS FAILED"                                         
001100 EXIT                                                         
****** **************************** Bottom of Data *****************




example 2 
deletes files and memebers 
 ****** ***************************** Top of Data ***********************
 000100 //MATEDK01 JOB CLASS=A,MSGLEVEL=(1,1),MSGCLASS=H,NOTIFY=&SYSUID  
 000200 //STEP01   EXEC PGM=IKJEFT01                                     
 000300 //SYSTSPRT DD SYSOUT=*                                           
 000400 //SYSTSIN  DD *                                                  
 000500   DEL 'MATEDK.FORD'                                              
 000600 /*                                                               
 000800 //SYSUDUMP DD SYSOUT=*                                           
 000900 //SYSPRINT DD SYSOUT=*                                           
 ****** **************************** Bottom of Data *********************
                                                                         
                                                                        


 COMMAND INPUT ===>                               
IDC0550I ENTRY (A) MATEDK.FORD DELETED            
READY                                             
END                                               
******************************** BOTTOM OF DATA **

****** ***************************** Top of Data ***********************
000100 //MATEDK01 JOB CLASS=A,MSGLEVEL=(1,1),MSGCLASS=H,NOTIFY=&SYSUID  
000200 //STEP01   EXEC PGM=IKJEFT01                                     
000300 //SYSTSPRT DD SYSOUT=*                                           
000400 //SYSTSIN  DD *                                                  
000500   DEL 'MATEDK.BIGBOOK(TROY)'                                     
000600 /*                                                               
000800 //SYSUDUMP DD SYSOUT=*                                           
000900 //SYSPRINT DD SYSOUT=*                                           
****** **************************** Bottom of Data *********************
                                                                        
                                      

 COMMAND INPUT ===>                 
READY                               
  DEL 'MATEDK.BIGBOOK(TROY)'        
IDC0549I MEMBER TROY DELETED        
READY                               
END                                 
******************************** BOT
                                    
                                    

**********************************************************************************************************************************************************************************************************************



FOR USS



COPYING A FILE FROM THE SERVER INTO A NEW DSN 



 //READFILE JOB (MVS),'JORGE CINTRON',                                   
 000002 //             MSGLEVEL=(1,1),                                          
 000003 //             MSGCLASS=H,                                              
 000004 //             CLASS=A,                                                 
 000005 //             NOTIFY=&SYSUID                                           
 000006 //STEP10   EXEC PGM=IKJEFT01                                            
 000007 //SYSTSIN  DD *                                                         
 000008  OCOPY INDD(INFILE)-                                                    
 000009   OUTDD(OUTFILE)                                                        
 000010 /*                                                                      
 000011 //INFILE   DD PATH='/Z110S/usr/lpp/cobol/bin/test.cbl',                 
 000012 //            PATHOPTS=(ORDWR)                                          
 000013 //OUTFILE  DD DSN=IBMUSER.TRUMP,DISP=(NEW,CATLG,DELETE),                
 000014 //            SPACE=(TRK,(4,4),RLSE),                                   
 000015 //            UNIT=SYSDA,                                               
 000016 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)              
 000017 //SYSTSPRT DD SYSOUT=*                                                  
 000018 //SYSPRINT DD SYSOUT=*                                                  
 000019 //AMSDUMP  DD SYSOUT=*                                                  
 000020 //SYSOUT   DD SYSOUT=*                                 


The options specified in PATHOPTS control how the file is opened. Here’s a breakdown of the most common values:

    ORDONLY:
        Stands for Open for Read Only.
        Specifies that the file is opened in a mode where it can only be read, not modified.

    OWRONLY:
        Stands for Open for Write Only.
        Specifies that the file is opened in a mode where data can only be written to it, not read.

    ORDWR:
        Stands for Open for Read and Write.
        Specifies that the file is opened in a mode where it can be both read and written.

    OCREAT:
        Stands for Open with Create.
        Specifies that a new file should be created if it doesn’t already exist.

    OTRUNC:
        Stands for Open and Truncate.
        Specifies that if the file already exists, its content should be truncated (emptied) when it is opened.



                                                  



                                                                    
                                                                    
