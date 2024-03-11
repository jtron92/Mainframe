000001 //ASMJOB01 JOB (ACCOUNT1),JORGE.CINTRON,                               
000002 //             CLASS=A,                                                
000003 //             MSGCLASS=H,                                             
000004 //             MSGLEVEL=(1,1),                                         
000005 //             NOTIFY=HERC01                                           
000006 //*----------------------------------------                            
000007 //* END OF JOB CARD / INSTREAM JCL                                     
000008 //*----------------------------------------                            
000009 //STEP01   EXEC ASMFCG,MAC1='SYS2.MACLIB'                              
000010 //ASM.SYSLIB DD DSN=SYS1.MACLIB,DISP=SHR                               
000011 //ASM.SYSIN  DD *                                                      
000012 PGM1     CSECT                                                         
000013          STM  R14,R12,12(R13)                                          
000014          BASR R12,R0                BASE REGISTER 12                   
000015          USING *,R12                     DIRECTIVE 12                  
000016          ST    R13,SAVEA+4                                             
000017          LA    R13,SAVEA                                               
000018 *----------------------------------------------------------------------
000019 OPENFILE OPEN (IFILE,INPUT,OFILE,OUTPUT)  OPEN INPUT AND OUTPUT FILES  
000020 *----------------------------------------------------------------------
000021 READRECS GET  IFILE,INRECS       READ EACH RECORD                      
000022 *----------------------------------------------------------------------
000023 LOOP     MVC  OUTRECS,INRECS     MOVE/COPY RECS FROM INPUT TO OUTPUT   
000024          PUT  OFILE,OUTRECS      PUT RECORDS INTO OUTPUT FILE          
000025          GET  IFILE,INRECS       RETREIVE/READ NEXT RECORD FROM INPUT  
000026          B    LOOP          LOOP BACK TO REPEAT PROCESS FOR ALL RECS   
000027 *----------------------------------------------------------------------
000028 EXIT     CLOSE (IFILE,,OFILE)   CLOSE THE INPUT/OUTPUT FILES           
000029 *--------------------------------------------------------------------- 
000030          L    R13,SAVEA+4         LOAD BACK REGISTER 13                
000031          LM   R14,R12,12(R13)      RESTORE USED ADDRESSES              
000032          LA   R15,0                RETURN STATUS REG 15 CODE 0 SUCCESS                     
000033          BR   R14                RETURN CALL TO BR 14                  
000034 *--------------------------------------------------------------------  
000035 IFILE    DCB  MACRF=GM,DDNAME=IFILE,DSORG=PS,EODAD=EXIT                
000036 OFILE    DCB  MACRF=PM,DDNAME=OFILE,DSORG=PS,                          
000037 *--------------------------------------------------------------------- 
000038 INRECS   DS   CL80        INPUT CHARACTER LENGTH 80 BYTES              
000039 OUTRECS  DS   CL80        OUTPUT CL 80 BYTES                           
000040 SAVEA    DS   18F         18 FULL WORDS                                
000041 *--------------------------------------------------------------------- 
000042 R0       EQU  0           ESTABLISH REGISTERS 0 - 15                   
000043 R1       EQU  1                                                        
000044 R2       EQU  2                                                        
000045 R3       EQU  3                                                        
000046 R4       EQU  4                                                        
000047 R5       EQU  5                                                        
000048 R6       EQU  6                                                        
000049 R7       EQU  7                                                        
000050 R8       EQU  8                                                        
000051 R9       EQU  9                                                        
000052 R10      EQU  10                                                       
000053 R11      EQU  11                                                       
000054 R12      EQU  12                                                       
000055 R13      EQU  13                                                       
000056 R14      EQU  14                                                       
000057 R15      EQU  15                                                       
000058          END  PGM1          END OF PROGRAM                             
000059 /*                                                                     
000060 //GO.SYSPRINT DD SYSOUT=*                                              
000061 //GO.SYSABEND DD SYSOUT=*                                              
000062 //GO.SYSUDUMP DD SYSOUT=*                                              
000063 //GO.IFILE    DD DSN=HERC01.INPUT1,DISP=SHR                            
000064 //GO.OFILE    DD DSN=HERC01.OFILE,DISP=SHR                             
****** ***********AUTOSAVE********* BOTTOM OF DATA ***************** 7804K FREE

OUTPUT:
                                                J E S 2   J O B   L O G       
13.07.16 JOB   51  $HASP373 ASMJOB01 STARTED - INIT  1 - CLASS A - SYS TK4-   
13.07.16 JOB   51  IEF403I ASMJOB01 - STARTED - TIME=13.07.16                 
13.07.17 JOB   51  IEFACTRT - Stepname  Procstep  Program   Retcode           
13.07.17 JOB   51  ASMJOB01   STEP01    ASM       IFOX00    RC= 0000          
13.07.17 JOB   51  ASMJOB01   STEP01    GO        LOADER    RC= 0000          
13.07.17 JOB   51  IEF404I ASMJOB01 - ENDED - TIME=13.07.17                   
13.07.17 JOB   51  $HASP395 ASMJOB01 ENDED                                    
    1     //ASMJOB01 JOB (ACCOUNT1),JORGE.CINTRON,                            
          //             CLASS=A,                                             
          //             MSGCLASS=H,                                          
          //             MSGLEVEL=(1,1),                                      
          //             NOTIFY=HERC01,                                       
          //            USER=HERC01,PASSWORD=            GENERATED BY GDL     
          ***----------------------------------------                         
          *** END OF JOB CARD / INSTREAM JCL                                  
          ***----------------------------------------                         





INPUT FILE:
                                                      
REVEDIT  HERC01.INPUT1 ON MVSCAT                      
COMMAND ===>                                          
****** ***********AUTOSAVE********** TOP OF DATA *****
000001 THIS IS LINE 1                                 
000002 THIS IS LINE 2                                 
000003 THIS IS LINE 3                                 
000004 THIS IS LINE 4                                 
****** ***********AUTOSAVE********* BOTTOM OF DATA ***
                                                      
                                                      
OUTPUT FILE: 

 REVEDIT  HERC01.OFILE ON PUB011                           
COMMAND ===>                                              
****** ***********AUTOSAVE********** TOP OF DATA *********
000001 THIS IS LINE 1                                     
000002 THIS IS LINE 2                                     
000003 THIS IS LINE 3                                     
000004 THIS IS LINE 4                                     
****** ***********AUTOSAVE********* BOTTOM OF DATA *******
                                                          
                                                          



