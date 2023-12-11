EDIT       Z38515.JCL(JCLZ) - 01.02                        Columns 00001 00072
****** ***************************** Top of Data *****************************
==MSG> -Warning- The UNDO command is not available until you change           
==MSG>           your edit profile using the command RECOVERY ON.             
000100 //LISTCAT1 JOB CLASS=A,                                                
000200 //             MSGCLASS=H,                                             
000300 //             MSGLEVEL=(1,1),                                         
000400 //             NOTIFY=&SYSUID                                          
000500 //STEP01   EXEC PGM=IDCAMS                                             
000600         REPRO INFILE (INFILE)   -                                      
000700               OUTFILE (OUTFILE)                                        
000800 /*                                                                     
000810 //INFILE   DD DSN=Z38515.SADDAY,DISP=SHR                               
000820 //OUTFILE  DD DSN=Z38515.EMP.KSDS,DISP=SHR                             
000900 //SYSPRINT DD SYSOUT=*                                                 
001000 //AMSDUMP  DD SYSOUT=*                                                 
001100 //SYSOUT   DD SYSOUT=*                                                 
****** **************************** Bottom of Data ***************************
                                                                              
COPYING DATA FROM INFILE TO OUTFILE 

CAN COPY FROM PS FILE TO VSAM OR VSAM TO PS OR VSAM TO VSAM

FOR KSDS MAKE SURE THERE ARE NO DUPS IN THE RECORDS IF THERE IS THE JOB WILL FAIL

                                                                             
  Process   View   Options   Help                                            
.............................................................................
 DITTO/ESA for MVS            Task Selection Menu                            
                                                                             
 Select the desired task or enter a DITTO function code, then press Enter.   
 Press F2 (Menu) to display the menu panel with DITTO function groups.       
                                                                             
 1      1. Browse data                                                       
        2. Edit or update data                                               
        3. Work with VTOC                                                    
        4. Work with catalog entries                                         
        5. Work with OAM objects                                             
        6. Print data                                                        
        7. Copy data                                                         
        8. Locate data                                                       
        9. Change data                                                       
       10. Create data                                                       
       11. Position a tape                                                   
       12. Tape specific functions                                           
       13. Set processing options                                            
                                                                             


  Process   View   Options   Help                                           
............................................................................
 DITTO/ESA for MVS            Task Selection Menu                           
                                                                            
 Select the desired task or enter a DITTO function code, then press Enter.  
 Press F2 (Menu) to display the menu panel with DITTO function groups.      
                                                                            
 1      1. .......... Browse Functions ...........                          
        2. :                                     :                          
        3. : Select the type of data to browse:  :                          
        4. :                                     :                          
        5. : 3     1. Tape data                  :                          
        6. :       2. Physical disk data         :                          
        7. :       3. VSAM data                  :                          
        8. :       4. OAM object                 :                          
        9. :                                     :                          
       10. :       5. DITTO printout             :                          
       11. :       6. AFP data                   :                          
       12. :                                     :                          
       13. :       7. User storage               :                          
           :                                     :                          
           : F1=Help  F3=Exit  F12=Cancel        :                          
 Command = :.....................................:                          

........................................................................
 DITTO/ESA for MVS              VB - VSAM Browse                        
                                                                        
 .. Input ..............................................................
 :      Data set name 'Z38515.EMP.KSDS'                                 
 :          CI access NO           NO or YES                            
 :......................................................................
                                                                        
                                                                        
  ..........................................................................
 DITTO/ESA for MVS              VB - VSAM Browse                          
                                                                          
 CATALOG                                                                  
 RBA 0            Key 000001                           Col 1        Format
 VOLSER ZXPL01   Type KSDS   DSNAME Z38515.EMP.KSDS                       
                                                                          
 RBA        Len     <===5>..10....5...20....5...30....5...40....5...50....
 0            80    000001CHARLES                 ........................
 80           80    000002 FREDDY                                         
 160          80    000003 BRAXTOM                                        
 ****  End of data  ****                                                  
                                                                          
                                                                          
                                                                          
                                                                          
                                                                          
                                                                                                                                                
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
