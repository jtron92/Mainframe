
000100 IDENTIFICATION DIVISION.                               
000200 PROGRAM-ID. FOUR.                                      
000300 ENVIRONMENT  DIVISION.                                 
000400 INPUT-OUTPUT SECTION.                                  
000500 FILE-CONTROL.                                          
000600     SELECT IFILE ASSIGN TO CUSTDDI                     
000700     ORGANIZATION IS INDEXED                            
000800     ACCESS MODE IS SEQUENTIAL                          
000900     RECORD KEY IS EMP-ID                               
001000     FILE STATUS IS FLAG.                               
001100 DATA DIVISION.                                         
001200 FILE SECTION.                                          
001300 FD IFILE.                                              
001400 01 IFILE-RECS.                                         
001500   05 EMP-ID   PIC 9(4).                                
001600   05 EMP-LAST-NAME PIC X(30).                    
001700   05 EMP-FIRST-NAME PIC X(20).                   
001800   05 EMP-SERVICE-DATE PIC X(10).                 
001900   05 EMP-NUMBER       PIC 9(2).                  
002000   05 FILLER           PIC X(14).                 
002100 WORKING-STORAGE SECTION.                         
002200 01 FLAG.                                         
002300   05 EMPIFILE1 PIC X.                            
002400   05 EMPIFILE2 PIC X.                            
002500 01 SWITCH.                                       
         05 SW-SWITCH PIC X(1) VALUE "N".               
           88 EOF     VALUE "Y".                        
           88 NOT-EOF VALUE "N".                        
002600 PROCEDURE DIVISION.                              
002700 0000-MAIN.                                       
002800     PERFORM P100.                                
002900     PERFORM P200.                                
003000     PERFORM P300.                                 
003100     STOP RUN.                                             
003200 P100.                                                     
003300     OPEN INPUT IFILE.                                     
003400     INITIALIZE IFILE-RECS.                                
003600 P200.                                                     
           READ IFILE                                            
           IF FLAG = "10" THEN                                   
           DISPLAY "END OF FILE" FLAG                            
           SET EOF TO TRUE                                       
           END-IF.                                               
           IF NOT EOF THEN                                       
           PERFORM UNTIL EOF                                     
           DISPLAY "EMP ID : " EMP-ID                            
           DISPLAY "EMP LAST NAME : " EMP-LAST-NAME              
           DISPLAY "EMP FIRST NAME : " EMP-FIRST-NAME            
           DISPLAY "EMP YEARS OF SERVICE : " EMP-SERVICE-DATE    
           DISPLAY "EMP PROMOTION YEARS  : " EMP-NUMBER          
           READ IFILE                                            
            IF FLAG = "10" THEN                                          
            SET EOF TO TRUE                                              
            DISPLAY "END OF FILE" FLAG                                   
            END-IF                                                       
            END-PERFORM                                                  
            ELSE                                                         
            DISPLAY "NO RECORDS AT THE TIME"                             
            END-IF.                                                      
 004300 P300.                                                            
 004400     CLOSE IFILE.                                                 
 **************************** Bottom of Data ****************************


FILE MANAGER : 
-------------------------------------------------------------------------
View             Z38515.EMPLOYEE                                   Top of
                            Type KSDS     RBA                      Format
Key                                          Col 1       Insert Length 80
       <==>+----10---+----2----+----3----+----4----+----5----+----6----+-
****** ****  Top of data  ****                                           
000001 1111CINTRON                       JORGE               032018-05-01
000002 1122JENKINS                       DEBORAH             052016-09-01
000003 1992MCGEE                         JAMES               102020-12-01
000004 2021WAYNE                         BRUCE               2023-01-0123
000005 2222LASHELY                       BILLY               2022-02-2800
000006 4720SCHULTZ                       TIM                 092017-01-01
000007 6288WILLARD                       JOE                 062016-01-01
000008 7459STEWART                       BETTY               072016-07-31
000009 9134FRANKLIN                      BRIANNA             032016-10-01
****** ****  End of data  ****                                           
                                                                         
                                                                         


SDSF OUTPUT : 

 -------------------------------------------------------------------------------
 SDSF OUTPUT DISPLAY COBRUN   JOB02090  DSID     4 LINE 19      COLUMNS 02- 81  
 COMMAND INPUT ===>                                            SCROLL ===> CSR  
             VIRT- ALLOC:      15M SHRD:       0M                               
IEF375I  JOB/COBRUN  /START 2024002.0823                                        
IEF033I  JOB/COBRUN  /STOP  2024002.0824                                        
        CPU:     0 HR  00 MIN  00.01 SEC    SRB:     0 HR  00 MIN  00.00 SEC    
                                                                  

EMP ID : 1111                                
EMP LAST NAME : CINTRON                      
EMP FIRST NAME : JORGE                       
EMP YEARS OF SERVICE : 032018-05-            
EMP PROMOTION YEARS  : 01                    
EMP ID : 1122                                
EMP LAST NAME : JENKINS                      
EMP FIRST NAME : DEBORAH                     
EMP YEARS OF SERVICE : 052016-09-            
EMP PROMOTION YEARS  : 01                    
EMP ID : 1992                                
EMP LAST NAME : MCGEE                        
EMP FIRST NAME : JAMES                       
EMP YEARS OF SERVICE : 102020-12-                
EMP PROMOTION YEARS  : 01                        
EMP ID : 2021                                    
EMP LAST NAME : WAYNE                            
EMP FIRST NAME : BRUCE                           
EMP YEARS OF SERVICE : 2023-01-01                
EMP PROMOTION YEARS  : 23                        
EMP ID : 2222                                    
EMP LAST NAME : LASHELY                          
EMP FIRST NAME : BILLY                           
EMP YEARS OF SERVICE : 2022-02-28                
EMP PROMOTION YEARS  : 00                        
EMP ID : 4720                                    
EMP LAST NAME : SCHULTZ                          
EMP FIRST NAME : TIM                             
EMP YEARS OF SERVICE : 092017-01-                
EMP PROMOTION YEARS  : 01                        
EMP ID : 6288                                                                   
EMP LAST NAME : WILLARD                                                         
EMP FIRST NAME : JOE                                                            
EMP YEARS OF SERVICE : 062016-01-                                               
EMP PROMOTION YEARS  : 01                                                       
EMP ID : 7459                                                                   
EMP LAST NAME : STEWART                                                         
EMP FIRST NAME : BETTY                                                          
EMP YEARS OF SERVICE : 072016-07-                                               
EMP PROMOTION YEARS  : 31                                                       
EMP ID : 9134                                                                   
EMP LAST NAME : FRANKLIN                                                        
EMP FIRST NAME : BRIANNA                                                        
EMP YEARS OF SERVICE : 032016-10-                                               
EMP PROMOTION YEARS  : 01                                                       
END OF FILE10                                                                   
******************************** BOTTOM OF DATA ********************************

