000100 IDENTIFICATION DIVISION.                
000200 PROGRAM-ID. KDSD.                       
000300 ENVIRONMENT DIVISION.                   
000400 INPUT-OUTPUT SECTION.                   
000500 FILE-CONTROL.                           
000600     SELECT IFILE ASSIGN TO CUSTDD       
000700     ORGANIZATION IS INDEXED             
000800     ACCESS MODE IS RANDOM               
           RECORD KEY  IS EMP-ID               
000900     FILE STATUS IS FLAG.                
001000 DATA DIVISION.                          
001100 FILE SECTION.                           
001200 FD IFILE.                               
001300 01 IFILE-RECS.                          
001400   05 EMP-ID PIC 9(6).                         
001500   05 EMPLOYEE-NAME PIC X(30).                 
001600   05 EMPLOYEE-DETAILS PIC X(44).              
       WORKING-STORAGE SECTION.                      
       01 FLAG    PIC X(2).                          
         88 FILE-OK  VALUE "00".                     
         88 FILE-DUP VALUE "02".                     
         88 FILE-EOF VALUE "10".                     
       PROCEDURE DIVISION.                           
       000-MAIN-PROCEDURE.                           
            PERFORM OPEN-FILE THRU OPEN-EXIT.        
            PERFORM PROCESS-FILE THRU PROCESS-EXIT.  
            PERFORM CLOSE-FILE THRU CLOSE-EXIT.      
            STOP RUN.                                
       OPEN-FILE.                                    
            OPEN I-O IFILE.                          
            IF FILE-OK                               
                CONTINUE                                
             ELSE                                       
                DISPLAY "FAILURE TO OPEN" FLAG          
             GO TO EXIT-PARA                            
             END-IF.                                    
        OPEN-EXIT.                                      
             EXIT.                                      
        PROCESS-FILE.                                   
             MOVE 000003 TO EMP-ID                      
             READ IFILE                                 
             KEY IS EMP-ID                              
             INVALID KEY                                
             DISPLAY "INVALID KEY"                      
             NOT INVALID KEY                            
             DISPLAY "EMP-NAME BEFORE :" EMPLOYEE-NAME  
             END-READ.                                  
             MOVE "TYRONE MORRIS" TO EMPLOYEE-NAME      
            DISPLAY "EMP-NAME AFTER : "  EMPLOYEE-NAME   
            REWRITE IFILE-RECS                           
            END-REWRITE.                                 
       PROCESS-EXIT.                                     
            EXIT.                                        
       CLOSE-FILE.                                       
            CLOSE IFILE.                                 
       CLOSE-EXIT.                                       
            EXIT.                                        
       EXIT-PARA.                                        
            EXIT.     

The file is defined with indexed organization and random access mode, with EMP-ID as its record key. The program checks and handles file status using a flag defined in the Working-Storage Section.
THE VSAM HAS 6 ZEROS (KEYS) AND HAS RECORD SIZE OF 80 , SO ENOUGH FOR AN EMPLOYEES NAME SO ADDED THESE VALUES AND PIC CLAUSE TO MATCH

ALSO ADDED A FILE STATUS NAMED FLAG JUST TO SEE THE STATUS OF THE FILE WHEN ITS OPEN , WRITTEN AND CLOSE

SINCE THIS LOGICAL FILE TO PHYSICAL FILE IS NOT JUST BEING READ BUT WRITTEN PUTTING THIS INTO I-O MODE

OPENING IN I-O MODE IN THE PARAGRAPH OPEN-FILE.

NEXT SEEING IF FILE-OK IS TRUE WHICH IF IT IS THE FILE CODE IS 00 IF THIS CONDITION IS TRUE CONTUINE TO NEXT PARAGRAPH AND SKIP ELSE

IF ELSE DISPLAY "FAILURE" AND THE FLAG WHICH IS THE FILE STATUS AFTER THAT THERES A GO TO NEXT-PARA WHICH GOES TO THE END OF THE PROGRAM EXIT.

NEXT PARAGRAPH IS PROCESS-FILE

WERE MOVING A NUMBER TO EMP-ID
THEN READING THE FILE
KEY IS EMP-ID
IF INVALID KEY DISPLAY "INVALID KEY" 
IF ITS NOT AN INVALID KEY
DISPLAY "EMP" EMPLOYEE NAME
THEN END READ

MOVE "NAME OF EMPLOYEE" TO EMPOLYEE-NAME
THEN DISPLAY NEW EMPL NAME
AND REWRITE IN THE FILE 
THEN CLOSE REWRITE

AFTER THIS COMPLIE THE CODE AND RUN IT BELOW IS THE JCL TO DEFINE THE CLUSTER



