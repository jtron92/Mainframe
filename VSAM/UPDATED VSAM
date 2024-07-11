//Z38515AA JOB CLASS=A,MSGLEVEL=(1,1),MSGCLASS=H,NOTIFY=&SYSUID      
//STEP01   EXEC PGM=IDCAMS                                           
//SYSIN    DD *                                                      
  DEFINE CLUSTER(NAME(Z38515.CHAPT)-                                 
  INDEXED -                                                          
  KEYS(6 0) -                                                        
  RECORDSIZE(80 80) -                                                
  CYLINDERS(5 2) -                                                   
  FREESPACE(10 10))-                                                 
  INDEX(NAME(Z38515.CHAPT.INDEX))-                                   
  DATA(NAME(Z38515.CHAPT.DATA))                                      
/*                                                                   
//SYSPRINT DD SYSOUT=*                                               
//SYSOUT   DD SYSOUT=*                                               
//AMSDUMP  DD SYSOUT=*                                               



AND TO DELETE IT 

//SYSIN    DD *                                                      
  DELETE (Z38515.CHAPT) CLUSTER                                  
/*                                


  DELETE (Z38515.CHAPT) CLUSTER                            
IDC0550I ENTRY (D) Z38515.CHAPT.DATA DELETED               
IDC0550I ENTRY (I) Z38515.CHAPT.INDEX DELETED              
IDC0550I ENTRY (C) Z38515.CHAPT DELETED                    
IDC0001I FUNCTION COMPLETED, HIGHEST CONDITION CODE WAS 0  


