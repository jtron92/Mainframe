Command ===>                                                  Scroll ===> CSR  
=COLS> ----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
****** ***************************** Top of Data ******************************
000100 //MATEDK11 JOB CLASS=A,                                                 
000200 //             MSGLEVEL=(1,1),                                          
000300 //             MSGCLASS=H,                                              
000400 //             NOTIFY=&SYSUID                                           
000500 //STEP01   EXEC PGM=IEBCOPY                                             
000600 //SYSUT1   DD DSN=MATEDK.FOLDER59,DISP=SHR                              
000700 //SYSUT2   DD DSN=&SYSUID..FOLDER70,                                    
000800 //            DISP=(NEW,CATLG,DELETE),                                  
000900 //            UNIT=SYSDA,                                               
001000 //            SPACE=(TRK,(8,8,8),RLSE),                                 
001100 //            DCB=(DSORG=PO,LRECL=80,RECFM=FB,BLKSIZE=800),             
001200 //            VOL=SER=DEVHD3                                            
001300 //SYSIN    DD *                                                         
001400   COPY INDD=SYSUT1,OUTDD=SYSUT2                                         
001410   SELECT MEMBER=MATH1,NEW                                               
001600 //SYSPRINT DD SYSOUT=*                                                  
001700 //AMSDUMP  DD SYSOUT=*                                                  
001800 //SYSOUT   DD SYSOUT=*                                                  
****** **************************** Bottom of Data ****************************

FOR THIS ULITIY THIS COPIES MEMBERS AND PDS ONTO A NEW OR EXISITNG FILE.

IF YOU WANTED TO COPY ALL MEMBERS IN THE SYSIN DD * FOR EX

COPY INDD=SYSUT1,OUTDD=SYSUT2  

THERE WOULD BE NO NEED TO ADD SELECTIVE MEMBERS THIS WOULD COPY ALL

IF YOU WANTED TO EXCLUDE MEMBERS IT WOULD BE 

COPY INDD=SYSUT1,OUTDD=SYSUT2  
EXCLUDE MEMBER=MATH1,NEW


BELOW IS THE PDS CONTAINING ALL THE MEMBERS 
 --------------------------------------------------------------
 EDIT                                      Ro
 Command ===>                                                  
            Name     Prompt       Size   Created          Chang
 _________ COBCOMP                   8  2023/11/21  2023/11/30 
 _________ COBOL1                   88  2023/11/27  2023/11/27 
 _________ COBRUN                    9  2023/11/20  2023/11/30 
 _________ COMPLI                    9  2023/11/27  2023/11/27 
 _________ COPY                     19  2023/11/30  2023/11/30 
 _________ EDC                      63  2023/11/24  2023/11/24 
 _________ FILE77                   15  2023/11/21  2023/11/21 
 _________ FTP                      41  2023/11/20  2023/11/20 
 _________ IEFBR14                  13  2023/11/25  2023/11/25 
 _________ JCL59                    74  2023/11/27  2023/11/27 
 _________ MATH1                    28  2023/11/28  2023/11/30 
 _________ NEW                      39  2023/11/29  2023/11/29 
 _________ ONED                     20  2023/11/29  2023/11/29 
 _________ PRC1                     15  2023/11/28  2023/11/29 
 _________ SCRIM                    23  2023/11/28  2023/11/29 
 _________ SEQFILE4                 67  2023/11/23  2023/11/23 
