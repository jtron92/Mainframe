****** ***************************** Top of Data ******************
000100 000100 IDENTIFICATION DIVISION.                             
000200 000200 PROGRAM-ID. NUM.                                     
000300 000300 ENVIRONMENT DIVISION.                                
000400 000400 INPUT-OUTPUT SECTION.                                
000500 000500 FILE-CONTROL.                                        
000600 000600 DATA DIVISION.                                       
000700 000700 WORKING-STORAGE SECTION.                             
000800 000800 01 MONTH        PIC X(03).                           
000810 000810 01 DOB.                                              
000811          05 DAY1       PIC 9(2).                            
000812          05 MONTH1     PIC 9(2).                            
000813          05 YEAR1      PIC 9(4).                            
000820        01 WS-DAYS      PIC 9(2).                            
000900 000900 PROCEDURE DIVISION.                                  
000901        000-MAIN-PROCEDURE.                                  
000910 000910     ACCEPT DOB.                                      
001000 001000     EVALUATE DOB                                     
001100 001100     WHEN 1 MOVE "JAN" TO MONTH               
001200 001200     WHEN 2 MOVE "FEB" TO MONTH               
001300 001300     WHEN 3 MOVE "MAR" TO MONTH               
001310 001300     WHEN 4 MOVE "APR" TO MONTH               
001320 001300     WHEN 5 MOVE "MAY" TO MONTH               
001330 001300     WHEN 6 MOVE "JUN" TO MONTH               
001340 001300     WHEN 7 MOVE "JUL" TO MONTH               
001350 001300     WHEN 8 MOVE "AUG" TO MONTH               
001360 001300     WHEN 9 MOVE "SEP" TO MONTH               
001370 001300     WHEN 10 MOVE "OCT" TO MONTH              
001380 001300     WHEN 11 MOVE "NOV" TO MONTH              
001390 001300     WHEN 12 MOVE "DEC" TO MONTH              
001400 00I400     END-EVALUATE.                            
001410            IF MONTH1 = 2                            
001411              MOVE 28 TO WS-DAYS                     
001420            ELSE IF MONTH1  = 4 OR 6 OR 9 OR 11      
001430              MOVE 30 TO WS-DAYS                     
001440            ELSE                                     
001441              MOVE 31 TO WS-DAYS                                         
001450            END-IF.                                                      
001500 001500     DISPLAY MONTH " HAS " WS-DAYS " DAYS" YEAR1.                 
001600            STOP RUN.                                                    
****** **************************** Bottom of Data ****************************




Command ===>                                                  Scr
****** ***************************** Top of Data ****************
000100 //MATEDKZ  JOB CLASS=A,                                   
000200 //             MSGCLASS=H,                                
000300 //             MSGLEVEL=(1,1),                            
000400 //             NOTIFY=&SYSUID                             
000500 //***************ENDOFJOBCARD******************           
000510 //JOBLIB   DD DSN=MATEDK.LOAD.LIB,DISP=SHR                
000600 //STEP01   EXEC PGM=NUM                                   
000800 //SYSOUT   DD SYSOUT=*                                    
000900 //SYSPRINT DD SYSOUT=*                                    
001210 //SYSIN    DD *                                           
001220 11     <------ JUST ADD THE NUMBER OF MONTH WHEN BORN AND THE OUTPUT WILL SHOW BELOW                                           
001230 /*                                                        
****** **************************** Bottom of Data **************
                                                                 

  SDSF OUTPUT DISPLAY MATEDKZ  JOB03879  DSID   102 LINE
  COMMAND INPUT ===>                                    
 NOV HAS 31 DAYS                                        
 ******************************** BOTTOM OF DATA *******
