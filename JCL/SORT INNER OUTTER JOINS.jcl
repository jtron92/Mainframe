****** ***************************** Top of Data ******************************
000001 //BROLYLLS JOB CLASS=A,                                                 
000002 //             MSGCLASS=H,                                              
000003 //             MSGLEVEL=(1,1),                                          
000004 //             NOTIFY=&SYSUID                                           
000005 //STEP01   EXEC PGM=SORT                                                
000006 //DD1      DD DSN=&SYSUID..MATRIX1,DISP=SHR                             
000007 //DD2      DD DSN=&SYSUID..MATRIX2,DISP=SHR                             
000008 //SORTOUT  DD DSN=&SYSUID..MATRIX4,DISP=SHR                             
000009 //SYSIN    DD *                                                         
000010   SORT FIELDS=COPY                                                      
000011   JOINKEYS F1=DD1,FIELDS=(1,10,A)                                       
000012   JOINKEYS F2=DD2,FIELDS=(1,10,A)                                       
000013   JOIN UNPAIRED,F1,ONLY                                                 
000014   REFORMAT FIELDS=(F1:1,10,F2:1,10)                                     
000015 /*                                                                      
000016 //SYSPRINT DD SYSOUT=*                                                  
000017 //AMSDUMP  DD SYSOUT=*                                                  




         Z37931.MATRIX1                                                 ZXPL01 
         Z37931.MATRIX2                                                 ZXPL01 
E        Z37931.MATRIX4                                                 ZXPL01 


EDIT       Z37931.MATRIX4                      
****** ***************************** Top of Dat
000001 ASHLEY    ASHLEY                        
000002 BRANDON   BRANDON                       
000003 HENRY                                   
000004 JAMES     JAMES                         
000005 JEFF      JEFF                          
000006 JOHN                                    
000007 RAUL      RAUL                          
****** **************************** Bottom of D
                                               
                                               



****** ***************************** Top of Data ****
000001 //BROLYLLS JOB CLASS=A,                       
000002 //             MSGCLASS=H,                    
000003 //             MSGLEVEL=(1,1),                
000004 //             NOTIFY=&SYSUID                 
000005 //STEP01   EXEC PGM=SORT                      
000006 //DD1      DD DSN=&SYSUID..MATRIX1,DISP=SHR   
000007 //DD2      DD DSN=&SYSUID..MATRIX2,DISP=SHR   
000008 //SORTOUT  DD DSN=&SYSUID..MATRIX4,DISP=SHR   
000009 //SYSIN    DD *                               
000010   SORT FIELDS=COPY                            
000011   JOINKEYS F1=DD1,FIELDS=(1,10,A)             
000012   JOINKEYS F2=DD2,FIELDS=(1,10,A)             
000013   JOIN UNPAIRED,F2,ONLY                       
000014   REFORMAT FIELDS=(F1:1,10,F2:1,10)           
000015 /*                                            



----------------------------------------------------
EDIT       Z37931.MATRIX4                           
****** ***************************** Top of Data ***
000001           AMIT                               
000002           JORGE                              
000003           SHAN                               
****** **************************** Bottom of Data *



000002 //             MSGCLASS=H,                               
000003 //             MSGLEVEL=(1,1),                           
000004 //             NOTIFY=&SYSUID                            
000005 //STEP01   EXEC PGM=SORT                                 
000006 //DD1      DD DSN=&SYSUID..MATRIX1,DISP=SHR              
000007 //DD2      DD DSN=&SYSUID..MATRIX2,DISP=SHR              
000008 //SORTOUT  DD DSN=&SYSUID..MATRIX4,DISP=SHR              
000009 //SYSIN    DD *                                          
000010   SORT FIELDS=COPY                                       
000011   JOINKEYS F1=DD1,FIELDS=(1,10,A)                        
000012   JOINKEYS F2=DD2,FIELDS=(1,10,A)                        
000013   REFORMAT FIELDS=(F1:1,10,F2:1,10)                      
000014 /*                                                       
000015 //SYSPRINT DD SYSOUT=*                                   
000016 //AMSDUMP  DD SYSOUT=*                                   
000017 //SYSOUT   DD SYSOUT=*                                   
****** **************************** Bottom of Data *************
Command ===> SUB                                              Sc



****** ***************************
000001 ASHLEY    ASHLEY           
000002 BRANDON   BRANDON          
000003 JAMES     JAMES            
000004 JEFF      JEFF             
000005 RAUL      RAUL             
****** ***************************
                                  
                                  


                                                    
                                                    
                                                    
