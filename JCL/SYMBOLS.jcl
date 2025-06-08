000001 //MATEDK91 JOB CLASS=A,                                        
000002 //             MSGLEVEL=(1,1),                                 
000003 //             MSGCLASS=H,                                     
000004 //             NOTIFY=&SYSUID                                  
000005 //STEP01   EXEC PGM=IDCAMS                                     
000006 //INDD     DD DSN=MATEDK.EMIN8,DISP=SHR                        
000007 //OUTDD   DD DSN=MATEDK.BACKUP.&SYSNAME..D&YYMMDD..T&HHMMSS,   
000008 //            DISP=(NEW,CATLG,DELETE),                         
000009 //            UNIT=SYSDA,                                      
000010 //            SPACE=(TRK,(8,10,10),RLSE),                      
000011 //            DCB=(DSORG=PO,LRECL=80,RECFM=FB,BLKSIZE=800)     
000012 //SYSIN    DD *                                                
000013   REPRO INFILE(INDD)                                           
000014   OUTFILE(OUTDD)                                               
000015 /*                                                             
000016 //SYSABEND DD SYSOUT=*                                         


The name of the system that the job is running on &sysname

the current data &yymmdd

The current time &hhmmss

//Z38515A  JOB (ACCT),             
//             MSGLEVEL=(1,1),                     
//             MSGCLASS=H,                         
//             CLASS=A,                            
//             NOTIFY=&SYSUID                      
//STEP01   EXEC PGM=IEBGENER                       
//SYSUT1   DD DSN=Z38515.CHASE,DISP=SHR            
//SYSUT2   DD DSN=Z38515.D&YYMMDD..WORK,           
//            DISP=(,CATLG),                       
//            SPACE=(TRK,(1,1),RLSE),              
//            DCB=*.SYSUT1                         
//SYSIN    DD DUMMY                                
//SYSPRINT DD SYSOUT=*                             
//AMSDUMP  DD SYSOUT=*                             
//SYSOUT   DD SYSOUT=*                             

key note if you do not add two periods after usuing a sys sybmol like this 
38515.D&YYMMDD.work    = this will combine the D&YYMMDD.work into one also the name maybe too long and youll get this error IEF642I EXCESSIVE PARAMETER LENGTH IN THE DSNAME FIELD   
z38515.D&YYMMDD..WORK  = Z38515.D240607.WORK   

000006 //STEP01   EXEC PGM=IEBGENER                   
000007 //SYSUT1   DD DSN=Z38515.CHASE,DISP=SHR        
000008 //SYSUT2   DD DSN=Z38515.&SYSNAME.WORK,        
000009 //            DISP=(,CATLG),                   
000010 //            SPACE=(TRK,(1,1),RLSE),          
000011 //            DCB=*.SYSUT1                     
000012 //SYSIN    DD DUMMY                            
000013 //SYSPRINT DD SYSOUT=*                         
000014 //AMSDUMP  DD SYSOUT=*                         
000015 //SYSOUT   DD SYSOUT=*                         

Z38515.&SYSNAME.WORK = Z38515.S0W1WORK
  

There are two types of system symbols: static and dynamic

Static system symbols contain values that are fixed for the life of the IPL. DISPLAY SYMBOLS command will display
their values for the system where the command was entered


in sdsf type display symbols
 Display  Filter  View  Print  Options  Search  Help                             
                                                                                
 SDSF SYSLOG   1113.101 S0W1 04/12/2022 0w   808   COLUMNS 52 - 131             
 COMMAND INPUT ===>                                      SCROLL ===> CSR        
 0290  DISPLAY SYMBOLS                                                          
 0090  IEA007I STATIC SYSTEM SYMBOL VALUES 098                                  
 0090    &SYSVAL.    = "2"                                                      
 0090    &SYSCLONE.  = "W1"                                                     
 0090    &SYSNAME.   = "S0W1"                                                   
 0090    &SYSOSLVL.  = "Z1020500"                                               
 0090    &SYSPLEX.   = "SVCSPLEX"                                               
 0090    &SYSR1.     = "VMIVSB"                                                 
 0090    &JESSSN.    = "J2"                                                     
 0090    &J2MLQX.    = ""                                                       
 0090    &J3MLQX.    = ""                                                       
 0090    &STVSC.     = "SV"                                                     
 0090    &UNTVXER.   = "VERYSB"                                                 
 0090    &VENDOR.    = "V1"                                                     
 0090    &VTAMLIST.  = "W1"                                                     
 *************************** BOTTOM OF DATA ************************************ 



in sdsf type sym 

-------------------------------------------------------------------------------
SDSF SYMBOL DISPLAY  S0W1     (ALL)                    LINE 1-15 (36)          
COMMAND INPUT ===> sym                                        SCROLL ===> CSR  
PREFIX=*  DEST=(ALL)  OWNER=Z38515  SYSNAME=*                                  
NP   SYMBOL             Value                                        Type     S
     &DAY.              07                                           DYNAMIC  S
     &HHMMSS.           004550                                       DYNAMIC  S
     &HR.               00                                           DYNAMIC  S
     &JDAY.             159                                          DYNAMIC  S
     &JESSSN.           J2                                           STATIC   S
     &JOBNAME.          SDSFAUX                                      DYNAMIC  S
     &J2MLQX.                                                        STATIC   S
     &J3MLQX.                                                        STATIC   S
     &LDAY.             06                                           DYNAMIC  S
     &LHHMMSS.          194550                                       DYNAMIC  S
     &LHR.              19                                           DYNAMIC  S
     &LJDAY.            158                                          DYNAMIC  S
     &LMIN.             45                                           DYNAMIC  S
     &LMON.             06                                           DYNAMIC  S
     &LSEC.             50                                           DYNAMIC  S

The Dynamic system symbols contain values that are constantly changing, such as a time or data value.


TYPE JC FOR JOB CLASS
-----------------------------------------------------------------------
SDSF MENU V2R4M0    SVSCPLEX  S0W1                     LINE 1-15 (64)  
COMMAND INPUT ===> JC                                         SCROLL ==
PREFIX=*  DEST=(ALL)  OWNER=Z38515  SYSNAME=*                          
NP   NAME     Description              Group    Status                 
     DA       Active users             Jobs                            
     I        Input Queue              Jobs                            
     O        Output Queue             Output                          
     H        Held output Queue        Output                          
     ST       Status of jobs           Jobs                            
     JG       Job groups               JES                             
     SYM      System symbols           System                          
     LOG      System log               Log                             
     SR       System requests          Log                             
     MAS      Members in the MAS       JES                             
     JC       Job classes              JES                             
     SE       Scheduling environments  WLM                             
     RES      WLM resources            WLM                             
     ENC      Enclaves                 WLM                             
     PS       Processes                OMVS                            


TYPE L SYSSYM
-----------------------------------------------------------------------------
SDSF JOB CLASS DISPLAY ALL CLASSES                     LINE 1-15 (38)        
COMMAND INPUT ===> L SYSSYM                                   SCROLL ===> CSR
PREFIX=*  DEST=(ALL)  OWNER=Z38515  SYSNAME=*                                
NP   CLASS    Status   Group    Mode Wait-Cnt  Xeq-Cnt Hold-Cnt ODisp        
     A        NOTHELD           JES                             ()           
     B        NOTHELD           JES                             ()           
     C        NOTHELD           JES                             ()           
     D        NOTHELD           JES                             ()           
     E        NOTHELD           JES                             ()           
     F        NOTHELD           JES                             ()           
     G        NOTHELD           JES                             ()           
     H        NOTHELD           JES                             ()           
     I        NOTHELD           JES                             ()           
     J        NOTHELD           JES                             ()           
     K        NOTHELD           JES                             ()           
     L        NOTHELD           JES                             ()           
     M        NOTHELD           JES                             ()           
     N        NOTHELD           JES                             ()           
     O        NOTHELD           JES                             ()           




 SDSF JOB CLASS DISPLAY ALL CLASSES                
 COMMAND INPUT ===>                                
 PREFIX=*  DEST=(ALL)  OWNER=Z38515  SYSNAME=*     
 NP   CLASS    SysSym   DSEnqShr PromoRt GDGBias   
      A        ALLOW    ALLOW          0 JOB       
      B        ALLOW    ALLOW          0 JOB       
      C        ALLOW    ALLOW          0 JOB       
      D        ALLOW    ALLOW          0 JOB       
      E        ALLOW    ALLOW          0 JOB       
      F        ALLOW    ALLOW          0 JOB       
      G        ALLOW    ALLOW          0 JOB       
      H        ALLOW    ALLOW          0 JOB       
      I        ALLOW    ALLOW          0 JOB       
      J        ALLOW    ALLOW          0 JOB       
      K        ALLOW    ALLOW          0 JOB       
      L        ALLOW    ALLOW          0 JOB       
      M        ALLOW    ALLOW          0 JOB       
      N        DISALLOW ALLOW          0 JOB       
      O        DISALLOW ALLOW          0 JOB       


THE SDSF SCREEN SHOWN HERE DISPLAYS JOB CLASSES AND THEIR ATRRIBUTES. FOR THE A JOB CLASS THERE IS 
AN ATTRIBUTE CALLED SYSSYSM (SYSTEM SYMBOLS) WHICH IS SET TO ALLOW.

THIS MEANS THAT IF THE JOB YOU SUBMIT IS ASSIGNED THIS CLASS, THEN YOU CAN CODE SYSTEM SYMBOLS IN IT.

DISALLOW MEANS YOU CAN NOT CODE SYS SYMBOLS IN THAT CLASS LIKE CLASS N AND O 
