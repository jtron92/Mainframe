=COLS> ----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
****** ***************************** Top of Data *****************************
000100 //JOBRUN01 JOB (ACCOUNTING),                     
000110 //             MSGCLASS=H,                                             
000200 //             CLASS=A,                                                
000201 //             NOTIFY=&SYSUID,                                         
000202 //             MSGLEVEL=(1,1)                                          
000203 //PROC100  PROC                                                        
000204 //JS10     EXEC PGM=SORT                                                                                             
000205 //SORTIN   DD DISP=SHR,DSN=&DSNSORT                                     
000206 //SORTOUT  DD SYSOUT=*                                                  
000220 //SYSIN    DD *                                                         
000230   SORT FIELDS=(1,3,CH,A)                                                
000240 /*                                                                      
000250 //AMSDUMP  DD SYSOUT=*                                                  
000260 //SYSOUT   DD SYSOUT=*                                                  
000270 //         PEND                                                         
000280 //STEP01   EXEC PROC100,DSNSORT=Z38515.SORTJOB                          
000290 //JS10.SORTOUT DD DSN=&SYSUID..MYSORT,                                  
000300 //            DISP=(NEW,CATLG,DELETE),                                  
000400 //            UNIT=SYSDA,                                               
000500 //            SPACE=(TRK,(8,10),RLSE),                                  
000600 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)              
****** **************************** Bottom of Data ****************************




DSN Z38515.SORTJOB  

STEP01  EXECUTE PROC100 
  WHICHS SORT INS A DSN THAT IS ALREADY EXISTING AND DISP EQUALS SHARE
DSN=&DSNSORT   YOU CAN NAME THIS SOMETHING ELSE BUT IN STEP01 WE WILL CALL THIS SO THAT THE PROCEDURE CAN SORT THIS DATASET
  SORT IN FIELDS 1 , 3 , CHARACTERS , ACSENDING ORDER
ENDING THE PROCEDURE WITH A PEND

STEP01 EXECUTE PROC100, DSNSORT=DSN
JS10.SORTOUT OVERRIDES THE SORTOUT FROM THE PROC AND NOW WE ARE CREATING AN SORT OUT DSN TO VIEW THE RESULTS 

BELOW IS THE DSN SORT IN : 

---------------------------------------------------
EDIT       Z38515.SORTJOB                          
****** ***************************** Top of Data **
000100 TUPAC                                       
000200 BIGGIE                                      
000300 EMINEM                                      
000400 WAYNE                                       
****** **************************** Bottom of Data 



SORT OUT DSN :
 ------------------------------------
 EDIT       Z38515.MYSORT            
 ****** *****************************
 000001 BIGGIE                       
 000002 EMINEM                       
 000003 TUPAC                        
 000004 WAYNE                        
 ****** **************************** 
                                     
                                     
                                     
                                                   
                                                   
