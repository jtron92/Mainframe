//MATEDK01 JOB (MVS),             
//             MSGLEVEL=(1,1),                     
//             MSGCLASS=H,                         
//             CLASS=A,                            
//             NOTIFY=&SYSUID                      
//STEP01   EXEC PGM=IDCAMS                         
//SYSIN    DD *                                    
  LISTCAT ENTRIES(MATEDK.TOO.GOOD) ALL             
/*                                                 
//SYSPRINT DD SYSOUT=*                             
//SYSOUT   DD SYSOUT=*                             
//AMSDUMP  DD SYSOUT=*                             
//         IF (STEP01.RC = 4 ) THEN                
//STEP02   EXEC PGM=IEFBR14                        
//STEP03   EXEC PGM=IEFBR14                        
//STEP04   EXEC PGM=IEFBR14                        
//         ELSE                      
//STEP06   EXEC PGM=IEFBR14          
//STEP07   EXEC PGM=IEFBR14          
//         ENDIF                     
**************************** Bottom o
                                     


Step01 List catologs entires of MATEDK.TOO.GOOD which was catlogued but i deleted it so this will return with a RC = 4

SO knowing that I have an IF/ELSE statemenet saying if step01 rc = 4 then exec step02/3/4 else exec step06/7

below you can see step06/7 flushed due to CONDITIONAL EXPRESSION and this is beause dsn ENTRY MATEDK.TOO.GOOD NOT FOUND    


16.46.36 JOB08254 ---- SATURDAY,  20 JUL 2024 ----                              
16.46.36 JOB08254  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
16.46.36 JOB08254  ICH70001I MATEDK   LAST ACCESS AT 16:39:52 ON SATURDAY, JULY 
16.46.36 JOB08254  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE   
16.46.36 JOB08254  IEF403I MATEDK01 - STARTED - TIME=16.46.36                   
16.46.36 JOB08254  -                                      -----TIMINGS (MINS.)--
16.46.36 JOB08254  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
16.46.36 JOB08254  -STEP01               04     51      0       .00       .00   
16.46.36 JOB08254  -STEP02               00      8      0       .00       .00   
16.46.36 JOB08254  -STEP03               00      9      0       .00       .00   
16.46.36 JOB08254  -STEP04               00      9      0       .00       .00   
16.46.36 JOB08254  -STEP05               00      9      0       .00       .00   
16.46.36 JOB08254  -STEP06            FLUSH      0      0       .00       .00   
16.46.36 JOB08254  -STEP07            FLUSH      0      0       .00       .00   


IEF373I STEP/STEP03  /START 2024202.1646                                       
IEF032I STEP/STEP03  /STOP  2024202.1646                                       
        CPU:     0 HR  00 MIN  00.00 SEC    SRB:     0 HR  00 MIN  00.00 SEC   
        VIRT:     4K  SYS:   228K  EXT:        0K  SYS:    11976K              
IEF142I MATEDK01 STEP04 - STEP WAS EXECUTED - COND CODE 0000                   
IEF373I STEP/STEP04  /START 2024202.1646                                       
IEF032I STEP/STEP04  /STOP  2024202.1646                                       
        CPU:     0 HR  00 MIN  00.00 SEC    SRB:     0 HR  00 MIN  00.00 SEC   
        VIRT:     4K  SYS:   228K  EXT:        0K  SYS:    11976K              
IEF142I MATEDK01 STEP05 - STEP WAS EXECUTED - COND CODE 0000                   
IEF373I STEP/STEP05  /START 2024202.1646                                       
IEF032I STEP/STEP05  /STOP  2024202.1646                                       
        CPU:     0 HR  00 MIN  00.00 SEC    SRB:     0 HR  00 MIN  00.00 SEC   
        VIRT:     4K  SYS:   228K  EXT:        0K  SYS:    11976K              

 IEF206I MATEDK01 STEP06 - STEP WAS NOT RUN BECAUSE OF CONDITIONAL EXPRESSION ON STATEMENT 7           
IEF272I MATEDK01 STEP06 - STEP WAS NOT EXECUTED.       

IEF206I MATEDK01 STEP07 - STEP WAS NOT RUN BECAUSE OF CONDITIONAL EXPRESSION ON STATEMENT 7   
IEF272I MATEDK01 STEP07 - STEP WAS NOT EXECUTED.                            

1IDCAMS  SYSTEM SERVICES                                           TIME: 16:46:3
0                                                                               
   LISTCAT ENTRIES(MATEDK.TOO.GOOD) ALL                                  0008000
0IDC3012I ENTRY MATEDK.TOO.GOOD NOT FOUND                                       
 IDC3009I ** VSAM CATALOG RETURN CODE IS 8 - REASON CODE IS IGG0CLEG-42         

THE NUMBER OF ENTRIES PROCESSED WAS:    
          AIX -------------------0      
          ALIAS -----------------0      
          CLUSTER ---------------0      
          DATA ------------------0      
          GDG -------------------0      
          INDEX -----------------0      
          NONVSAM ---------------0      
          PAGESPACE -------------0      
          PATH ------------------0      
          SPACE -----------------0      
          USERCATALOG -----------0      
          TAPELIBRARY -----------0      
          TAPEVOLUME ------------0      
          TOTAL -----------------0      
         THE NUMBER OF PROTECTED ENTRIES SUPPRESSED WAS 0          
IDC0001I FUNCTION COMPLETED, HIGHEST CONDITION CODE WAS 4          
                                                                   
IDC0002I IDCAMS PROCESSING COMPLETE. MAXIMUM CONDITION CODE WAS 4  



FOR FUN THIS IS HOW YOU WOULD WRITE IT WITH CONDS

//MATEDK01 JOB (MVS),                          
//             MSGLEVEL=(1,1),                                 
//             MSGCLASS=H,                                     
//             CLASS=A,                                        
//             NOTIFY=&SYSUID                                  
//STEP01   EXEC PGM=IDCAMS                                     
//SYSIN    DD *                                                
  LISTCAT ENTRIES(MATEDK.TOO.GOOD) ALL                         
/*                                                             
//SYSPRINT DD SYSOUT=*                                         
//SYSOUT   DD SYSOUT=*                                         
//AMSDUMP  DD SYSOUT=*                                         
//STEP02   EXEC PGM=IEFBR14,COND=(0,EQ,STEP01)                 
//STEP03   EXEC PGM=IEFBR14,COND=(0,EQ,STEP01)                 
//STEP04   EXEC PGM=IEFBR14,COND=(0,EQ,STEP01)                 
//STEP05   EXEC PGM=IEFBR14,COND=(0,EQ,STEP01)                 
//STEP06   EXEC PGM=IEFBR14,COND=(0,NE,STEP01)        
//STEP07   EXEC PGM=IEFBR14,COND=(0,NE,STEP01)       



SAME RESULTS

Just conditons are like in reverse so think if the conditon is met for that step , that step will not run so it does the opposite

********************************* TOP OF DATA **********************************
                       J E S 2  J O B  L O G  --  S Y S T E M  M A T E  --  N O 
                                                                                
17.12.04 JOB08257 ---- SATURDAY,  20 JUL 2024 ----                              
17.12.04 JOB08257  IRR010I  USERID MATEDK   IS ASSIGNED TO THIS JOB.            
17.12.04 JOB08257  ICH70001I MATEDK   LAST ACCESS AT 17:11:39 ON SATURDAY, JULY 
17.12.04 JOB08257  $HASP373 MATEDK01 STARTED - INIT 1    - CLASS A - SYS MATE   
17.12.04 JOB08257  IEF403I MATEDK01 - STARTED - TIME=17.12.04                   
17.12.04 JOB08257  -                                      -----TIMINGS (MINS.)--
17.12.04 JOB08257  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
17.12.04 JOB08257  -STEP01               04     51      0       .00       .00   
17.12.04 JOB08257  -STEP02               00      7      0       .00       .00   
17.12.04 JOB08257  -STEP03               00     10      0       .00       .00   
17.12.04 JOB08257  -STEP04               00      9      0       .00       .00   
17.12.04 JOB08257  -STEP05               00      9      0       .00       .00   
17.12.04 JOB08257  -STEP06            FLUSH      0      0       .00       .00   
17.12.04 JOB08257  -STEP07            FLUSH      0      0       .00       .00   


