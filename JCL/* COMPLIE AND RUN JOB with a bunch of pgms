//Z38515AC JOB (MVS),'JORGE CINTRON',                     
//             MSGLEVEL=(1,1),                            
//             MSGCLASS=H,                                
//             CLASS=A,                                   
//             NOTIFY=&SYSUID                             
//         JCLLIB ORDER=(Z38515.ALPHA7,IGY640.SIGYPROC)   
//         SET MNAME=&WDAY&LYR4                           
//STEP01   EXEC IGYWCL,LNGPRFX='IGY640'                   
//COBOL.SYSIN DD DSN=&SYSUID..ALPHA7(JOBC),DISP=SHR       
//LKED.SYSLMOD DD DSN=&SYSUID..CBLOADER(JOBC),DISP=SHR    
//SYSLIB   DD DSN=&LIBPRFX..SCEELKED,DISP=SHR             
//         DD DSN=&LIBPRFX..SCEELKEX,DISP=SHR             
//STEP02   EXEC PGM=JOBC                                  
//STEPLIB  DD DSN=&SYSUID..CBLOADER(JOBC),DISP=SHR        
//CUSTDDI  DD DSN=&SYSUID..CHASE,DISP=SHR                 
//CUSTDDO  DD DSN=&SYSUID..&MNAME..ONE,                   
//            DISP=(,CATLG),                              
//            UNIT=SYSDA,                          
//            SPACE=(TRK,(8,2),RLSE),              
//            DCB=*.CUSTDDI,                       
//            VOL=REF=*.CUSTDDI                    
//STEP03   EXEC PGM=SORT                           
//         INCLUDE MEMBER=JOBS                     
//STEP04   EXEC PGM=IEBGENER                       
//SYSUT1   DD DSN=*.STEP03.SORTOUT,DISP=SHR        
//SYSUT2   DD DSN=&SYSUID..&MNAME..THREE,          
//            DISP=(NEW,CATLG,DELETE),             
//            UNIT=SYSDA,                          
//            SPACE=(TRK,(8,1),RLSE),              
//            DCB=*.STEP03.SORTOUT,                
//            VOL=REF=*.STEP03.SORTOUT             
//SYSIN    DD DUMMY                                
//SYSPRINT DD SYSOUT=*                             
//SYSOUT   DD SYSOUT=*                             
//AMSDUMP  DD SYSOUT=*                             
//STEP05   EXEC PGM=IDCAMS                                   
//SYSIN    DD *                                              
  DEFINE GDG(NAME(Z38515.GDGBASE.FILE2)-                     
  LIMIT(3)-                                                  
  NOEMPTY-                                                   
  SCRATCH)                                                   
/*                                                           
//SYSPRINT DD SYSOUT=*                                       
//SYSOUT   DD SYSOUT=*                                       
//AMSDUMP  DD SYSOUT=*                                       
//PROC100  PROC                                              
//STEP06   EXEC PGM=IEFBR14                                  
//DD1      DD DSN=Z38515.GDGBASE.FILE2(+1),                  
//            DISP=(NEW,CATLG,DELETE),                       
//            UNIT=SYSDA,                                    
//            SPACE=(TRK,(8,1),RLSE),                        
//            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),  
//            VOL=SER=ZXPL01                                 
//         PEND                                        
//STEP07   EXEC PROC100                                
//STEP08   EXEC PGM=IDCAMS                             
//SYSIN    DD *                                        
  DEFINE CLUSTER(NAME(Z38515.GLOBAL.SYSTEM1)-          
  RECORDSIZE(80 80)-                                   
  KEYS(6 0)-                                           
  CYLINDERS(5 3)-                                      
  INDEXED-                                             
  FREESPACE(10 10))-                                   
  DATA(NAME(Z38515.GLOBAL.SYSTEM1.DATA))-              
  INDEX(NAME(Z38515.GLOBAL.SYSTEM1.INDEX))             
/*                                                     
//SYSPRINT DD SYSOUT=*                                 
//SYSOUT   DD SYSOUT=*                                 
//AMSDUMP  DD SYSOUT=*                                 
//STEP09   EXEC PGM=IDCAMS                             
//SYSIN    DD *                                        
  LISTCAT ENTRIES(Z38515.GLOBAL.SYSTEM1)      
/*                                            
//SYSPRINT DD SYSOUT=*                        
//SYSOUT   DD SYSOUT=*                        
//AMSDUMP  DD SYSOUT=*                        
//         IF (STEP09.RC NE 0) THEN           
//STEP010  EXEC PGM=IDCAMS                    
//SYSIN    DD *                               
  DELETE (Z38515.GLOBAL.SYSTEM1)              
/*                                            
//SYSPRINT DD SYSOUT=*                        
//SYSOUT   DD SYSOUT=*                        
//AMSDUMP  DD SYSOUT=*                        
//         ELSE                               
//STEP011  EXEC PGM=IDCAMS                    
//SYSIN    DD *                               
  REPRO INFILE(INDD)-                         
  OUTFILE(OUTDD)                              
/*                                                          
//SYSPRINT DD SYSOUT=*                                      
//SYSOUT   DD SYSOUT=*                                      
//AMSDUMP  DD SYSOUT=*                                      
//INDD     DD *                                             
000001     JORGE                                            
982323     JAMES                                            
/*                                                          
//OUTDD    DD DSN=Z38515.GLOBAL.SYSTEM1,DISP=SHR            
//         ENDIF                                            
//STEP012  EXEC PGM=IEBCOPY                                 
//SYSUT1   DD DSN=Z38515.ALPHA7,DISP=SHR                    
//SYSUT2   DD DSN=&SYSUID..ALPHA19,                         
//            DISP=(NEW,CATLG,DELETE),                      
//            UNIT=SYSDA,                                   
//            SPACE=(TRK,(8,8,8),RLSE),                     
//            DCB=(DSORG=PO,LRECL=80,RECFM=FB,BLKSIZE=800)  
//SYSIN    DD *                                             
  COPY INDD=SYSUT1,OUTDD=SYSUT2                      
/*                                                   
//SYSPRINT DD SYSOUT=*                               
//SYSOUT   DD SYSOUT=*                               
//AMSDUMP  DD SYSOUT=*                               
//STEP014  EXEC PGM=IDCAMS                           
//SYSIN    DD *                                      
  ALTER Z38515.ALPHA19 NEWNAME(Z38515.ALPHA001)      
/*                                                   
//SYSPRINT DD SYSOUT=*                               
//SYSOUT   DD SYSOUT=*                               
//AMSDUMP  DD SYSOUT=*                               
//STEP015  EXEC PGM=IEFBR14                          
//DD1      DD DSN=&SYSUID..NWO1M,                    
//            DISP=(NEW,CATLG,DELETE),               
//            UNIT=SYSDA,                            
//            SPACE=(TRK,(8,1),RLSE),                
//            DCB=*.STEP07.STEP06.DD1                
//STEP016  EXEC PGM=IEFBR14                               
//DD1      DD DSN=Z38515.GDGBASE.FILE2,DISP=(OLD,DELETE)  
//STEP017  EXEC PGM=IDCAMS                                
//SYSIN    DD *                                           
  DELETE (Z38515.GDGBASE.FILE2) GDG FORCE                 
/*                                                        
//SYSPRINT DD SYSOUT=*                                    
//SYSOUT   DD SYSOUT=*                                    
//AMSDUMP  DD SYSOUT=*                                    
//STEP018  EXEC PROC=JOBP                                 
//STEP019.SYSUT2 DD DSN=Z38515.NWO1M,DISP=SHR             
//STEP020  EXEC PGM=IKJEFT01                              
//SYSTSIN  DD *                                           
  EXEC 'Z38515.ALPHA7(REX1)'                              
/*                                                        
//SYSTSPRT DD SYSOUT=*                                    
//SYSOUT   DD SYSOUT=*                                    
//AMSDUMP  DD SYSOUT=*                                    
//SYSPRINT DD SYSOUT=*                             
//STEP021  EXEC PGM=IKJEFT01,PARM='%REX2'          
//SYSEXEC  DD DSN=Z38515.ALPHA7,DISP=SHR           
//SYSTSPRT DD SYSOUT=*                             
//SYSTSIN  DD DUMMY                                
//SYSOUT   DD SYSOUT=*                             
//SYSPRINT DD SYSOUT=*                             
//STEP022  EXEC ASMACL,MBR=ASM1                    
//SYSIN    DD DSN=Z38515.ALPHA7(ASM1),DISP=SHR     
//GO       EXEC PGM=ASM1                           
//STEPLIB  DD DSN=&SYSUID..LOAD,DISP=SHR           
//SYSPRINT DD SYSOUT=*                             
//SYSOUT   DD SYSOUT=*                             
//AMSDUMP  DD SYSOUT=*                             
//IFILE    DD *                                    
WELCOME TO THE MAINFRAME                           
/*                                                 
//OFILE    DD SYSOUT=*                             
//SYSABEND DD SYSOUT=*                                                  
**************************** Bottom of Data ****************************
                                                                        


********************************* TOP OF DATA **********************************
                   J E S 2  J O B  L O G  --  S Y S T E M  S 0 W 1  --  N O D E 
                                                                                
20.19.16 JOB04419 ---- SUNDAY,    14 JUL 2024 ----                              
20.19.16 JOB04419  IRR010I  USERID Z38515   IS ASSIGNED TO THIS JOB.            
20.19.16 JOB04419  IEF677I WARNING MESSAGE(S) FOR JOB Z38515AC ISSUED           
20.19.19 JOB04419  ICH70001I Z38515   LAST ACCESS AT 18:56:30 ON SUNDAY, JULY 14
20.19.19 JOB04419  $HASP373 Z38515AC STARTED - INIT 5    - CLASS A        - SYS 
20.19.23 JOB04419  -                                      -----TIMINGS (MINS.)--
20.19.23 JOB04419  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
20.19.23 JOB04419  -STEP01   COBOL       00  14193    184       .00       .00   
20.19.24 JOB04419  -STEP01   LKED        00    247     27       .00       .00   
20.19.24 JOB04419  -STEP02               00     50      4       .00       .00   
20.19.25 JOB04419  -STEP03               00     33      4       .00       .00   
20.19.25 JOB04419  -STEP04               00     30      3       .00       .00   
20.19.25 JOB04419  -STEP05               00     19      2       .00       .00   
20.19.26 JOB04419  -STEP07   STEP06      00      2      0       .00       .00   
20.19.26 JOB04419  -STEP08               00     23      4       .00       .00   
20.19.27 JOB04419  -STEP09               00     44      5       .00       .00   
20.19.27 JOB04419  -STEP010           FLUSH      0      0       .00       .00   
20.19.29 JOB04419  -STEP011              00     41     14       .00       .00   
20.19.29 JOB04419  -STEP012              00     72     14       .00       .00   
20.19.30 JOB04419  -STEP014              00     45      5       .00       .00   
20.19.30 JOB04419  -STEP015              00      2      0       .00       .00   
20.19.31 JOB04419  -STEP016              00      5      1       .00       .00   
20.19.31 JOB04419  -STEP017              00     19      1       .00       .00   
20.19.32 JOB04419  -STEP018  STEP019     00     29      2       .00       .00   
20.19.32 JOB04420  $HASP100 JCLRUN11 ON INTRDR      JORGE CINTRON         FROM J
20.19.32 JOB04420  IRR010I  USERID Z38515   IS ASSIGNED TO THIS JOB.            
20.19.32 JOB04419  -STEP020              00     79      7       .00       .00   
20.19.33 JOB04419  -STEP021              00     24      3       .00       .00   
20.19.33 JOB04419  -STEP022  C           00    134     20       .00       .00   
20.19.33 JOB04419  -STEP022  L           00     83      5       .00       .00   
20.19.33 JOB04419  -GO                   00     24      1       .00       .00   
20.19.33 JOB04419  -Z38515AC ENDED.  NAME-JORGE CINTRON        TOTAL TCB CPU TIM
20.19.33 JOB04419  $HASP395 Z38515AC ENDED - RC=0000                            
------ JES2 JOB STATISTICS ------                                               
  14 JUL 2024 JOB EXECUTION DATE                                                
          162 CARDS READ                                                        
        1,799 SYSOUT PRINT RECORDS                                              
            0 SYSOUT PUNCH RECORDS                                              
          119 SYSOUT SPOOL KBYTES                                               
