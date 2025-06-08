Command ===>                                                  Scroll 
****** ***************************** Top of Data ********************
000100 //JCLTRAIN JOB CLASS=A,                                       
000200 //             MSGCLASS=H,                                    
000300 //             MSGLEVEL=(1,1),                                
000400 //             NOTIFY=&SYSUID                                 
000401 //PROCLOC  JCLLIB ORDER=Z38515.ALPHA 
000402 //         SET  MNAME=&SYSUID..FIGHT6  
000403 //STEP01   EXEC PGM=SORT                                      
000404 //         INCLUDE MEMBER=TRAIN2                                                    
****** **************************** Bottom of Data ******************
                                                                     
                                                                     
JCL Statement SET you can use Symbolic parameters to change the name of a dsn quickly and in one spot verus 
copy and pasting dsn names across the job 

SORTOUT DD DSN=&MNAME,       YOU CAN NAME IT ALMOST ANYTHING YOU WANT JUST ADD THE APERSAND SYMBOL & NEXT TO THE NAME

You dont need it to be in a private lib or a procedure it can be as simple as you want to set the symlobic name on the bottom like this

000401 //         SET  MNAME=&SYSUID..FIGHT7   
000402 //STEP01   EXEC PGM=IEFBR14                                   
000403 //DD1      DD DSN=&MNAME,                                     
000404 //            DISP=(NEW,CATLG,DELETE),                        
000405 //            UNIT=SYSDA,                                     
000406 //            SPACE=(TRK,(8,10),RLSE),                        
000407 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)                          
****** **************************** Bottom of Data ******************
                                                                     






EDIT       Z38515.ALPHA(TRAIN2) - 01.02                    Columns
Command ===>                                                  Scro
****** ***************************** Top of Data *****************
000100 //SORTIN   DD DSN=Z38515.ALPHA(FRIZ2),DISP=SHR             
000200 //         DD DSN=Z38515.ALPHA(FRIZ),DISP=SHR              
000300 //SORTOUT  DD DSN=&MNAME,                                  
000400 //            DISP=(NEW,CATLG,DELETE),                     
000500 //            UNIT=SYSDA,                                  
000600 //            SPACE=(TRK,(8,10),RLSE),                     
000700 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800) 
000800 //SYSIN    DD *                                            
000900   SORT FIELDS=(1,3,CH,A)                                   
001000 /*                                                         
001100 //AMSDUMP  DD SYSOUT=*                                     
001200 //SYSOUT   DD SYSOUT=*                                     
001300 //SYSPRINT DD SYSOUT=*                                     
****** **************************** Bottom of Data ***************



 EDIT       Z38515.ALPHA(FRIZ) - 01.00                      Co
 Command ===>                                                 
 ****** ***************************** Top of Data ************
 000100 EMPLOYEE NAME                                         
 000200 JORGE                                                 
 000300 BRAXTON                                               
 000400 TIFFANY                                               
 000500 ALEX                                                  
 000600 ANNA                                                  
 ****** **************************** Bottom of Data **********
                                                              
                                                              
                                                              
 EDIT       Z38515.ALPHA(FRIZ2) - 01.00               
Command ===>                                         
****** ***************************** Top of Data ****
000100 EMPLOYEE NAME                                 
000200 JACKIE                                        
000300 SETH                                          
000400 TANNER                                        
****** **************************** Bottom of Data **
                                                     
                                                     
 these two files are now in train2 to be sorted 

sorted out file below 


EDIT       Z38515.FIGHT5                     
Command ===>                                 
****** ***************************** Top of D
000001 ALEX                                  
000002 ANNA                                  
000003 BRAXTON                               
000004 EMPLOYEE NAME                         
000005 EMPLOYEE NAME                         
000006 JACKIE                                                           
000008 SETH                                  
000009 TANNER                                
000010 TIFFANY                               
****** **************************** Bottom of
                                             
                                             
                                             



                                                                  
