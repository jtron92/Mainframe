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
                                    
                                    
                                    
                                                  



                                                                    
                                                                    
