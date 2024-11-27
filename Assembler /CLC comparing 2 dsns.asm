Command ===>                                                  Scroll ===> CSR  
 ****** ***************************** Top of Data ******************************
 000001          CSECT                                                          
 000002          YREGS                                                          
 000003          SAVE (14,12)                                                   
 000004          STM  14,12,12(13)                                              
 000005          BASR 12,0                                                      
 000006          USING *,12                                                     
 000007          ST   13,SAVEA+4                                                
 000008          LA   13,SAVEA                                                  
 000009          OPEN (INPUT1,INPUT)                                            
 000010          OPEN (INPUT2,INPUT)                                            
 000011          OPEN (OFILE,OUTPUT)                                            
 000012 LOOP     GET  INPUT1,RECORD1                                            
 000013          GET  INPUT2,RECORD2                                            
 000014          C    RECORD1,RECORD2                                           
 000015          BE   MATCH                                                     
 000016          B    NOMATCH                                                   
 000017 MATCH    DS   0H                                                        
 000018          MVC  OUTREC,=CL80'MATCH FOUND'                                 
 000019          PUT  OFILE,OUTREC                 
 000020          B    EXIT                                                      
 000021 NOMATCH  DS   0H                                                        
 000022          MVC  OUTREC,=CL80'NO MATCH FOUND'                              
 000023          PUT  OFILE,OUTREC                                              
 000024          B    EXIT                                                      
 000025 EXIT     DS   0H                                                        
 000026          CLOSE (INPUT1)                                                 
 000027          CLOSE (INPUT2)                                                 
 000028          CLOSE (OFILE)                                                  
 000029          L    13,SAVEA+4                                                
 000030          RETURN (14,12),RC=0                                            
 000031          LM   14,12,12(13)                                              
 000032          LA   15,0                                                      
 000033          BR   14                                                        
 000034 SAVEA    DS   18F                                                       
 000035 OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=80,EODAD=EXIT        
 000036 INPUT1   DCB  MACRF=GM,DDNAME=INPUT1,DSORG=PS,LRECL=80                  
 000037 INPUT2   DCB  MACRF=GM,DDNAME=INPUT2,DSORG=PS,LRECL=80                  
 000038 RECORD1  DS   CL80            
 000039 RECORD2  DS   CL80                                                      
 000040 OUTREC   DS   CL80                                                      
 000041          END                                                            
 ****** **************************** Bottom of Data ****************************
                                                                                
                                                                                
                                                  
