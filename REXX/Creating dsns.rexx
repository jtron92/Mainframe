****** ***************************** Top of Data ***************
000100 /*REXX*/                                                 
000200 OUTFILE="ALPHA2"                                         
000300 "ALLOC F(OUTDD) DA("OUTFILE") NEW REUSE LIKE (ALPHA)"    
000400 "EXECIO * DISKW OUTDD (FINIS STEM REC."                  
000500 "FREE F(OUTDD)"                                          
000600 EXIT                                                     
****** **************************** Bottom of Data *************
                                                                
                                                                



We have a variable called OUTFILE = "alpha2"    < -- you can add whatever file you want here if its a new dsn you want to create

ALLOC F(OUTDD) DA("OUTFILE") NEW REUSE LIKE (ALPHA) < -- we are allocating this dsn ( its new and reuse it like an existing dsn ) so create it just like the dsn in question 

Execute I/O the DISK(W) writing once it reaches FINISH stem rec its done and FREE F frees it for the systems

