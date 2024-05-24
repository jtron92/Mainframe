Command ===>                                             
****** ***************************** Top of Data ********
000100 /*REXX*/                                          
000110 CLRSCN                                            
000200 ADDRESS TSO "SUBMIT 'Z38515.ALPHA(FUTURE)'"       
000300 IF 'Z38515.ALPHA(SOLD2)' RC = 0 THEN              
000400 SAY "THIS JOB HAS COMPLETED SUCCESSFULLY"         
000500 ELSE                                              
000600 SAY "JOB HAS FAILED RUNNING BACKUP"               
000610 ADDRESS TSO "SUBMIT 'Z38515.ALPHA(ASM)'"                                               
000900 EXIT                                              
****** **************************** Bottom of Data ******
                                                         


IF A JOB FAILS IT WILL SUBMIT SAYING THE JOB FAILED AND SUBMITS A NEW JOB FOR BACKUP
