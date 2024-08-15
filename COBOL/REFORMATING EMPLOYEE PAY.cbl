***************************** Top of Data ******************
000100 IDENTIFICATION DIVISION.                             
000200 PROGRAM-ID. COBTRAN3.                                
000300 ENVIRONMENT DIVISION.                                
000400 INPUT-OUTPUT SECTION.                                
000500 FILE-CONTROL.                                        
000600     SELECT EMPLOYEE-IN-FILE ASSIGN TO EMPIFILE.      
000700     SELECT EMPLOYEE-OUT-FILE ASSIGN TO EMPOFILE.     
000800 DATA DIVISION.                                       
000900 FILE SECTION.                                        
001000 FD EMPLOYEE-IN-FILE                                  
001100      RECORDING MODE IS F                             
001200      LABEL RECORDS ARE STANDARD                      
001300      RECORD CONTAINS 80 CHARACTERS                   
001400      BLOCK CONTAINS 0 RECORDS                        
001500      DATA RECORD IS EMPLOYEE-RECORD-IN.              
001600 01 EMPLOYEE-RECORD-IN.                               
001700    05 E-ID          PIC X(04).                          
001800    05 FILLER        PIC X(76).                          
001900 FD EMPLOYEE-OUT-FILE                                    
001910       RECORDING MODE IS F                               
001920       LABEL RECORDS ARE STANDARD                        
001930       RECORD CONTAINS 80 CHARACTERS                     
001940       BLOCK CONTAINS 0 RECORDS                          
001950       DATA RECORD IS EMPLOYEE-RECORD-OUT.               
002000 01 EMPLOYEE-RECORD-OUT.                                 
002100    05 EMP-DATA      PIC X(80).                          
002200 WORKING-STORAGE SECTION.                                
002300 01 WS-FLAGS.                                            
002400    05 SW-END-OF-FILE-SWITCH     PIC X(1) VALUE "N".     
002500    88 SW-END-OF-FILE                    VALUE "Y".      
002600    88 SW-NOT-END-OF-FILE                VALUE "N".      
002700 01 IN-EMPLOYEE-RECORD.                                  
002800    05 EMP-ID-IN     PIC X(04).                          
002900    05 FILLER        PIC X(05).                      
003000    05 REG-PAY-IN    PIC 99999V99.                   
003100    05 FILLER        PIC X(02).                      
003200    05 BON-PAY-IN    PIC 9999V99.                    
003300    05 FILLER        PIC X(54).                      
003400 01 OUT-EMPLOYEE-RECORD.                             
003500    05 EMP-ID-OUT    PIC S9(9) USAGE COMP.           
003600    05 FILLER        PIC X(05).                      
003700    05 REG-PAY-OUT   PIC S9(6)V9(2) USAGE COMP-3.    
003800    05 FILLER        PIC X(02).                      
003900    05 BON-PAY-OUT   PIC S9(6)V9(2) USAGE COMP-3.    
004000    05 FILLER        PIC X(59) VALUE SPACES.         
004100 01 DISPLAY-EMPLOYEE-PIC.                            
004200    05 DIS-REG-PAY   PIC 99999.99.                   
004300    05 DIS-BON-PAY   PIC 9999.99.                    
004400 PROCEDURE DIVISION.                                 
004500     PERFORM P100-INITIALIZATION.                    
004600     PERFORM P200-MAINLINE.                                   
004700     PERFORM P300-TERMINATION.                                
004800     GOBACK.                                                  
004900 P100-INITIALIZATION.                                         
005000     DISPLAY "COBTRAN3 - COBOL PROGRAM: INPUT/OUTPUT".        
005100     OPEN INPUT EMPLOYEE-IN-FILE.                             
005200     OPEN OUTPUT EMPLOYEE-OUT-FILE.                           
005300     INITIALIZE IN-EMPLOYEE-RECORD, OUT-EMPLOYEE-RECORD.      
005400 P200-MAINLINE.                                               
005500*    MAIN LOOP - READ THE INPUT FILE, LOAD THE OUTPUT         
005600* STRUCTURE AND WRITE THE RECORD TO OUTPUT                    
005700     READ EMPLOYEE-IN-FILE INTO IN-EMPLOYEE-RECORD            
005800        AT END                                                
                SET SW-END-OF-FILE TO TRUE                          
005900     END-READ                                                 
006000     PERFORM UNTIL SW-END-OF-FILE                             
006100*    MOVE FIELDS                                              
006200     MOVE EMP-ID-IN TO EMP-ID-OUT                                 
006300     MOVE REG-PAY-IN TO REG-PAY-OUT  DIS-REG-PAY                  
006400     MOVE BON-PAY-IN TO BON-PAY-OUT  DIS-BON-PAY                  
006500     DISPLAY " EMP ID: " EMP-ID-OUT                               
006600     DISPLAY " REG PAY: " DIS-REG-PAY                             
006700     DISPLAY " BONUS PAY: " DIS-BON-PAY                           
006800     WRITE EMPLOYEE-RECORD-OUT FROM OUT-EMPLOYEE-RECORD           
006900     READ EMPLOYEE-IN-FILE INTO IN-EMPLOYEE-RECORD                
007000         AT END                                                   
                    SET SW-END-OF-FILE TO TRUE                          
