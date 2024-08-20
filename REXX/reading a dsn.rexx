Command ===>                                                  Scroll ===
****** ***************************** Top of Data ***********************
000100 /*REXX*/                                                         
000200 INPUT="CHASE"                                                    
000201 /* USING DIRECTLY THE DATASET NAME */                            
000210 "ALLOC F (INDD) DA("INPUT") SHR REUSE"                           
000300 /* "ALLOC F (INDD) DA(CHASE) SHR REUSE"      */                  
000310 /* USING A VARIABLE TO SPECIFY ORU DATASET NAME */               
000400 "EXECIO * DISKR INDD (FINIS STEM REC."                           
000500 "FREE F(INDD)"                                                   
000600 DO I = 1 TO REC.0                                                
000700 SAY I "-" SUBSTR(REC.I,1,32)                                     
000800 END                                                              
000900 EXIT                                                             
****** **************************** Bottom of Data *********************

This reads a dsn in question all you gotta do is add the dsn into the input=""
then it will read the records in the data set for you on the screen and numbering how many 1-32 , you can change to whatever
