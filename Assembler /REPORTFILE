  64KB ----+----1----+----2----+----3----+----4----+----5----+----6----+----7
****** ****ZAP****AUTOSAVE********** TOP OF DATA ****************************
000001 //TESTING JOB CLASS=A,                                                
000002 //            MSGCLASS=H,                                             
000003 //            MSGLEVEL=(1,1),                                         
000004 //            NOTIFY=HERC01                                           
000005 //STEP01  EXEC ASMFCG,PARM.ASM=(OBJ,NODECK),MAC1='SYS2.MACLIB',       
000006 //            REGION.GO=428K                                          
000007 //ASM.SYSLIB DD                                                       
000008 //           DD DISP=SHR,DSN=SYS1.MACLIB                              
000009 //ASM.SYSIN  DD *                                                     
000010          PRINT GEN                                                    
000011 REPORT   CSECT              CONTROL SECTION                           
000012          SAVE (14,12)                                                 
000013          BASR R12,0         BASE REG 12 ESTABLISHING                  
000014          USING *,R12                                                  
000015          ST   R13,SAVEA+4       STORE REG 13                          
000016          LA   R13,SAVEA         LOAD ADDRESS                          
000017 *--------------------------------------------------------------------*
000018 OPENFILE OPEN (INDCB,INPUT,OUTDCB,OUTPUT)   OPEN INPUT AND OUTPUT DCBS
000019 WRITFILE PUT OUTDCB,PTITLE                WRITE TO OUTPUT DCB         
000020 *--------------------------------------------------------------------*
000021 READREC  GET INDCB,PAYREC           READ FROM INPUT DCB NAMED PAYREC   
000022 *--------------------------------------------------------------------* 
000023 CPYSTFF  MVC PEMPID,EMPID          MOVING/COPYING EMPID TO PEMPID      
000024          MVC PEMLOYE,EMPLOYEE                   PEMPLOYEE TO EMPLOYEE  
000025          MVC PSALARY,SALARY                                            
000026 PACKIT   PACK ZSALARY,SALARY            PACKING TOTAL                  
000027          AP  ZTOTAL,ZSALARY                ADDING TOTAL                
000028 WRITPR   PUT OUTDCB,OUTAREA                                            
000029          B   READREC           LOOP BACK TO READREC TO READ EACH REC   
000030 *--------------------------------------------------------------------* 
000031 INCLOS   MVC ATOTAL,EDWD                                               
000032          LA  R1,ATOTAL                                                 
000033          ED ATOTAL,ZTOTAL          MATH THESE OUT                      
000034          PUT OUTDCB,TOTALLNE         COPY/DATA TO OUTAREA FOR OUTPUT   
000035 CLSALL   CLOSE (INDCB,,OUTDCB)       CLOSE THE FILES INPUT AND OUTPUT  
000036          L  R13,SAVEA+4                                                
000037          RETURN (14,12),RC=0        RETURN CODE SUCCESSFUL             
000038          LTORG                                                         
000039 SAVEA    DS 18F                    18 FULL WORDS BYTES                 
000040 *--------------------------------------------------------------------* 
000041 INDCB    DCB MACRF=GM,DDNAME=INDD,DSORG=PS,EODAD=INCLOS                
000042 OUTDCB   DCB MACRF=GM,DDNAME=OUTDD,DSORG=PS  INPUT/OUTPUT FILES         
000043 *--------------------------------------------------------------------*  
000044 PAYREC   DS 0CL80      80 BYTES FOR THE INDCB FILE (INPUT)              
000045 EMPID    DS CL4        4 BYTES BECAUSE INPUT FILE EMPID ONLY HAS 4 NMBR 
000046          DS CL6        6 SPACES BETWEEN EMPID AND EMPLOYEE              
000047 EMPLOYEE DS CL21       21 BYTES FOR EMPLOYEE NAME                       
000048          DS CL2                                                         
000049 SALARY   DS CL4                                                         
000050 ENDING   DS CL43       43 BECAUSE NEEDED A NUMBER TO SUM UP TO 80       
000051 *---------------------------------------------------------------------* 
000052 PTITLE   DC CL121' P A Y R O L L  R E P O R T  -  B I M  C O R P.'   
000053 OUTAREA  DC  0CL133' '                
000054 EMPTY    DC  CL1' '                   
000055 PEMPID   DS  CL4' '                   
000056          DC  CL6' '                   
000057 PEMPLOYE DS  CL20' '                  
000058          DC  CL2' '                   
000059 PDOLLAR  DC  CL1' '                   
000060 PSALARY  DS  CL5' '                   
000061 OFILLER  DC  CL94' '                                                                              
000062 *                                                
000063 ZSALARY  DC  PL3'0'                              
000064 ZTOTAL   DC  PL05'0'                             
000065 EDWD     DC  X'4020202020206B2020'               
000066 TOTALLNE DS  0CL133                              
000067 SKIP     DC  CL1'0'                              
000068 TFILL1   DC  CL09' '                             
000069 TFILL2   DC  CL17' '                             
000070 TDOLLAR  DC  CL1'$'                              
000071 ATOTAL   DC  CL10' '                             
000072 TFILL3   DC  CL12' '                             
000073 TOTMSG   DC  CL61'TOTAL MONTHLY WAGES'           
000074 TFILL4   DC  CL33' '              
000075 R0       EQU 0                    
000076 R1       EQU 1                    
000077 R2       EQU 2                    
000078 R3       EQU 3                    
000079 R4       EQU 4                    
000080 R5       EQU 5                    
000081 R6       EQU 6                    
000082 R7       EQU 7                    
000083 R8       EQU 8                    
000084 R9       EQU 9                    
000085 R10      EQU 10                   
000086 R11      EQU 11                   
000087 R12      EQU 12                   
000088 R13      EQU 13                   
000089 R14      EQU 14                   
000090 R15      EQU 15                   
000091          END                      
000092 /*                                
000093 //GO.SYSPRINT DD SYSOUT=*         
000094 //GO.SYSUDUMP DD SYSOUT=*         
000095 //GO.SYSABEND DD SYSOUT=*                                               
000096 //GO.OUTDD    DD SYSOUT=*,DCB=(RECFM=FBA,LRECL=122,BLKSIZE=122)         
000097 //GO.INDD     DD DSN=HERC01.SALARIES,DISP=SHR                           
****** ****ZAP****AUTOSAVE********* BOTTOM OF DATA ****************************


below is the input file that the code is pulling from  empid 1001 employee gage steele salary 3039 for examples


  64KB ----+----1----+----2----+----3----+----4----+----5----+----6-
****** ***********AUTOSAVE********** TOP OF DATA *******************
000001 1001      GAGE STEELE            3039                        
000002 1017      COLBY MCCARTHY         4762                        
000003 1021      GRADY PERASON          3287                        
000004 1040      DUSTIN MADDOX          3187                        
000005 1050      ACTON TUCKER           3742                        
000006 1060      NORMAN BISHOP          7955                        
000007 1012      MASON MIDDLETON        3029                        
****** ***********AUTOSAVE********* BOTTOM OF DATA *****************
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
