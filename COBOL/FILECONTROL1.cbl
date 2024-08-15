***************************** Top of Data ****************************
000100 IDENTIFICATION DIVISION.                            
000200 PROGRAM-ID. IFILE1.                                 
000300 ENVIRONMENT DIVISION.                               
000400 INPUT-OUTPUT SECTION.                               
000500 FILE-CONTROL.                                       
000600     SELECT IFILE ASSIGN TO CUSTDDI                  
000700     ORGANIZATION IS SEQUENTIAL                      
000800     FILE STATUS  IS FLAG1.                          
000900     SELECT OFILE ASSIGN TO CUSTDDO                  
001000     ORGANIZATION IS SEQUENTIAL                      
001100     FILE STATUS  IS FLAG2.                          
001200 DATA DIVISION.                                      
001300 FILE SECTION.                                       
001400 FD IFILE.                                           
001500 01 IFILE-RECS.                                      
001600   05 STORE-ID     PIC 9(5).                         
001700   05 FILLER       PIC X(1).                         
001800   05 ITEM-ID      PIC X(10).             
001900   05 FILLER       PIC X(64).             
002000 FD OFILE.                                
002100 01 OFILE-RECS.                           
002200   05 STORE-ID-O   PIC 9(5).              
002300   05 FILLER       PIC X(1).              
002400   05 ITEM-ID-O    PIC X(10).             
002500   05 FILLER       PIC X(64).             
002600 WORKING-STORAGE SECTION.                 
002700 01 FLAG1          PIC X(2).              
002800   88 FILE-STATUS1 VALUE "00".            
002900   88 FILE-EOF1    VALUE "10".            
003000 01 FLAG2          PIC X(2).              
003100   88 FILE-STATUS2 VALUE "00".            
003200   88 FILE-EOF2    VALUE "10".            
003300 01 COUNTERS.                             
003400   05 READ-COUNT   PIC 9(2).              
003500   05 WRITE-COUNT  PIC 9(2).              
003600 PROCEDURE DIVISION.                            
003700 000-MAIN-PROCEDURE.                            
003800      PERFORM OPEN-FILE THRU OPEN-CLOSE.        
003900      PERFORM PROCESS-FILE THRU PROCESS-CLOSE.  
004000      PERFORM CLOSE-FILE THRU CLOSE-EXIT.       
004100      STOP RUN.                                 
004200 OPEN-FILE.                                     
004300      OPEN INPUT IFILE.                         
004400      IF FILE-STATUS1                           
004500         CONTINUE                               
004600      ELSE                                      
004700         DISPLAY "FAILURE TO OPEN" FLAG1        
004800      GO TO EXIT-PARA                           
004900      END-IF.                                   
005000      OPEN OUTPUT OFILE.                        
005100      IF  FILE-STATUS2                          
005200         CONTINUE                               
005300      ELSE                                                             
005400      DISPLAY "FAILURE TO OPEN" FLAG2     
005500      GO TO EXIT-PARA                        
005600      END-IF.                                
005700 OPEN-CLOSE.                                 
005800      EXIT.                                  
005900 PROCESS-FILE.                               
006000      PERFORM UNTIL FILE-EOF1                
005100      IF  FILE-STATUS2                      
005200         CONTINUE                           
005300      ELSE                                  
005400         DISPLAY "FAILURE TO OPEN" FLAG2    
005500      GO TO EXIT-PARA                       
005600      END-IF.                               
005700 PROCESS-CLOSE.                                
005800      EXIT.                                 
005900 PROCESS-FILE.                              
006000      PERFORM UNTIL FILE-EOF1               
006100      READ IFILE                            
006200         AT END                             
006300      IF READ-COUNT < 1                     
006400         DISPLAY "NO RECORDS FOUND"         
006500      END-IF                                
006600      NOT AT END                            
006700      PERFORM WRITE-FILE THRU WRITE-CLOSE   
006800      END-READ                              
006900      END-PERFORM.                  
007000 PROCESS-CLOSE.                     
007100      EXIT.                         
007200 WRITE-FILE.                        
007300      ADD 1 TO READ-COUNT.          
007400      IF STORE-ID > 12345           
007500      MOVE STORE-ID TO STORE-ID-O   
007600      MOVE ITEM-ID  TO ITEM-ID-O    
007700      WRITE OFILE-RECS              
007800      END-IF.                       
007900 WRITE-CLOSE.                       
008000      EXIT.                         
008100 CLOSE-FILE.                        
008200      CLOSE IFILE OFILE.            
008300 CLOSE-EXIT.                        
008400      EXIT.                         
008500 EXIT-PARA.                         
008600      EXIT PROGRAM.                 
****** **************************** Bottom of Data ****************************

FOR THIS PROGRAM I HAVE IFILE ASSIGN TO CUSTDDI 

IFILE IS THE INPUT FILE .. CUSTDDI WILL BE USED IN THE JCL WHEN RUNNING THE CODE AFTER BEING COMPLIED WILL SHOW LATER IN JCL TO MAKE BETTER SENSE

FILE STATUS IS FLAG1 .. THIS IS THE FILE STATUS WHEN THE FILE IS OPEN WHICH I AM LOOKING FOR A 00 WHICH IS GOOD 

FLAG1 TABLE HAS FILE-STATUS1 AND FILE-EOF1         IF FILE-STATUS1 = 00 <--- THIS IS A GOOD SIGN   ,, WHEN OPENING AND CLOSEING A INPUT OR OUTPUT FILE THE END OF FILE (EOF) -

