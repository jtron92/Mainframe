Using the JCL facility called backwards reference lets you obtain information from pervious DD statements within the job. 
So you dont have to code the excat same thing in a job. 

Example: 

001100 //SYSUT2   DD DSN=&SYSUID..TRAIN1,                           
001200 //            DISP=(NEW,CATLG,DELETE),                       
001300 //            UNIT=SYSDA,                                    
001400 //            SPACE=(TRK,(8,10),RLSE),                       
001500 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800)   
001510 //         DD DSN=&SYSUID..TRAIN2,                           
001520 //            DISP=(NEW,PASS),                               
001530 //            UNIT=SYSDA,                                    
001540 //            SPACE=(TRK,(8,10),RLSE),                       
001550 //            DCB=*.SYSUT2                                   

In the DCB=*SYSUT2 

its going to use the same DCB values from the first dsn in sysut2

if this was in a different step it would look like this

DCB=*.STEP1.SYSUT2

You may need to instruct a step in your JCL to access the same volume that is associated with a specific data set name, or that was referenced earlier in the job. One method of achieving this is using the VOL=REF parameter, which uses referback syntax similar to that discussed in earlier modules. The syntax for this parameter is:

VOL=REF=dsname
VOL=REF=*.ddname
VOL=REF=*.stepname.ddname
VOL=REF=*.stepname.procstepname.ddname



000100 //Z38515A  JOB (ACCT),'JORGE',               
000200 //             MSGCLASS=H,                           
000300 //             MSGLEVEL=(1,1),                       
000400 //             CLASS=A,                              
000500 //             NOTIFY=&SYSUID                        
000600 //STEP01   EXEC PGM=IEBGENER                         
000700 //SYSUT1   DD DSN=Z38515.CHASE,DISP=SHR              
000800 //SYSUT2   DD DSN=Z38515.CHAS3,                      
000900 //            DISP=(,CATLG),                         
001000 //            UNIT=SYSDA,                            
001100 //            SPACE=(TRK,(8,10),RLSE),               
001200 //            DCB=*.SYSUT1                           
001950 //SYSPRINT DD SYSOUT=*                               
001960 //AMSDUMP  DD SYSOUT=*                               
001970 //SYSOUT   DD SYSOUT=*                               
001980 //SYSIN    DD DUMMY                                  



*********** FROM A PROC 


000100 //Z38515A  JOB (ACCT),'JORGE',                        
000200 //             MSGCLASS=H,                                    
000300 //             MSGLEVEL=(1,1),                                
000400 //             CLASS=A,                                       
000500 //             NOTIFY=&SYSUID                                 
000510 //PROC100  PROC                                               
000600 //STEP01   EXEC PGM=IEBGENER                                  
000700 //SYSUT1   DD DSN=Z38515.CHASE,DISP=SHR                       
000800 //SYSUT2   DD DSN=Z38515.CHAS5,                               
000900 //            DISP=(,PASS),                                   
001000 //            UNIT=SYSDA,                                     
001100 //            SPACE=(TRK,(8,10),RLSE),                        
001200 //            DCB=*.SYSUT1                                    
001950 //SYSPRINT DD SYSOUT=*                                        
001960 //AMSDUMP  DD SYSOUT=*                                        
001970 //SYSOUT   DD SYSOUT=*                                        
001980 //SYSIN    DD DUMMY                                           
Command ===>                                                  Scroll ===>
001990 //         PEND                                                   
001991 //STEP011  EXEC PROC100                                           
002000 //STEP02   EXEC PGM=IEFBR14                                       
002100 //DD1      DD DSN=&SYSUID..DR,                                    
002200 //            DISP=(,PASS),                                       
002300 //            UNIT=SYSDA,                                         
002400 //            SPACE=(TRK,(8,10),RLSE),                            
002500 //            DCB=*.STEP011.STEP01.SYSUT2                         
****** **************************** Bottom of Data **********************

GOTTA POINT IT FIRST TO WHERE THE PROCEDURE IS GOING TO BE EXECUTED FIRST WHICH WOULD BE 
STEP011 THEN
FOLLOW THE EXECECUTION OF THE PGM IN THE PROC WHICH IS STEP01 
FROM HERE YOU CAN EITHER CHOOSE THE DD STATEMENT LIKE SYSUT2
                                                                         
