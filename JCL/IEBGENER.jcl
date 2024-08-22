//Z38515A  JOB (MVS),'JORGE CINTRON',                              
//             MSGLEVEL=(1,1),                                     
//             MSGCLASS=H,                                         
//             CLASS=A,                                            
//             NOTIFY=&SYSUID                                      
//STEP01   EXEC PGM=IEBGENER                                       
//**************************************************************** 
//* COPY ONE MEMBER FROM A PDS TO ANOTHER PDS AS A NEW MEMBER      
//*                                                                
//*  SYSUT1 DSN PDS MEMBER BALL1 IS GOING TO BE COPIED             
//*                                                                
//*  INTO PDS DSN AS THE NAME IMEM                                 
C/**************************************************************** 
//SYSUT1   DD DSN=Z38515.ALPHA(BALL1),DISP=SHR                     
//SYSUT2   DD DSN=Z38515.ALL.MIGHT(IMEM),DISP=SHR                  
//SYSIN    DD DUMMY                                                
//SYSPRINT DD SYSOUT=*                                             
//AMSDUMP  DD SYSOUT=*  
**************************** Bottom of Data *****************






Command ===>                                                  Scroll ===> CSR  
=COLS> ----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
****** ***************************** Top of Data ******************************
000100 //MATEDK91 JOB CLASS=A,                                                 
000200 //             MSGCLASS=H,                                              
000300 //             MSGLEVEL=(1,1),                                          
000400 //             NOTIFY=&SYSUID                                           
000410 //*---------------------------------------------------------------      
000420 //* COPYING DATA FROM DSN1 = SYSUT1 TO A NEW DSN = SYSUT2        *      
000430 //*---------------------------------------------------------------      
000500 //STEP01   EXEC PGM=IEBGENER                                            
000600 //SYSUT1   DD DSN=MATEDK.NOV29T,DISP=SHR                                
000700 //SYSUT2   DD DSN=&SYSUID..NOV30TH,                                     
000710 //            DISP=(NEW,CATLG,DELETE),                                  
000720 //            UNIT=SYSDA,                                               
000730 //            SPACE=(TRK,(8,10),RLSE),                                  
000740 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),             
000750 //            VOL=SER=DEVHD3                                            
000800 //SYSIN    DD DUMMY                                                     

WHAT IS HAPPENING IS THAT I AM USING AN EXISTING DATASET MATEDK.NOV29T AND COPYING THE DATA FROM THERE INTO A NEW DATASET &SYSUID..NOV30TH  

ALSO I CAN ADD MANUALLY DATA MYSELF FOR EXAMPLE BELOW


Command ===>                                                  Scroll ===> CS
=COLS> ----+----1----+----2----+----3----+----4----+----5----+----6----+----
000200 //             MSGCLASS=H,                                           
000300 //             MSGLEVEL=(1,1),                                       
000400 //             NOTIFY=&SYSUID                                        
000410 //*---------------------------------------------------------------   
000420 //* COPYING DATA FROM DSN1 = SYSUT1 TO A NEW DSN = SYSUT2        *   
000430 //*---------------------------------------------------------------   
000500 //STEP01   EXEC PGM=IEBGENER                                         
000600 //SYSUT1   DD *                                                      
000610   DATA1                                                              
000620   DATA2                                                              
000700 //SYSUT2   DD DSN=&SYSUID..NOV30TH,DISP=SHR                          
000800 //SYSIN    DD DUMMY                                                  
000900 //SYSPRINT DD SYSOUT=*                                               
001000 //SYSOUT   DD SYSOUT=*                                               
****** **************************** Bottom of Data *************************

USING THE IEBGENER UTILITY ADDING THE DATA FROM SYSUT1 INTO SYSUT2

ONLY THING IS SYSUT2 DSN IS ALREADY CREATED SO DISP=SHR SHARING AND DATASET IS ALREADY MADE. CAN ALSO SEARCH THIS DSN IN 3.4 

IF I WOULD HAVE LEFT IT AS BEFORE IN THE FIRST SESSION LIKE DISP(NEW,CATLG,DELETE) AND OTHER PARAMS 

I WOULD HAVE GOTTEN A JCL ABEND BECAUSE ITS A DUPICALTE DSN








*******

IF YOU WANT TO ADD A MEMBER TO AN EXISTING PO FILE : 

JUST ADD THE PDS FILE AND ADD THE MEMBER AT THE END OF IT 

000100 //Z38515A  JOB (ACCT),'JORGE CINTRON',           
000200 //             CLASS=A,                          
000300 //             MSGLEVEL=(1,1),                   
000400 //             MSGCLASS=H,                       
000500 //             NOTIFY=&SYSUID                    
000600 //STEP01   EXEC PGM=IEBGENER                     
000700 //SYSUT1   DD *                                  
000730 //SYSUT2   DD DSN=Z38515.ALPHA4(ONE),DISP=SHR    
001200 //SYSPRINT DD SYSOUT=*                           
001300 //AMSDUMP  DD SYSOUT=*                           
001400 //SYSABEND DD SYSOUT=*                           
001500 //SYSOUT   DD SYSOUT=*                           
001600 //SYSIN    DD DUMMY                              
****** **************************** Bottom of Data *****
                                                        
