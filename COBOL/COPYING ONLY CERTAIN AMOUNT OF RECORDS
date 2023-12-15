***************************** Top of Data *************
000100 IDENTIFICATION DIVISION.                        
000200 PROGRAM-ID. N44.                                
000300 ENVIRONMENT DIVISION.                           
000400 INPUT-OUTPUT SECTION.                           
000500 FILE-CONTROL.                                   
000600     SELECT IFILE ASSIGN TO CUSTDDI.             
000700     SELECT OFILE ASSIGN TO CUSTDDO.             
000800 DATA DIVISION.                                  
000900 FILE SECTION.                                   
001000 FD IFILE.                                       
001100 01 IFILE-RECS.                                  
001200   05 EMP-ID   PIC 9(5).                         
001300   05 EMP-NAME PIC X(20).                        
001400   05 DOB      PIC X(10).                        
001500   05 FILLER   PIC X(45).                        
001510 FD OFILE.                                       
001520 01 OFILE-RECS.                                  
001530   05 EMP-ID   PIC 9(5).                  
001540   05 EMP-NAME PIC X(20).                 
001550   05 DOB      PIC X(10).                 
001560   05 FILLER   PIC X(45).                 
001600 WORKING-STORAGE SECTION.                 
001700 01 FLAG       PIC X(1) VALUE "N".        
001800 01 WS-B       PIC 9(2) VALUE ZEROES.     
001900 PROCEDURE DIVISION.                      
002000 000-MAIN.                                
002100     PERFORM OPEN-PARA.                   
002200     PERFORM PROCESS-PARA.                
002300     PERFORM CLOSE-PARA.                  
002400     STOP RUN.                            
002500 OPEN-PARA.                               
002600     OPEN INPUT IFILE.                    
002700     OPEN OUTPUT OFILE.                   
002900 PROCESS-PARA.                            
003000     PERFORM UNTIL FLAG = "Y"             
003100     READ IFILE                           
003200     AT END                               
003300     MOVE "Y" TO FLAG                     
003400     NOT AT END                           
           ADD 1 TO WS-B                        
003500     IF WS-B <= 10                        
003600     MOVE IFILE-RECS TO OFILE-RECS        
003610     WRITE OFILE-RECS                     
003700     ELSE                                 
003800     MOVE "Y" TO FLAG                     
003900     END-IF                               
004000     END-READ                             
004100     END-PERFORM.                         
004200 CLOSE-PARA.                              
004300     CLOSE IFILE OFILE.                   



****** ***************************** Top of Data *******************
000100 //MATEDKZ  JOB CLASS=A,                                      
000200 //             MSGCLASS=H,                                   
000300 //             MSGLEVEL=(1,1),                               
000400 //             NOTIFY=&SYSUID                                
000500 //***************ENDOFJOBCARD******************              
000510 //JOBLIB   DD DSN=MATEDK.LOAD.LIB,DISP=SHR                   
000600 //STEP01   EXEC PGM=N44                                      
000800 //SYSOUT   DD SYSOUT=*                                       
000900 //SYSPRINT DD SYSOUT=*                                       
001000 //CUSTDDI  DD DSN=MATEDK.BRAVO70,DISP=SHR                    
001100 //CUSTDDO  DD DSN=&SYSUID..BRAVO.FOUR,                       
001200 //            DISP=(NEW,CATLG,DELETE),                       
001300 //            UNIT=SYSDA,                                    
001400 //            SPACE=(TRK,(8,10),RLSE),                       
001500 //            DCB=(DSORG=PS,LRECL=80,RECFM=FB,BLKSIZE=800),  
001600 //            VOL=SER=DEVHD3                                 


IFILE = CUSTDDI COPYING ONLY THE TEN RECORDS OF THE BELOW 
****** ***************************** Top of Data *******************
000001 00001 JAMES JACKSON 1966-12-11                               
000002 00002 MARIA GARCIA 1984-12-28                                
000003 00003 ROBERT SMITH 1983-10-29                                
000004 00004 LISA JOHNSON 1976-05-26                                
000005 00005 DAVID LEE 1988-10-02                                   
000006 00006 EMILY DAVIS 1953-03-25                                 
000007 00007 MICHAEL BROWN 1993-10-31                               
000008 00008 SOPHIA WILSON 1960-07-18                               
000009 00009 WILLIAM MARTINEZ 1978-11-12                            
000010 00010 EMMA TAYLOR 1970-03-02                                 
000011 00011 JAMES JACKSON 1969-08-23                               
000012 00012 MARIA GARCIA 1951-08-21                                
****** **************************** Bottom of Data *****************

OFILE 

EDIT       MATEDK.BRAVO.FOUR                              
Command ===>                                              
****** ***************************** Top of Data *********
000001 00001 JAMES JACKSON 1966-12-11                     
000002 00002 MARIA GARCIA 1984-12-28                      
000003 00003 ROBERT SMITH 1983-10-29                      
000004 00004 LISA JOHNSON 1976-05-26                      
000005 00005 DAVID LEE 1988-10-02                         
000006 00006 EMILY DAVIS 1953-03-25                       
000007 00007 MICHAEL BROWN 1993-10-31                     
000008 00008 SOPHIA WILSON 1960-07-18                     
000009 00009 WILLIAM MARTINEZ 1978-11-12                  
000010 00010 EMMA TAYLOR 1970-03-02                       
****** **************************** Bottom of Data *******
                                                          

