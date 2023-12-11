
=COLS> ----+----1----+----2----+----3----+----4-
****** ***************************** Top of Data
000100 //LISTCAT1 JOB CLASS=A,                  
000200 //             MSGCLASS=H,               
000300 //             MSGLEVEL=(1,1),           
000400 //             NOTIFY=&SYSUID            
000500 //STEP01   EXEC PGM=IDCAMS               
000600   LISTCAT ENTRY (Z38515.EMP.KSDS)-       
000700   ALL)                                   
000800 /*                                       
000900 //SYSPRINT DD SYSOUT=*                   
001000 //AMSDUMP  DD SYSOUT=*                   
001100 //SYSOUT   DD SYSOUT=*                   
****** **************************** Bottom of Da



THIS IS TO VIEW THE PROPERTIES OF THE VSAM FILE IN QUESTION IF YOU DONT HAPPEN TO KNOW WHATS INSIDE THE FILE RUN THIS JCL

ALSO CAN SWITCH THE SYSPRINT T0 SYSPRINT DD DISP=SHR,DSN=DATASET   IF YOU WANT IT TO PRINT INTO A DSN


                                                                                
  LISTCAT ENTRY (Z38515.EMP.KSDS)-                                      00060000
  ALL)                                                                  00070000
IDC0233I TOO MANY RIGHT PARENTHESES FOUND.  EXCESS IGNORED                      
CLUSTER ------- Z38515.EMP.KSDS                                                 
     IN-CAT --- CATALOG.ZOSC                                                    
     HISTORY                                                                    
       DATASET-OWNER-----(NULL)     CREATION--------2023.336                    
       RELEASE----------------2     EXPIRATION------0000.000                    
     SMSDATA                                                                    
       STORAGECLASS -------ZXPS     MANAGEMENTCLASS---(NULL)                    
       DATACLASS ---------ZXPDX     LBACKUP ---0000.000.0000                    
       CA-RECLAIM---------(YES)                                                 
       EATTR-------------(NULL)                                                 
       BWO STATUS------00000000     BWO TIMESTAMP---00000 00:00:00.0            
    RLSDATA                                                                    
      LOG ----------------(NULL)   RECOVERY REQUIRED --(NO)     FRLOG ---------
      VSAM QUIESCED -------(NO)    RLS IN USE ---------(NO)     LOGREPLICATE---
      LOGSTREAMID-----------------------------(NULL)                           
      RECOVERY TIMESTAMP LOCAL-----X'0000000000000000'                         
      RECOVERY TIMESTAMP GMT-------X'0000000000000000'                         
      DATABASE -----------------(NULL)                                         
      KEYNAMES -----------------(NULL)                                         
    ENCRYPTIONDATA                                                             
      DATA SET ENCRYPTION-----(NO)                                             
    PROTECTION-PSWD-----(NULL)     RACF----------------(NO)                    
    ASSOCIATIONS                                                               
      DATA-----Z38515.EMP.KSDS.DATA                                            
      INDEX----Z38515.EMP.KSDS.INDEX                                           
  DATA ------- Z38515.EMP.KSDS.DATA                                            
    IN-CAT --- CATALOG.ZOSC                                                    
    HISTORY                                                                    
      LOG ----------------(NULL)   RECOVERY REQUIRED --(NO)     FRLOG ---------
      VSAM QUIESCED -------(NO)    RLS IN USE ---------(NO)     LOGREPLICATE---
      LOGSTREAMID-----------------------------(NULL)                           
      RECOVERY TIMESTAMP LOCAL-----X'0000000000000000'                         
      RECOVERY TIMESTAMP GMT-------X'0000000000000000'                         
      DATABASE -----------------(NULL)                                         
      KEYNAMES -----------------(NULL)                                         
    ENCRYPTIONDATA                                                             
      DATA SET ENCRYPTION-----(NO)                                             
    PROTECTION-PSWD-----(NULL)     RACF----------------(NO)                    
    ASSOCIATIONS                                                               
      DATA-----Z38515.EMP.KSDS.DATA                                            
      INDEX----Z38515.EMP.KSDS.INDEX                                           
  DATA ------- Z38515.EMP.KSDS.DATA                                            
    IN-CAT --- CATALOG.ZOSC                                                    
    HISTORY                                                                    
      DATASET-OWNER-----(NULL)     CREATION--------2023.336                    
       RELEASE----------------2     EXPIRATION------0000.000                    
       ACCOUNT-INFO-----------------------------------(NULL)                    
     PROTECTION-PSWD-----(NULL)     RACF----------------(NO)                    
     ASSOCIATIONS                                                               
       CLUSTER--Z38515.EMP.KSDS                                                 
     ATTRIBUTES                                                                 
       KEYLEN-----------------6     AVGLRECL--------------80     BUFSPACE-------
       RKP--------------------0     MAXLRECL--------------80     EXCPEXIT-------
       SHROPTNS(1,3)   RECOVERY     UNIQUE           NOERASE     INDEXED       N
       NONSPANNED                                                               
     STATISTICS                                                                 
       REC-TOTAL--------------1     SPLITS-CI--------------0     EXCPS----------
IDCAMS  SYSTEM SERVICES                                           TIME: 07:53:20
       REC-DELETED-----------10     SPLITS-CA--------------0     EXTENTS--------
       REC-INSERTED-----------1     FREESPACE-%CI----------0     SYSTEM-TIMESTAM
       REC-UPDATED-----------28     FREESPACE-%CA----------0          X'DE54C7FB
       REC-RETRIEVED--------145     FREESPC----------2633728                    
COMMAND INPUT ===>                                            SCROLL ===> CSR  
    ALLOCATION                                                                 
      SPACE-TYPE------CYLINDER     HI-A-RBA---------2634240                    
      SPACE-PRI--------------7     HI-U-RBA----------376320                    
      SPACE-SEC--------------7                                                 
    VOLUME                                                                     
      VOLSER------------ZXPL01     PHYREC-SIZE----------512     HI-A-RBA-------
      DEVTYPE------X'3010200F'     PHYRECS/TRK-----------49     HI-U-RBA-------
      VOLFLAG------------PRIME     TRACKS/CA-------------15                    
      EXTENTS:                                                                 
      LOW-CCHH-----X'17CD0000'     LOW-RBA----------------0     TRACKS---------
      HIGH-CCHH----X'17D3000E'     HIGH-RBA---------2634239                    
  INDEX ------ Z38515.EMP.KSDS.INDEX                                           
    IN-CAT --- CATALOG.ZOSC                                                    
    HISTORY                                                                    
      DATASET-OWNER-----(NULL)     CREATION--------2023.336                    
      RELEASE----------------2     EXPIRATION------0000.000                    
    PROTECTION-PSWD-----(NULL)     RACF----------------(NO)                    
    ASSOCIATIONS                                                               
      CLUSTER--Z38515.EMP.KSDS                                                 
    ATTRIBUTES                                                                 
      KEYLEN-----------------6     AVGLRECL---------------0     BUFSPACE-------
      RKP--------------------0     MAXLRECL------------6137     EXCPEXIT-------
      SHROPTNS(1,3)   RECOVERY     UNIQUE           NOERASE     NOWRITECHK     
    STATISTICS                                                                 
      REC-TOTAL--------------1     SPLITS-CI--------------0     EXCPS----------
      REC-DELETED------------0     SPLITS-CA--------------0     EXTENTS--------
      REC-INSERTED-----------0     FREESPACE-%CI----------0     SYSTEM-TIMESTAM
      REC-UPDATED------------0     FREESPACE-%CA----------0          X'DE54C7FB
      REC-RETRIEVED----------0     FREESPC------------43008                    
    ALLOCATION                                                                 
      SPACE-TYPE---------TRACK     HI-A-RBA-----------49152                    
      SPACE-PRI--------------1     HI-U-RBA------------6144                    
      SPACE-SEC--------------1                                                 
    VOLUME                                                                     
       VOLSER------------ZXPL01     PHYREC-SIZE---------6144     HI-A-RBA-------
       DEVTYPE------X'3010200F'     PHYRECS/TRK------------8     HI-U-RBA-------
       VOLFLAG------------PRIME     TRACKS/CA--------------1                    
       EXTENTS:                                                                 
       LOW-CCHH-----X'042A0003'     LOW-RBA----------------0     TRACKS---------
       HIGH-CCHH----X'042A0003'     HIGH-RBA-----------49151                    
       LOW-CCHH-----X'042A0003'     LOW-RBA----------------0     TRACKS---------
       HIGH-CCHH----X'042A0003'     HIGH-RBA-----------49151                    
IDCAMS  SYSTEM SERVICES                                           TIME: 07:53:20
         THE NUMBER OF ENTRIES PROCESSED WAS:                                   
                   AIX -------------------0                                     
                   ALIAS -----------------0                                     
                   CLUSTER ---------------1                                     
                   DATA ------------------1                                     
                   GDG -------------------0                                     
                   INDEX -----------------1                                     
                   NONVSAM ---------------0                                     
                   PAGESPACE -------------0                                     
                   PATH ------------------0                                     
                   SPACE -----------------0                                     
                   USERCATALOG -----------0                                     
                   TAPELIBRARY -----------0                                     
                   TAPEVOLUME ------------0                                  


------------------------------------------------------------------------------ 
DSLIST - Data Sets Matching Z38515*                                Row 1 of 25 
                                                                               
Command - Enter "/" to select action                  Message           Volume 
-------------------------------------------------------------------------------
         Z38515                                                         *ALIAS 
         Z38515.CBCOMPL                                                 ZXPM07 
         Z38515.CBLOADER                                                ZXPL01 
         Z38515.CBSOURCE                                                ZXPM07 
         Z38515.COMPLETE                                                ZXPM04 
         Z38515.COPY.TOOL                                               ZXPM07 
         Z38515.COURSE.JCLLIB                                           ZXPM06 
         Z38515.CUSTOMER.FILE1                                          ZXPM03 
         Z38515.DITPROF                                                 ZXPL01 
I        Z38515.EMP.KSDS                              Info - I          *VSAM* 
         Z38515.EMP.KSDS.DATA                                           ZXPL01 


------------------------------------------------------------------------------ 
                           List Catalog Information                            
                                                                               
                                               Enter "/" to select option      
                                               /  Edit IDCAMS command          
 Listcat Name  . . . Z38515.EMP.KSDS                                           
    Level  . . . . .                                                           
                                                                   More:     + 
                                 Enter any of the following keywords:          
                                                                               
 Catalog Data Type               Name, History, Volume,                        
 3   1.  Alias                   ALLOcation, All  . . . ALL                    
     2.  Alternate Index                                                       
     3.  Cluster                                                               
     4.  Data                                                                  
     5.  Generation Data Group                                                 
     6.  Index                                                                 
     7.  Non-VSAM                                                              
     8.  Page Space                                                            
     9.  Path                                                                  

  -------------------------------------------------------------------------------
                                                             Columns 00001 00072 
                                                                                 
      Instructions:                                                              
                                                                                 
        Enter EXECute command to issue request.                                  
                                                                                 
        Enter CANcel, END, or RETURN command to cancel request.                  
  ****** ***************************** Top of Data ******************************
  ==MSG> -Warning- The UNDO command is not available until you change            
  ==MSG>           your edit profile using the command RECOVERY ON.              
  000001  /* IDCAMS COMMAND */                                                   
  000002     LISTCAT ENTRIES(Z38515.EMP.KSDS) -                                  
  000003             CLUSTER -                                                   
  000004             ALL                                                         
  ****** **************************** Bottom of Data ****************************
                                                                                 
                                                                                 
                                                                                 
                                                                                 
  Command ===> EXECUTE                                          Scroll ===> PAGE 
   F1=Help      F2=Split     F3=Exit      F4=Expand    F5=Rfind     F6=Rchange   
   F7=Up        F8=Down      F9=Swap     F10=Left     F11=Right    F12=Cancel    

