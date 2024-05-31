000100 //Z38515A JOB ,MSGLEVEL=(1,1),MSGCLASS=H,CLASS=A,NOTIFY=&SYSUID      
000300 //STEP01   EXEC PGM=IKJEFT01,PARM='%ANNAB'                           
000400 //SYSEXEC  DD DSN=Z38515.ALPHA,DISP=SHR                              
000500 //SYSTSPRT DD SYSOUT=*                                               
000600 //SYSTSIN  DD DUMMY                                                  
****** **************************** Bottom of Data *************************
                                                                            
                                                                            
                                                                            


FOR NOW THIS PARM IS PASSING THE FILE FROM Z38515.ALPHA , 

IN ORDER FOR THIS TO WORK USING IKJEFT01 

SYSEXEC DD DSN= HAS TO POINT WHERE THE FILE IS LOCATED , JUST ADD THE PDS FILE

EDIT       Z38515.ALPHA(ANNAB) - 01.02                    
Command ===>                                              
****** ***************************** Top of Data *********
000110 /*REXX*/                                           
000200 ADDRESS TSO "SUBMIT 'Z38515.ALPHA(ASM)'"           
000300 EXIT                                               
****** **************************** Bottom of Data *******


