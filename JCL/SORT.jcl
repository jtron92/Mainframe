***************************** Top of Data ***********
//Z38515A  JOB (MVS),'JORGE',                
//             CLASS=A,                              
//             MSGLEVEL=(1,1),                       
//             MSGCLASS=H,                           
//             NOTIFY=&SYSUID                        
//STEP01   EXEC PGM=SORT                             
//SORTIN   DD DSN=&SYSUID..CHASE,DISP=SHR            
//SORTOUT  DD DSN=&SYSUID..DARK.MATTER,              
//            DISP=(MOD,CATLG,DELETE),               
//            UNIT=SYSDA,                            
//            SPACE=(TRK,(8,1),RLSE),                
//            DCB=(DSORG=PS,LRECL=80,RECFM=FB)       
//SORTWK01 DD UNIT=SYSDA,SPACE=(TRK,(1,1))           
//SORTWK02 DD UNIT=SYSDA,SPACE=(TRK,(1,1))           
//SORTWK03 DD UNIT=SYSDA,SPACE=(TRK,(1,1))           
//SYSIN    DD *                                      
  SORT FIELDS=COPY                                   
/*                                                                    
//SYSPRINT DD SYSOUT=*                                                
//AMSDUMP  DD SYSOUT=*                                                
//SYSOUT   DD SYSOUT=*                                                
**************************** Bottom of Data **************************

JUST TO COPY ^ INPUT FILE TO OUTPUT , BELOW IS TO SORT FIELDS


Command ===>                                                  Scroll ===> CSR  
=COLS> ----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
000100 //MATEDK91 JOB CLASS=A,                                                 
000200 //             MSGCLASS=H,                                              
000300 //             MSGLEVEL=(1,1),                                          
000400 //             NOTIFY=&SYSUID                                           
000410 //*---------------------------------------------------------------      
000420 //* SORTING DATA FROM DSN                                        *      
000430 //*---------------------------------------------------------------      
000500 //STEP01   EXEC PGM=SORT                                                
000600 //SYSIN    DD *                                                         
000610   SORT FIELDS=(3,6,CH,A)                                                
000620 /*                                                                      
000700 //SORTIN   DD DSN=&SYSUID..NOV30TH,DISP=SHR                             
000800 //SORTOUT  DD DSN=MATEDK.NOV29T,DISP=SHR                                
000900 //SYSPRINT DD SYSOUT=*                                                  
001000 //SYSOUT   DD SYSOUT=*                                                  
001100 //AMSDUMP  DD SYSOUT=*                                                  
****** **************************** Bottom of Data ****************************

ABOVE UTILITY SORT IS BEING USED

SORTING FIELDS FROM LINE 3 , ALSO THE DATA IS CHARACTERS AND ACSENDING ORDER 

THE DSN THAT IS BEING SORTED IN QUESTION IS &SYSUID..NOV30TH

AND ITS BEING SORTED OUT TO DSN MATEDK.NOV29T WHICH ALREADY EXIST  DISP=SHR

COULD ALSO IF NEEDED CREATE A NEW DSN TO SORTOUT THE DATA INTO BELOW IS EXAMPLE:

=COLS> ----+----1----+----2----+----3----+----4----+----5----+----6----+----7-
000420 //* SORTING DATA FROM DSN                                        *     
000430 //*---------------------------------------------------------------     
000500 //STEP01   EXEC PGM=SORT                                               
000600 //SYSIN    DD *                                                        
000610   SORT FIELDS=(3,6,CH,A)                                               
000620 /*                                                                     
000700 //SORTIN   DD DSN=&SYSUID..NOV30TH,DISP=SHR                            
000800 //SORTOUT  DD DSN=&SYSUID..NOV31ST,                                    
000810 //            DISP=(NEW,CATLG,DELETE),                                 
000820 //            UNIT=SYSDA,                                              
000830 //            SPACE=(TRK,(8,10),RLSE),                                 
000840 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),            
000850 //            VOL=SER=DEVHD3                                           
000900 //SYSPRINT DD SYSOUT=*                                                 
001000 //SYSOUT   DD SYSOUT=*                                                 
001100 //AMSDUMP  DD SYSOUT=*                                                 
****** **************************** Bottom of Data ***************************



SORT FIELDS=COPY    <--- COPIES THE ENTIRE DATA
SORT FIELDS=(1,6,CH,A)  <---- SORTS FROM COLS 1 LENGTH 6 CHARACTERS IN ASCENDING ORDER 
SORT FIELDS=(1,6,CH,A)  <------ DECSENDING ORDERING
SORT FIELDS-COPY,
STOPAFT=5
SORT FIELDS=COPY,
SKIPREC=2                 <--- SKIPS RECORD FROM THE STARTING POINT OF 2 AND COPIES THE REST


***********************
SORT FIELDS=COPY
SUM FIELDS=NONE           <------ TO COPY AND REMOVE ANY DUPLICATE RECORDS

SORT FIELDS=(1,3,CH,A)
SUM FIELDS=NONE         <----- IF YOU WANT TO SORT THE FIELDS AS WELL AND REMOVE DUPS


EXAMPLE: 

//SYSIN    DD *       
  SORT FIELDS=COPY,   
  STOPAFT=2           

THIS ONLY COPIES 2 RECORDS FROM THE DSN ITS COPYING





  SORT FIELDS=COPY                                            
  SUM FIELDS=NONE,XSUM             <---- YOU MAY NEED TO USE ICETOOL IF XSUM ISNT SUPPORTED                           
/*                                                            
//SORTIN   DD DSN=Z38515.JCL(JCL34),DISP=SHR                  
//SORTOUT  DD DSN=&SYSUID..CHAPT2,                            
//            DISP=(OLD,CATLG,DELETE),                        
//            UNIT=SYSDA,                                     
//            SPACE=(TRK,(8,10),RLSE),                        
//            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)    
//SORTXSUM DD DSN=&SYSUID..XSUM,                              
//            DISP=(NEW,CATLG,DELETE),                        
//            UNIT=SYSDA,                                     
//            SPACE=(TRK,(8,10),RLSE),                        
//            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)    













****** ***************************** Top of Data *********************
000100 //MATEDK01 JOB CLASS=A,                                        
000200 //             MSGCLASS=H,                                     
000300 //             MSGLEVEL=(1,1),                                 
000400 //             NOTIFY=&SYSUID                                  
000500 //STEP01   EXEC PGM=SORT                                       
000600 //SORTIN   DD DSN=MATEDK.BRAVO.SIX,DISP=SHR                    
000700 //SORTOUT  DD DSN=&SYSUID..BRAVO.SEVEN,                        
000800 //            DISP=(OLD,CATLG,DELETE),                         
000900 //            UNIT=SYSDA,                                      
001000 //            VOL=SER=DEVHD3,                                  
001100 //            SPACE=(TRK,(8,10),RLSE),                         
001200 //            DCB=(DSORG=PS,LRECL=80,BLKSIZE=800,RECFM=FB)     
001300 //SYSIN    DD *                                                
001400   SORT FIELDS=COPY                                             
001500   INREC FIELDS(1:6,14,25:21,10)                                
001600 /*                                                             


SORTING START FIELD 1 THEN STARTING DATA FROM WHERE ITS BEING COPIED FROM IS STARTING AT 6 AND LENGTH OF 14
THE NEXT DATA IS GOING TO START ON COLUMN 25, WHERE ITS CURRENTLY RIGHT NOW IS POSITION 21 WITH 10 LENGHT OR BYTES

=COLS> ----+----1----+----2----+----3----+----4----
****** ***************************** Top of Data **
000001 00001 JAMES JACKSON 1966-12-11              
000002 00002 MARIA GARCIA  1953-03-25              
000003 00003 ROBERT SMITH  1983-10-29              
000004 00004 LISA JOHNSON  1976-05-26              
000005 00005 DAVID LEE     1988-10-02              
000006 00006 EMILY DAVIS   1953-03-25              
000007 00007 MICHAEL BROWN 1993-10-31              
000008 00008 SOPHIA WILSON 1960-07-18              
000009 00009 WILLIAM MARTI 1978-11-12              
000010 00010 EMMA TAYLOR   1970-03-02              
****** **************************** Bottom of Data 

AFTER INREC FIELDS AND NEW DSN OUTPUT: 


Command ===>                                         
=COLS> ----+----1----+----2----+----3----+----4----+-
****** ***************************** Top of Data ****
000001  JAMES JACKSON          1966-12-11            
000002  MARIA GARCIA           1953-03-25            
000003  ROBERT SMITH           1983-10-29            
000004  LISA JOHNSON           1976-05-26            
000005  DAVID LEE              1988-10-02            
000006  EMILY DAVIS            1953-03-25            
000007  MICHAEL BROWN          1993-10-31            
000008  SOPHIA WILSON          1960-07-18            
000009  WILLIAM MARTI          1978-11-12            
000010  EMMA TAYLOR            1970-03-02            
****** **************************** Bottom of Data **




SORT FIELDS=COPY 
INCLUDE COND=(7,4,CH,EQ,C'JAMES')  

starting field is at 7 position 4 bytes , character equals copy 'james' 

this is only going to copy that record nothing else

000100 //MATEDK01 JOB CLASS=A,                                      
000200 //             MSGCLASS=H,                                   
000300 //             MSGLEVEL=(1,1),                               
000400 //             NOTIFY=&SYSUID                                
000500 //STEP01   EXEC PGM=SORT                                     
000600 //SORTIN   DD DSN=MATEDK.BRAVO.SIX,DISP=SHR                  
000700 //SORTOUT  DD DSN=&SYSUID..BRAVO.SEVEN,                      
000800 //            DISP=(OLD,CATLG,DELETE),                       
000900 //            UNIT=SYSDA,                                    
001000 //            VOL=SER=DEVHD3,                                
001100 //            SPACE=(TRK,(8,10),RLSE),                       
001200 //            DCB=(DSORG=PS,LRECL=80,BLKSIZE=800,RECFM=FB)   
001300 //SYSIN    DD *                                              
001400   SORT FIELDS=COPY                                           
001500   INCLUDE COND=(7,4,CH,EQ,C'JAMES')                          
001600                                                              

copying from :
=COLS> ----+----1----+----2----+----3----
****** ***************************** Top 
000001 00001 JAMES JACKSON 1966-12-11    
000002 00002 MARIA GARCIA  1953-03-25    
000003 00003 ROBERT SMITH  1983-10-29    
000004 00004 LISA JOHNSON  1976-05-26    
000005 00005 DAVID LEE     1988-10-02    
000006 00006 EMILY DAVIS   1953-03-25    
000007 00007 MICHAEL BROWN 1993-10-31    
000008 00008 SOPHIA WILSON 1960-07-18    
000009 00009 WILLIAM MARTI 1978-11-12    
000010 00010 EMMA TAYLOR   1970-03-02    
****** **************************** Botto

outifle : 

Command ===>                                      
=COLS> ----+----1----+----2----+----3----+----4---
****** ***************************** Top of Data *
000001 00001 JAMES JACKSON 1966-12-11             
****** **************************** Bottom of Data
                                                  
                                                  
                                                  
