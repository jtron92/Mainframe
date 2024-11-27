****** ***************************** Top of Data ******************************
 000001          CSECT                                                          
 000002          YREGS                                                          
 000003          SAVE (14,12)                                                   
 000004          STM  14,12,12(13)                                              
 000005          BASR 12,0                                                      
 000006          USING *,12                                                     
 000007          ST   13,SAVEA+4                                                
 000008          LA   13,SAVEA                                                  
 000009          OPEN (OFILE,(OUTPUT))                                          
 000010 LOOP     CLC  DATA1,DATA2                                               
 000011          BE   MATCH                                                     
 000012          B    NOMATCH                                                   
 000013 MATCH    DS   0H                                                        
 000014          MVC  MESSAGE,MSG2                                              
 000015          PUT  OFILE,MESSAGE                                             
 000016          B    EXIT                                                      
 000017 NOMATCH  MVC  MESSAGE,MSG1                                              
 000018          PUT  OFILE,MESSAGE                                             
 000019          B    EXIT     
 000020 EXIT     DS   0H                                                        
 000021          CLOSE (OFILE)                                                  
 000022          L    13,SAVEA+4                                                
 000023          RETURN (14,12),RC=0                                            
 000024          LM   14,12,12(13)                                              
 000025          LA   15,0                                                      
 000026          BR   14                                                        
 000027 OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=80,EODAD=EXIT        
 000028 SAVEA    DS   18F                                                       
 000029 MESSAGE  DS   CL80                                                      
 000030 DATA1    DC   CL80'HELLO1'                                              
 000031 DATA2    DC   CL80'HELLO1'                                              
 000032 MSG1     DC   CL80'NO MATCH'                                            
 000033 MSG2     DC   CL80'MATCH FOUND'                                         
 000034          END                      
  
