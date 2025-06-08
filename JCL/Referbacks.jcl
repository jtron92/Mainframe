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



000100 //Z38515A  JOB (ACCT),               
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


000100 //Z38515A  JOB (ACCT),                        
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










********************************GOOD EXAMPLE****************************************************

Restarting the job 

has to the step from the execution of the procedure so 

find the exec procname 

STEP01 EXEC HLASMJOB 

OR 

STEP02 EXEC HLASMJOB

Next add what step you want that procedure to start on 

since we are compiling code start from the first step which is compile

so you can either start it from STEP01.COMPILE OR STEP02.COMPILE

next

go view STEP03 exec IBEGENER

SYSUT1 is going to copy from an existing dsn 

kinda the same logic 

find the procedure step

STEP02 

Then find the step you want to copy from so step named RUN , since we have already ran this code the loadlib is ready 

Next

OFILE since its poiting to the dsn

OFILE DD DSN=


SO LIKE THIS =*.STEP02.RUN.OFILE,DISP=SHR


 000000 //HLASMJO  JOB (MVS),                                   
 000020 //             MSGLEVEL=(1,1),                                          
 000030 //             MSGCLASS=H,                                              
 000040 //             CLASS=A,                                                 
 000050 //             NOTIFY=&SYSUID,RESTART=STEP02.COMPILE                    
 000100 //HLASMJOB PROC LOADLIB='IBMUSER.ALOAD',                                
 000200 //             SRCLIB='IBMUSER.HLASM.LIB',                              
 000300 //             MEMBER='TUES',                                           
 000400 //             ODSN='IBMUSER.APOD'                                      
 000600 //COMPILE  EXEC PGM=ASMA90                                              
 000700 //SYSLIB   DD DSN=SYS1.MACLIB,DISP=SHR                                  
 000800 //SYSIN    DD DSN=&SRCLIB(&MEMBER),DISP=SHR                             
 000900 //SYSUT1   DD DSN=&&SYSUT1,SPACE=(4096,(120,120),,,ROUND),UNIT=VIO,     
 001000 //            DCB=BUFNO=1                                               
 001100 //SYSLIN   DD DSN=&&OBJ,DISP=(MOD,PASS),UNIT=VIO,                       
 001200 //            SPACE=(3096,(40,40),,,ROUND),                             
 001300 //            DCB=(LRECL=80,RECFM=FBS,BLKSIZE=3200,BUFNO=1)             
 001400 //SYSPRINT DD SYSOUT=*                                                  
 001500 //AMSDUMP  DD SYSOUT=*            
 001600 //SYSOUT   DD SYSOUT=*                                                  
 001700 //LKED     EXEC PGM=HEWL                                                
 001800 //SYSLMOD  DD DSN=&LOADLIB(&MEMBER),DISP=SHR                            
 001900 //SYSLIN   DD DSN=&&OBJ,DISP=(OLD,DELETE)                               
 002000 //SYSUT1   DD DSN=&&SYSUT1,SPACE=(4096,(120,120),,,ROUND),UNIT=VIO,     
 002100 //            DCB=BUFNO=1                                               
 002200 //SYSPRINT DD SYSOUT=*                                                  
 002300 //AMSDUMP  DD SYSOUT=*                                                  
 002400 //SYSOUT   DD SYSOUT=*                                                  
 002500 //RUN      EXEC PGM=*.LKED.SYSLMOD                                      
 002600 //OFILE    DD DSN=&ODSN,DISP=SHR                                        
 002610 //SYSPRINT DD SYSOUT=*                                                  
 002620 //AMSDUMP  DD SYSOUT=*                                                  
 002630 //SYSOUT   DD SYSOUT=*                                                  
 003700 //         PEND                                                         
 003800 //STEP01   EXEC HLASMJOB                                                
 003900 //STEP02   EXEC HLASMJOB,                                               
 004000 //             LOADLIB=IBMUSER.ALOAD,                                   
 004100 //             SRCLIB=IBMUSER.HLASM.LIB,       
 004200 //             MEMBER=ONE,                                              
 004300 //             ODSN=IBMUSER.AVALON                                      
 004400 //STEP03   EXEC PGM=IEBGENER                                            
 004500 //SYSUT1   DD DSN=*.STEP02.RUN.OFILE,DISP=SHR                           
 004600 //SYSUT2   DD DSN=&SYSUID..ADRAKE,                                      
 004700 //            DISP=(OLD,CATLG,DELETE),                                  
 004800 //            UNIT=SYSDA,                                               
 004900 //            SPACE=(TRK,(2,2),RLSE),                                   
 005000 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=3200)             
 005100 //SYSIN    DD DUMMY                                                     
 005200 //SYSPRINT DD SYSOUT=*                                                  
 005300 //AMSDUMP  DD SYSOUT=*                                                  
 005400 //SYSOUT   DD SYSOUT=*                                                  
 ****** ***************************


                                                                         
