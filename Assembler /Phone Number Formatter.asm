***************************** Top of Data *****
         CSECT                                 
         YREGS                                 
         SAVE (14,12)                          
         STM  R14,R12,12(R13)                  
         BASR 12,0                             
         USING *,R12                           
         ST   R13,SAVEA+4                      
         LA   R13,SAVEA                        
         OPEN (IFILE,INPUT,OFILE,OUTPUT)       
         PUT  OFILE,PTITLE1                    
         PUT  OFILE,PTITLE                     
         PUT  OFILE,PTITLE2                    
LOOP     EQU  *                                
         GET  IFILE,INRECS                            GET RECORDS FROM INRECS WHICH PULLS FROM IFILE    /// INRECS IS JUST THE INPUT RECORD AREA
         MVC  OUTRECS,=CL80''                         CLEARS OUTPUT CL OF 80 
         MVC  OUTRECS+0(3),IFNUM                      SO THE FIRST LINE STARTS AT ZERO THEN WE ADD FROM IFNUM WHICH IS THE FIRST 3 DIGITS OF THE PHONE NUMBER (3)   706
         MVC  OUTRECS+3(1),=C'-'                      IN POSITION 3 WE ADD 1 VALUE CHARACTER LENGTH OF THE HYPHEN                                                    -
         MVC  OUTRECS+4(3),ISNUM                      NOW WE START IN LINE 4 AND ADD THE VALUE OF 3 DIGITS FROM ISNUM                                               587
         MVC  OUTRECS+7(1),=C'-'                      STARTING AT LINE 7 ADDING 1 VALUE WHICH IS THE HYPHEN                                                          -
         MVC  OUTRECS+8(4),ILNUM                      LASTLY START FROM LINE 8 ADD VALUE OF 4 WHICH IS FROM ILNUM                                                   1030              
         PUT  OFILE,OUTRECS                           PUT THIS DATA INTO THE OUTPUT RECORD AREA CALLED OUTRECS INTO OFILE WHICH IS THE OUTPUT FILE             
         B    LOOP                                                 
IFILE    DCB  MACRF=GM,DDNAME=IFILE,DSORG=PS,LRECL=80,EODAD=EXIT   
OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=80              
EXIT     EQU  *                                                    
         CLOSE (IFILE,,OFILE)                                      
         L    R13,SAVEA+4                                          
         LM   R14,R12,12(R13)                                      
         RETURN (14,12),RC=0                                       
         LA   R15,0                                                
         BR   R14                                                  
SAVEA    DS   18F                                                  
INRECS   DS   0CL80                                                
IFNUM    DS   CL3                                                  
ISNUM    DS   CL3                                                  
ILNUM    DS   CL4                                          
PTITLE1  DC   CL80'---------------------------------'      
PTITLE   DC   CL80'P H O N E   N U M B E R   B O O K'      
PTITLE2  DC   CL80'---------------------------------'      
OUTRECS  DS   0CL80                                        
         END                                               
**************************** Bottom of Data ***************

INPUT FILE

EDIT       MATEDK.ASM.SRCLIB10(NOO) - 01.03       
Command ===>                                      
****** ***************************** Top of Data *
000100 7065871030                                 
****** **************************** Bottom of Data
                                                  
                                                  


SDSF : 
 -----------------------------------------------------------
 SDSF OUTPUT DISPLAY MATEDKR  JOB03801  DSID   104 LINE 1   
 COMMAND INPUT ===>                                         
---------------------------------                           
P H O N E   N U M B E R   B O O K                           
---------------------------------                           
706-587-1030                                                
******************************** BOTTOM OF DATA ************



ANOTHER WAY TO WRITE THIS SAME OUTPUT : 

***************************** Top of Data ***********************
         CSECT                                                   
         YREGS                                                   
         SAVE (14,12)                                            
         STM  R14,R12,12(R13)                                    
         BASR 12,0                                               
         USING *,R12                                             
         ST   R13,SAVEA+4                                        
         LA   R13,SAVEA                                          
         OPEN (IFILE,INPUT,OFILE,OUTPUT)                         
         PUT  OFILE,PTITLE1                                      
         PUT  OFILE,PTITLE                                       
         PUT  OFILE,PTITLE2                                      
LOOP     EQU  *                                                  
         GET  IFILE,INRECS                                       
         MVC  OUTRECS,=CL80''                                    
         MVC  OFNUM,IFNUM                                        
         MVC  OUTRECS+3(1),=C'-'                                 
         MVC  OSNUM,ISNUM                                            
         MVC  OUTRECS+7(1),=C'-'                                     
         MVC  OLNUM,ILNUM                                            
         PUT  OFILE,OUTRECS                                          
         B    LOOP                                                   
IFILE    DCB  MACRF=GM,DDNAME=IFILE,DSORG=PS,LRECL=80,EODAD=EXIT     
OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=80                
EXIT     EQU  *                                                      
         CLOSE (IFILE,,OFILE)                                        
         L    R13,SAVEA+4                                            
         LM   R14,R12,12(R13)                                        
         RETURN (14,12),RC=0                                         
         LA   R15,0                                                  
         BR   R14                                                    
SAVEA    DS   18F                                                    
INRECS   DS   0CL80                                                  
IFNUM    DS   CL3                                                    
ISNUM    DS   CL3                                                    
ILNUM    DS   CL4                                            
PTITLE1  DC   CL80'---------------------------------'        
PTITLE   DC   CL80'P H O N E   N U M B E R   B O O K'        
PTITLE2  DC   CL80'---------------------------------'        
OUTRECS  DS   0CL80                                          
OFNUM    DS   CL3                                            
         DS   CL1                                            
OSNUM    DS   CL3                                            
         DS   CL1                                            
OLNUM    DS   CL4                                            
         END                                                 
**************************** Bottom of Data *****************


                                                            