"10" MEANS FILE CLOSED SUCCESSFULLY

OFILE IS THE OUTPUT FILE SAME RULES APPLIES LIKE FROM IFILE JUST HAVE TO TWEAK SOME PARMS

IN FILE SECTION

FILE DESCRPTION NEEDS TO BE ADDED IFILE AND OFILE

FD FILE
FD OFILE

01 IFILE-RECS AND OFILE-RECS HAVE STORE-ID - TO ITEM-ID ALSO FILLERS AS WELL WHICH THE PIC CLAUSES EQUALS 80 IF NOT IT WILL CAUSE SOC4 BAD DATA

GOING BACK TO CUSTDDI WHICH IS A DSN BELOW :

-------------------------------
EDIT       MATEDK.BRAVO59      
Command ===>                   
****** ************************
000001 12345 STORE01           
000002 12346 STORE10           
000003 12456 STORE20           
000004 24356 STORE22           
****** ************************

THIS DATASET IS EXISTED AND HAS THE STORE-ID 12345 AND ITEM-ID STORE01

THIS PROGRAM PURPOSES IS TO READ THE IFILE TO BEGIN TO END AND IF STORE-ID > 12345 MOVE VALUES TO THE OUTPUT DATASET CUSTDDO AND SHOULD PRINT OUT TO A NEW DATASET LATER AFTER 

COBOL SOURCE CODE IS COMPLIED AND RAN

IN PROCEDURE DIVISION IT IS SET TO PERFORM 3 PARAGRAPHS


            PERFORM  OPEN-FILE THRU OPEN-CLOSE.        
003900      PERFORM PROCESS-FILE THRU PROCESS-CLOSE.  
004000      PERFORM CLOSE-FILE THRU CLOSE-EXIT.  

NOW WE OPEN THE FILE WHICH IS AN INPUT FILE

NOW SEEING IF THE CONDITION IS TRUE FOR FILE-STATUS1 

SO IF THE FILE WHEN OPEN IS 00 CONTINUE AND DISREGARD THE REST OF THE IF AND ELSE STATEMENT

IF THE FILE STATUS EQUALS ANYTHING ELSE BUT 00 THIS MEANS THAT IT HAS FAILED TO OPEN

IF IT FAILS GO TO A PARAGRAPH CALLED EXIT-PARA WHICH LEADS TO THE END OF THE PROGRAM

SAME THING FOR THE OFILE WHICH IS THE OUTPUT FILE ^^ 

IF THE OUTPUT FILE WHEN OPENED IS SUCCSSFUL =  00 THEN CONTINUE IF NOT THEN GO TO EXIT-PARA AS WELL..

IN PROCESS-FILE PARAGRAPH

IT IS SET TO PERFORM UNTIL THE END OF FILE 

THEN READ THE INPUT FILE 

NOW AT THE END OF THE FILE WHEN READ

 IF THE READ COUNTS ARE LESS THAN 1 

THIS MEANS THERE IS NO RECORDS FOUND IN THE FILE 

IF THIS IS TRUE GO TO EXIT-PARA

NOW IF NOT AT THE END OF FILE IF READ-COUNTS ARE NOT LESS THAN 1 

PERFORM A NEW PARAGRAPH

FOR THE WRITE-FILE PARAGRAPH

IF STORE ID IS GREATER THAN THE NUMBERS IN QUESTION IF THIS IS THE CASE

MOVE INPUT VALUES STORE ID AND ITEM ID TO OUTPUT VALUES 

THEN WRITE THESE VALUES TO THE OUTPUT FILE 

EXIT THE PARAGRAPH THEN EXIT THE PROGRAM

COMPLING COBOL JCL , MANY WAYS TO COMPLIE THIS IS A SIMPLE WAY

****** ***************************** Top of Data ***************
000100 //MATEDK9 JOB CLASS=A,                                   
000200 //            MSGLEVEL=(1,1),                            
000300 //            MSGCLASS=H,                                
000400 //            NOTIFY=&SYSUID                             
000500 //***********ENDOFJOBCARD                                
000600 //STEP01  EXEC COBOLCL,                                  
000700 //             LOADLIB=MATEDK.LOAD.LIB,                  
000800 //             SRCLIB=MATEDK.SOURCE.CODE,                
000900 //             MEMBER=IFILE                              
****** **************************** Bottom of Data *************

THEN TO RUN THE PGM 

000500 //************************                                         
000510 //* RUN A COBOL PROGRAM                                            
000520 //*                                                                
000530 //************************                                         
000600 //STEP01  EXEC PGM=IFILE                                           
000700 //STEPLIB DD DSN=MATEDK.LOAD.LIB,DISP=SHR                          
000800 //SYSOUT  DD SYSOUT=*                                              
000900 //SYSPRINT DD SYSOUT=*                                             
001000 //CUSTDDI  DD DSN=MATEDK.BRAVO59,DISP=SHR                          
001100 //CUSTDDO  DD DSN=&SYSUID..DEC02,                                  
001200 //            DISP=(NEW,CATLG,DELETE),                             
001210 //            SPACE=(TRK,(8,10),RLSE),                             
001300 //            UNIT=SYSDA,                                          
001400 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),        
001500 //            VOL=SER=DEVHD3                                       
****** **************************** Bottom of Data ***********************

CUSTDDO FILE 
000001 12346 STORE10                                       
000002 12456 STORE20                                       
000003 24356 STORE22                                       
****** **************************** Bottom of Data ********