000100 //CREATGDG JOB CLASS=A,                           
000200 //             MSGCLASS=H,                        
000300 //             MSGLEVEL=(1,1),                    
000400 //             NOTIFY=&SYSUID                     
000500 //*-------------------------                      
000600 //* END OF JOB CARD                               
000700 //*-------------------------                      
000800 //STEP01   EXEC PGM=IDCAMS                        
000810 //SYSIN    DD *                                   
000820   DEFINE CLUSTER(NAME(Z38515.EMP.KSDS) -          
000821   INDEXED -                                       
000822   KEYS(6 0)-                                      
000823   RECORDSIZE(80 80) -                             
000824   CYLINDERS(5 2) -                                
000825   FREESPACE(10 10) -                
000826   )                                 
000827   DATA(NAME(Z38515.EMP.KSDS)-       
000828   )                                 
000829   INDEX(NAME(Z38515.EMP.KSDS)-      
000830   )                                 
000831 /*                                  
001500 //SYSPRINT DD SYSOUT=*              
001600 //SYSOUT   DD SYSOUT=*              
001700 //AMSDUMP  DD SYSOUT=*              

ONCE CLUSTER IS DEFINE THIS IS THE RESULTS BELOW:

Z38515.EMP.KSDS                                                *VSAM*
Z38515.EMP.KSDS.DATA                                           ZXPL01
Z38515.EMP.KSDS.INDEX                                          ZXPL01


IN FILE MANANGER LOOKING UP THE VSAM
 -----------------------------------------------------------------
 File Manager                 Primary Option Menu                 
                                                                  
 0  Settings      Set processing options                 User ID .
 1  View          View data                              System ID
 2  Edit          Edit data                              Appl ID .
 3  Utilities     Perform utility functions              Version .
 4  Tapes         Tape specific functions                Terminal.
 5  Disk/VSAM     Disk track and VSAM CI functions       Screen. .
 6  OAM           Work with OAM objects                  Date. . .
 7  Templates     Template and copybook utilities        Time. . .
 8  HFS           Access Hierarchical File System                 
 9  WebSphere MQ  List, view and edit MQ data                     
 10 CICS          FM/CICS                                         
 11 Remote        Remote System Definition                        
 X  Exit          Terminate File Manager                          
                                                                  
                                                                  
                                                                  
 Command ===> 1                                                   

------------------------------------------------------------------------------
File Manager                   View Entry Panel                               
                                                                              
Input Partitioned, Sequential or VSAM Data Set, or HFS file:                  
   Data set/path name 'Z38515.EMP.KSDS'                               +       
   Member . . . . . .              (Blank or pattern for member list)         
   Volume serial  . .              (If not cataloged)                         
   Start position . .                                 +                       
   Record limit . . .              Record sampling                            
                                                                              
Copybook or Template:                                                         
   Data set name  . .                                                         
   Member . . . . . .              (Blank or pattern for member list)         
Processing Options:                                                           
 Copybook/template   Start position type   Enter "/" to select option         
 3  1. Above         1  1. Key                Edit template    Type (1,2,S)   
    2. Previous         2. RBA                Include only selected records   
    3. None             3. Record number      Binary mode, reclen 80          
    4. Create dynamic   4. Formatted key                                      
Command ===>                                                                  

THIS IS THE DATA I ADDED AND WILL CHANGE EMP-ID 000003 EMP NAME
---------------------------------------------------------------------------
Edit             Z38515.EMP.KSDS                                   Top of 3
                            Type KSDS     RBA                      Format C
Key                                          Col 1       Insert Length 80  
 
<===+>---10---+----2----+----3----+----4----+----5----+----6----+---
BEFORE THE CHANGE
****** ****  Top of data  ****                                             
000001 000001 BRAXTON WELLS                                                
000002 000002 JORGE CINTRON                                                
000003 000003 RAUL ESTREAS                                                
****** ****  End of data  ****      


AFTER RUNNING THE COBOL CODE:

---------------------------------------------------------------------------
Edit             Z38515.EMP.KSDS                                   Top of 3
                            Type KSDS     RBA                      Format C
Key                                          Col 1       Insert Length 80  
       <===+>---10---+----2----+----3----+----4----+----5----+----6----+---
****** ****  Top of data  ****                                             
000001 000001 BRAXTON WELLS                                                
000002 000002 JORGE CINTRON                                                
000003 000003 TYRONE MORRIS                                                
****** ****  End of data  ****        

SDSF
OUTPUT 


 SDSF OUTPUT DISPLAY COBCOP   JOB
 COMMAND INPUT ===>              
EMP-NAME BEFORE :RAUL ESTREAS    
EMP-NAME AFTER : TYRONE MORRIS   
******************************** 



TO DELETE A RECORD JUST CHANGE THE CODE HERE 

DELETE REWRITE WITH DELETE (FILE) RECORD

003900  PROCESS-FILE.                            
004010       MOVE 000002 TO EMP-ID               
004100       READ IFILE                          
004200       KEY IS EMP-ID                       
004300       INVALID KEY                         
004400       DISPLAY "INVALID KEY"               
004500       NOT INVALID KEY                     
004600       DISPLAY "EMP NAME : " EMP-NME       
004700       END-READ.                           
004800       DELETE IFILE RECORD                 
005000       END-DELETE.                         
005100  PROCESS-EXIT.                            
005200       EXIT.                               
005300  CLOSE-FILE.                              
005400       CLOSE IFILE.                        
005500  CLOSE-EXIT.                              


                                     
ALSO TO ADD RECORDS USE WRITE 


PROCESS-FILE.                         
    MOVE 000004 TO EMP-ID             
    READ IFILE                        
    KEY IS EMP-ID                     
    INVALID KEY                       
    DISPLAY "INVALID"                 
    NOT INVALID KEY                   
    DISPLAY "EMP NAME" EMP-NAME       
    END-READ.                         
    MOVE "BOB" TO EMP-NAME            
    WRITE IFILE-RECS                  
    DISPLAY EMP-NAME.                 
                                                                           
