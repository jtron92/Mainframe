          CSECT                                    
          YREGS                                    
          SAVE (14,12)                             
          STM  R14,R12,12(R13)                     
          BASR R12,0                               
          USING *,R12                              
          ST   R13,SAVEA+4                         
          LA   R13,SAVEA                           
          OPEN (IFILE,INPUT,OFILE,OUTPUT)          
 LOOP     EQU  *                                   
          GET  IFILE,INRECS                        
          MVC  OID,IID                             
          MVC  ONAME,INAME                         
          MVC  ODEGREE,IDEGREE                     
          MVC  OY,IY                               
          MVC  ONUM,INUM                           
         PUT  OFILE,OUTRECS                                        
         B    LOOP                                                 
IFILE    DCB  MACRF=GM,DDNAME=IFILE,DSORG=PS,LRECL=48,EODAD=EXIT   
OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,LRECL=48              
EXIT     EQU  *                                                    
         CLOSE (IFILE,,OFILE)                                      
         L    R13,SAVEA+4                                          
         RETURN (14,12),RC=0                                       
         LM   R14,R12,12(R13)                                      
         LA   R15,0                                                
         BR   R14                                                  
SAVEA    DS   18F                                                  
INRECS   DS   0CL48                                                
IID      DS   CL3                                                  
         DS   CL6                                                  
INAME    DS   CL12                                                 
         DS   CL3                                                  
IDEGREE  DS   CL3                                                    
         DS   CL7                                                    
IY       DS   CL1                                                    
         DS   CL9                                                    
INUM     DS   CL4                                                    
OUTRECS  DS   0CL48                                                  
OID      DS   CL3                                                    
         DC   CL6''                                                  
ONAME    DS   CL12                                                   
         DC   CL3''                                                  
ODEGREE  DS   CL3                                                    
         DC   CL7''                                                  
OY       DS   CL1                                                    
         DC   CL9''                                                  
ONUM     DS   CL4                                                    
         END                                                         
**************************** Bottom of Data *************************



--------------------------------------------------------------
    MATEDK.ASM.SRCLIB3(TT1) - 01.00                 Columns 00
 ===>                                                  Scroll 
***************************** Top of Data ********************
732      BENSON,E.T     PHD       N         5156              
218      HINCKLEY,G.B   MBA       N         5509              
854      KIMBALL,S.W    PHD       Y         5594              
626      YOUNG,B.       MBA       Y         5664              
574      SMITH,J.       MS        Y         5320              
**************************** Bottom of Data ******************
                                                              



22.31.40 JOB02670 ---- FRIDAY,    28 JUN 2024 ----                              
22.31.40 JOB02670  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
22.31.40 JOB02670  ICH70001I MATEDK   LAST ACCESS AT 22:31:36 ON FRIDAY, JUNE 28
22.31.40 JOB02670  $HASP373 MATEDKR  STARTED - INIT 1    - CLASS A - SYS MATE   
22.31.40 JOB02670  IEF403I MATEDKR - STARTED - TIME=22.31.40                    
22.31.40 JOB02670  -                                      -----TIMINGS (MINS.)--
22.31.40 JOB02670  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
22.31.40 JOB02670  -STEP01               00     37      0       .00       .00   
22.31.40 JOB02670  IEF404I MATEDKR - ENDED - TIME=22.31.40                      
22.31.40 JOB02670  -MATEDKR  ENDED.  NAME-                     TOTAL TCB CPU TIM
22.31.40 JOB02670  $HASP395 MATEDKR  ENDED                                      
------ JES2 JOB STATISTICS ------                                               

   Display  Filter  View  Print  Options  Search  Help      
 -----------------------------------------------------------
 SDSF OUTPUT DISPLAY MATEDKR  JOB02670  DSID   104 LINE 1   
 COMMAND INPUT ===>                                         
732      BENSON,E.T     PHD       N         0100            
218      HINCKLEY,G.B   MBA       N         0200            
854      KIMBALL,S.W    PHD       Y         0300            
626      YOUNG,B.       MBA       Y         0400            
574      SMITH,J.       MS        Y         0500            
******************************** BOTTOM OF DATA ************
                                                            


