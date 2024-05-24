000100 /*REXX*/                                            
000200 SAY;SAY;SAY;                                        
000300 SAY "RUNNING ANOTHER REXX WITH OUTTRAP."            
000400 Z = OUTTRAP("DBZ.")                                 
000500 LISTDS BIGBOOK                                      
000600 Z = OUTTRAP("OFF")                                  
000700 SAY "NUMBER OF LINES:" DBZ.0                        
000800 DO I=1 TO DBZ.0                                     
000900 SAY "THIS IS THE OUTPUT:" DBZ.I                     
001000 END                                                 
001100 EXIT                                                
****** **************************** Bottom of Data ********

000100: /*REXX*/

Indicates the start of a REXX program.
000200: SAY;SAY;SAY;

Prints three blank lines to the terminal for better readability.
000300: SAY "RUNNING ANOTHER REXX WITH OUTTRAP."

Prints a message indicating that another REXX script is running and will use OUTTRAP.
000400: Z = OUTTRAP("DBZ.")

Starts trapping output and directs it to the stem variable DBZ.. The function returns the previous setting of OUTTRAP, which is stored in Z (though it’s not used here).
000500: LISTDS BIGBOOK

Executes the LISTDS command for the dataset BIGBOOK. The output of this command will be trapped and stored in DBZ..
000600: Z = OUTTRAP("OFF")

Stops trapping output. Any subsequent output will be displayed normally. The function returns the previous setting of OUTTRAP, which is stored in Z (though it’s not used here).
000700: SAY "NUMBER OF LINES:" DBZ.0

Prints the number of lines of output captured, which is stored in DBZ.0.
000800-001000:

A loop that iterates from 1 to DBZ.0 (the number of captured lines).
000900: SAY "THIS IS THE OUTPUT:" DBZ.I
Prints each line of the captured output. DBZ.I contains the output line at index I.
001100: EXIT

Ends the REXX script.

