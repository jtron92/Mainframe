***************************** Top of Data *****************
         CSECT                                             
         YREGS                                             
         SAVE (14,12)                                      
         STM  R14,R12,12(R13)                              
         BASR R12,0                                        
         USING *,R12                                       
         ST   R13,SAVEA+4                                  
         LA   R13,SAVEA                                    
         OPEN (IFILE,INPUT,OFILE,OUTPUT)                   
LOOP     DS   0H                                           
         GET  IFILE,INRECS                                 
         MVC  OUTRECS,=CL80''                              
         MVC  OUTRECS(2),INRECS+0                          
         MVI  OUTRECS+2,SLASH                              
         MVC  OUTRECS+3(2),INRECS+2                        
         MVI  OUTRECS+5,SLASH                              
         MVC  OUTRECS+6(4),INRECS+4                        
         PUT  OFILE,OUTRECS                                     
         B    LOOP                                              
IFILE    DCB  MACRF=GM,DDNAME=IFILE,DSORG=PS,LRECL=80,EODAD=EXIT
OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=80           
EXIT     DS   0H                                                
         CLOSE (IFILE,,OFILE)                                   
         L    R13,SAVEA+4                                       
         RETURN (14,12),RC=0                                    
         LM   R14,R12,12(R13)                                   
         LA   R15,0                                             
         BR   R14                                               
SAVEA    DS   18F                                               
INRECS   DS   CL80                                              
OUTRECS  DS   CL80                                              
SLASH    EQU  C'/'                                              
         END



INPUT FILE (IFILE)
EDIT       MATEDK.ASM.SRCLIB3(NUM) - 01.10      
Command ===>                                    
****** ***************************** Top of Data
000100 12291992                                 
****** **************************** Bottom of Da
                                                


OFILE POINTING TOWARDS SYSOUT IN SDSF

 ----------------------------------------------
 SDSF OUTPUT DISPLAY MATEDKR  JOB06728  DSID   
 COMMAND INPUT ===>                            
12/29/1992                                     
******************************** BOTTOM OF DATA
                                               
                                               


