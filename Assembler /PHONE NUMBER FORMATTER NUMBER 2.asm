
***************************** Top of Data *****************
         CSECT                                             
         YREGS                                             
         SAVE  (14,12)                                     
         STM   R14,R12,12(R13)                             
         BASR  R12,0                                       
         USING *,R12                                       
         ST    R13,SAVEA+4                                 
         LA    R13,SAVEA                                   
         OPEN  (IFILE,INPUT,OFILE,OUTPUT)                  
         PUT   OFILE,TITLE0                                
         PUT   OFILE,TITLE1                                
         PUT   OFILE,TITLE5                                
LOOP     DS    0H                                          
         GET   IFILE,IPHONE                                
         MVC   OPHONE,=CL80''                              
         MVC   OPHONE+0(3),=CL3'333'                       
         MVI   OPHONE+3,C'-'                               
         MVC   OPHONE+4(3),=CL4'444'                               
         MVI   OPHONE+7,C'-'                                       
         MVC   OPHONE+8(4),=CL4'5555'                              
         PUT   OFILE,OPHONE                                        
         B     LOOP                                                
IFILE    DCB   MACRF=GM,DDNAME=IFILE,DSORG=PS,LRECL=80,EODAD=EXIT  
OFILE    DCB   MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=80             
EXIT     DS    0H                                                  
         PUT   OFILE,TITLE6                                        
         PUT   OFILE,TITLE2                                        
         PUT   OFILE,TITLE7                                        
         L     R13,SAVEA+4                                         
         CLOSE (IFILE,,OFILE)                                      
         LM    R14,R12,12(R13)                                     
         LA    R15,0                                               
         BR    R14                                                 
SAVEA    DS    18F                                                 
IPHONE   DS    0CL80                                               
         LM    R14,R12,12(R13)                         
         LA    R15,0                                   
         BR    R14                                     
SAVEA    DS    18F                                     
IPHONE   DS    0CL80                                   
TITLE0   DC    CL80'------------------------'          
TITLE1   DC    CL80'WELCOME TO THE MAINFRAME'          
TITLE5   DC    CL80'------------------------'          
TITLE6   DC    CL80'------------------------'          
TITLE2   DC    CL80'EXITING THE MAINFRAME'             
TITLE7   DC    CL80'------------------------'          
OPHONE   DS    0CL80                                   
         END                                           






 -----------------------------------------------------------------------
 SDSF OUTPUT DISPLAY MATEDKR  JOB06261  DSID   104 LINE 1       COLUMNS 
 COMMAND INPUT ===>                                            SCROLL ==
------------------------                                                
WELCOME TO THE MAINFRAME                                                
------------------------                                                
333-444-5555                                                            
------------------------                                                
EXITING THE MAINFRAME                                                   
------------------------                                                
******************************** BOTTOM OF DATA ************************
                                                                        