007100     END-READ                                                     
007200     END-PERFORM.                                                 
007300 P300-TERMINATION.                                                
007400     CLOSE EMPLOYEE-IN-FILE,                                      
007500           EMPLOYEE-OUT-FILE.                                     
007600     DISPLAY "COBTRAN3 - SUCCESSFULLY ENDED".                     
**************************** Bottom of Data ****************************



COBTRAN3 - COBOL PROGRAM: INPUT/OUTPUT           
 EMP ID: 000001111                               
 REG PAY: 87000.00                               
 BONUS PAY: 6700.00                              
 EMP ID: 000001222                               
 REG PAY: 82000.00                               
 BONUS PAY: 6000.00                              
 EMP ID: 000003217                               
 REG PAY: 65000.00                               
 BONUS PAY: 5500.00                              
 EMP ID: 000004175                               
 REG PAY: 55000.00                               
 BONUS PAY: 1500.00                              
 EMP ID: 000004720              
 REG PAY: 80000.00              
 BONUS PAY: 2500.00             
 EMP ID: 000004836              
 REG PAY: 62000.00              
 BONUS PAY: 2200.00             
 EMP ID: 000006288              
 REG PAY: 70000.00              
 BONUS PAY: 2000.00             
 EMP ID: 000007459              
 REG PAY: 85000.00              
 BONUS PAY: 4500.00             
 EMP ID: 000009134              
 REG PAY: 75000.00              
 BONUS PAY: 2500.00             
COBTRAN3 - SUCCESSFULLY ENDED   
********************************




EDIT       MATEDK.EMIN8                    
Command ===>                               
=COLS> ----+----1----+----2----+----3----+-
****** ***************************** Top of
000100 1111     8700000  670000            
000200 1222     8200000  600000            
000300 3217     6500000  550000            
000400 4175     5500000  150000            
000500 4720     8000000  250000            
000600 4836     6200000  220000            
000700 6288     7000000  200000            
000800 7459     8500000  450000            
000900 9134     7500000  250000            
****** **************************** Bottom 
                                           










EDIT       MATEDK.BRAVO.TEST1                              Columns 00001 000
Command ===>                                                  Scroll ===> CS
****** ***************************** Top of Data ***************************
=PROF> ....TEST1 (FIXED - 80)....RECOVERY OFF WARN....NUMBER OFF............
=PROF> ....CAPS OFF....HEX OFF....NULLS ON STD....TABS OFF..................
=PROF> ....AUTOSAVE ON....AUTONUM OFF....AUTOLIST OFF....STATS OFF..........
=PROF> ....PROFILE UNLOCK....IMACRO NONE....PACK OFF....NOTE ON.............
=PROF> ....HILITE OFF CURSOR FIND...........................................
000001    ï      g       ø                                                  
000002    F      b                                                          
000003    j      Á       &                                                  
000004    |      í       &                                                  
000005    ø      Ø       &                                                  
000006    U      Â                                                          
000007    °      ø                                                          
000008           e       &                                                  
000009    Þ      Í       &                                                  
****** **************************** Bottom of Data *************************
HEX ON
-------------------------------------------------------------------------------
EDIT       MATEDK.BRAVO.TEST1                              Columns 00001 00072 
Command ===>                                                  Scroll ===> CSR  
****** ***************************** Top of Data ******************************
000001    ï      g       ø                                                     
       000500000080000000700444444444444444444444444444444444444444444444444444
       0047000000700C000600C000000000000000000000000000000000000000000000000000
------------------------------------------------------------------------------ 
000002    F      b                                                             
       000C00000080000000000444444444444444444444444444444444444444444444444444
       0046000000200C000600C000000000000000000000000000000000000000000000000000
------------------------------------------------------------------------------ 
000003    j      Á       &                                                     
       000900000060000000500444444444444444444444444444444444444444444444444444
       00C1000000500C000500C000000000000000000000000000000000000000000000000000
------------------------------------------------------------------------------ 
000004    |      í       &                                                     
       001400000050000000500444444444444444444444444444444444444444444444444444
       000F000000500C000100C000000000000000000000000000000000000000000000000000
------------------------------------------------------------------------------ 
 F1=Help      F2=Split     F3=Exit      F5=Rfind     F6=Rchange   F7=Up        
 F8=Down      F9=Swap     F10=Left     F11=Right    F12=Cancel                 
