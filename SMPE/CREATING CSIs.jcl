Going to mod the jcl below: 

Change &HLQ& to &SYSUID..SMP
Change &VOLUME& to VPWRKA
Change &UNIT& to 3390

in the DEFZONES step, change all the cluster space allocations from Cylinders (CYL) to Tracks
(TRACKS) and set to 2 primary, 1 secondary

in the section marked Allocate SMP/E operational data sets: (the ALLOCDS step), change the
space settings for all the other SMP operational data sets from CYL/CYLINDERS to TRK/TRACKS
with 1 primary, 1 secondary.

for sequential datasets – SPACE=(TRK,(1,1))
for datasets with DSORG=PS, set the directory space to 1 – SPACE=(TRK,(1,1,1))

EDIT       Z38515.JCL(GIMSAMPU) - 01.00                    Columns 00001 000
Command ===>                                                  Scroll ===> CS
****** ***************************** Top of Data ***************************
000001 //GIMSAMPU JOB 1,REGION=0M,NOTIFY=&SYSUID                            
000002 //*                                                                  
000003 //* Allocate and prime SMP/E CSI and operational data sets.          
000004 //*                                                                  
000005 //*                                                                  
000006 //* This JCL sample can be used to allocate SMP/E CSI data sets, as  
000007 //* well as other SMP/E operational data sets.  This sample can also 
000008 //* be used to prime the CSI data sets with basic SMP/E zone         
000009 //* definitions, OPTIONS entries, and DDDEF entries.                 
000010 //*                                                                  
000011 //* The space values for all data sets are approximate and may need  
000012 //* to be adjusted based on your specific needs.                     
000013 //*                                                                  
000014 //* CAUTION: This is neither a JCL procedure nor a complete JCL job. 
000015 //* It is a sample.  Before using this sample, you will have to make 
000016 //* the following modifications:                                     
000017 //*                                                                  
000018 //* 1) Usually you need to update the job statement to                  
000019 //*    meet your system requirements.                                   
000020 //*    We have done this for you.                                       
000021 //*                                                                     
000022 //* 2) Change all occurrences of &HLQ& to the appropriate high-level    
000023 //*    qualifier for the CSI and operational data sets.  Use the change 
000024 //*    command:                                                         
000025 //*                                                                     
000026 //*    CHANGE &HLQ& 'your-HLQ-value' ALL                                
000027 //*                                                                     
000028 //* 3) If you require a specific volume then change all occurrences of  
000029 //*    &VOLUME& to the appropriate volume serial identifier for CSI and 
000030 //*    operational data sets.  Use the change command:                  
000031 //*                                                                     
000032 //*    CHANGE &VOLUME& 'your-VOLUME-identifier' ALL                     
000033 //*                                                                     
000034 //*    If you do not require a specific volume, then remove all         
000035 //*    occurrences of &VOLUME& and the related keywords throughout the  
000036 //*    sample.                                                        
000037 //*                                                                   
000038 //* 4) If you require a specific device then change all occurrences of
000039 //*    &UNIT& to the appropriate device unit identifier for CSI and   
000040 //*    operational data sets.  Use the change command:                
000041 //*                                                                   
000042 //*    CHANGE &UNIT& 'your-UNIT-identifier' ALL                       
000043 //*                                                                   
000044 //*    If you do not require a specific device, then remove all       
000045 //*    occurrences of &UNIT& and the related keywords throughout the  
000046 //*    sample.                                                        
000047 //*                                                                   
000048 //********************************************************************
000049 //*                                                                   
000050 //* Delete data sets from any previous job run                        
000051 //*  then proceed with allocation of new data sets                    
000052 //*                                                                   
000053 //********************************************************************
000054 //DELVSAM  EXEC PGM=IDCAMS                                       
000055 //SYSPRINT DD SYSOUT=*                                           
000056 //SYSIN    DD *,SYMBOLS=CNVTSYS                                  
000057   DELETE &HLQ&.GLOBAL.CSI CLUSTER                                
000058   DELETE &HLQ&.TARGET.CSI CLUSTER                                
000059   DELETE &HLQ&.DLIB.CSI   CLUSTER                                
000060   SET MAXCC=0                                                    
000061 //DELPRIM  EXEC PGM=IEFBR14                                      
000062 //D01      DD DSN=&HLQ&.SMPPTS,DISP=(MOD,DELETE),                
000063 // SPACE=(TRK,0)                                                 
000064 //D02      DD DSN=&HLQ&.TARGET.SMPMTS,DISP=(MOD,DELETE),         
000065 // SPACE=(TRK,0)                                                 
000066 //D03      DD DSN=&HLQ&.TARGET.SMPSTS,DISP=(MOD,DELETE),         
000067 // SPACE=(TRK,0)                                                 
000068 //D04      DD DSN=&HLQ&.TARGET.SMPSCDS,DISP=(MOD,DELETE),        
000069 // SPACE=(TRK,0)                                                 
000070 //D05      DD DSN=&HLQ&.GLOBAL.SMPLOG,DISP=(MOD,DELETE),         
000071 // SPACE=(TRK,0)                                                 
000072 //D06      DD DSN=&HLQ&.GLOBAL.SMPLOGA,DISP=(MOD,DELETE),             
000073 // SPACE=(TRK,0)                                                      
000074 //D07      DD DSN=&HLQ&.TARGET.SMPLOG,DISP=(MOD,DELETE),              
000075 // SPACE=(TRK,0)                                                      
000076 //D08      DD DSN=&HLQ&.TARGET.SMPLOGA,DISP=(MOD,DELETE),             
000077 // SPACE=(TRK,0)                                                      
000078 //D09      DD DSN=&HLQ&.DLIB.SMPLOG,DISP=(MOD,DELETE),                
000079 // SPACE=(TRK,0)                                                      
000080 //D10      DD DSN=&HLQ&.DLIB.SMPLOGA,DISP=(MOD,DELETE),               
000081 // SPACE=(TRK,0)                                                      
000082 //********************************************************************
000083 //*                                                                   
000084 //* Allocate VSAM data sets to contain SMP/E CSIs, and initialize     
000085 //* them by copying the GIMZPOOL seed record.                         
000086 //*                                                                   
000087 //********************************************************************
000088 //*                                                                   
000089 //DEFZONES EXEC PGM=IDCAMS                                            
000090 //SYSPRINT DD SYSOUT=*                                   
000091 //GIMZPOOL DD DSN=SYS1.MACLIB(GIMZPOOL),DISP=SHR         
000092 //SYSIN    DD *,SYMBOLS=CNVTSYS                          
000093   DEFINE CLUSTER(                            +           
000094            NAME(&HLQ&.GLOBAL.CSI)            +           
000095            VOLUMES(&VOLUME&)                 +           
000096            CYLINDERS(100 10)                 +           
000097            FREESPACE(10 5)                   +           
000098            KEYS(24 0)                        +           
000099            RECORDSIZE(24 143)                +           
000100            SHAREOPTIONS(2 3)                 +           
000101                )                             +           
000102       DATA (                                 +           
000103            NAME(&HLQ&.GLOBAL.CSI.DATA)       +           
000104            CONTROLINTERVALSIZE(8192)         +           
000105            )                                 +           
000106      INDEX (NAME(&HLQ&.GLOBAL.CSI.INDEX)     +           
000107            CONTROLINTERVALSIZE(4096)         +           
000108            )                                              
000109   REPRO INFILE(GIMZPOOL)                     +            
000110            OUTDATASET(&HLQ&.GLOBAL.CSI)                   
000111   DEFINE CLUSTER(                            +            
000112            NAME(&HLQ&.TARGET.CSI)            +            
000113            VOLUMES(&VOLUME&)                 +            
000114            CYLINDERS(100 10)                 +            
000115            FREESPACE(10 5)                   +            
000116            KEYS(24 0)                        +            
000117            RECORDSIZE(24 143)                +            
000118            SHAREOPTIONS(2 3)                 +            
000119                )                             +            
000120       DATA (                                 +            
000121            NAME(&HLQ&.TARGET.CSI.DATA)       +            
000122            CONTROLINTERVALSIZE(8192)         +            
000123            )                                 +            
000124      INDEX (NAME(&HLQ&.TARGET.CSI.INDEX)     +            
000125            CONTROLINTERVALSIZE(4096)         +            
000126            )                                           
000127   REPRO INFILE(GIMZPOOL)                     +         
000128            OUTDATASET(&HLQ&.TARGET.CSI)                
000129   DEFINE CLUSTER(                            +         
000130            NAME(&HLQ&.DLIB.CSI)              +         
000131            VOLUMES(&VOLUME&)                 +         
000132            CYLINDERS(100 10)                 +         
000133            FREESPACE(10 5)                   +         
000134            KEYS(24 0)                        +         
000135            RECORDSIZE(24 143)                +         
000136            SHAREOPTIONS(2 3)                 +         
000137                )                             +         
000138       DATA (                                 +         
000139            NAME(&HLQ&.DLIB.CSI.DATA)         +         
000140            CONTROLINTERVALSIZE(8192)         +         
000141            )                                 +         
000142      INDEX (NAME(&HLQ&.DLIB.CSI.INDEX)       +         
000143            CONTROLINTERVALSIZE(4096)         +         
000144            )                                                           
000145   REPRO INFILE(GIMZPOOL)                     +                         
000146            OUTDATASET(&HLQ&.DLIB.CSI)                                  
000147 /*                                                                     
000148 //*                                                                    
000149 //******************************************************************** 
000150 //*                                                                    
000151 //* Allocate SMP/E operational data sets:                              
000152 //*                                                                    
000153 //* - SMPPTS data set.                                                 
000154 //* - SMPMTS, SMPSTS, and SMPSCDS data sets.  Each target zone     @P2C
000155 //*   must have their own.                                             
000156 //* - SMPLOG and SMPLOGA data sets.  Each zone (global, target, and    
000157 //*   dlib) should have their own.                                     
000158 //*                                                                    
000159 //******************************************************************** 
000160 //*                                                                    
000161 //ALLOCDS  EXEC  PGM=IEFBR14,COND=(0,LT)                               
000162 //*                                                           
000163 //*  Recommend SMPPTS be a PDSE (DSNTYPE=LIBRARY)             
000164 //*                                                           
000165 //SMPPTS   DD DSN=&HLQ&.SMPPTS,                               
000166 //         DISP=(NEW,CATLG),                                  
000167 //         DCB=(RECFM=FB,LRECL=80,BLKSIZE=0,DSORG=PO),        
000168 //         DSNTYPE=LIBRARY,                                   
000169 //         UNIT=&UNIT&,                                       
000170 //         VOL=SER=&VOLUME&,                                  
000171 //         SPACE=(CYL,(250,50,50))                            
000172 //*                                                           
000173 //* Target zone must have its own SMPMTS, SMPSTS and SMPSCDS. 
000174 //*                                                           
000175 //SMPMTS   DD DSN=&HLQ&.TARGET.SMPMTS,                        
000176 //         DISP=(NEW,CATLG),                                  
000177 //         DCB=(RECFM=FB,LRECL=80,BLKSIZE=0,DSORG=PO),        
000178 //         UNIT=&UNIT&,                                       
000179 //         VOL=SER=&VOLUME&,                                  
000180 //         SPACE=(CYL,(10,5,50))                                       
000181 //SMPSTS   DD DSN=&HLQ&.TARGET.SMPSTS,                                 
000182 //         DISP=(NEW,CATLG),                                           
000183 //         DCB=(RECFM=FB,LRECL=80,BLKSIZE=0,DSORG=PO),                 
000184 //         UNIT=&UNIT&,                                                
000185 //         VOL=SER=&VOLUME&,                                           
000186 //         SPACE=(CYL,(10,5,50))                                  7@P2D
000187 //SMPSCDS  DD DSN=&HLQ&.TARGET.SMPSCDS,                                
000188 //         DISP=(NEW,CATLG),                                           
000189 //         DCB=(RECFM=FB,LRECL=80,BLKSIZE=0,DSORG=PO),                 
000190 //         UNIT=&UNIT&,                                                
000191 //         VOL=SER=&VOLUME&,                                           
000192 //         SPACE=(CYL,(10,5,50))                                       
000193 //*                                                                    
000194 //* SMPLOG and SMPLOGA data sets.  Each zone (global, target, and      
000195 //* dlib) should have their own.                                       
000196 //*                                                                    
000197 //GLOG     DD DSN=&HLQ&.GLOBAL.SMPLOG,                                 
000198 //         DISP=(NEW,CATLG),                               
000199 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),          
000200 //         UNIT=&UNIT&,                                    
000201 //         VOL=SER=&VOLUME&,                               
000202 //         SPACE=(CYL,(3,2))                               
000203 //GLOGA    DD DSN=&HLQ&.GLOBAL.SMPLOGA,                    
000204 //         DISP=(NEW,CATLG),                               
000205 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),          
000206 //         UNIT=&UNIT&,                                    
000207 //         VOL=SER=&VOLUME&,                               
000208 //         SPACE=(CYL,(3,2))                               
000209 //TLOG     DD DSN=&HLQ&.TARGET.SMPLOG,                     
000210 //         DISP=(NEW,CATLG),                               
000211 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),          
000212 //         UNIT=&UNIT&,                                    
000213 //         VOL=SER=&VOLUME&,                               
000214 //         SPACE=(CYL,(3,2))                               
000215 //TLOGA    DD DSN=&HLQ&.TARGET.SMPLOGA,                    
000216 //         DISP=(NEW,CATLG),                                 
000217 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),            
000218 //         UNIT=&UNIT&,                                      
000219 //         VOL=SER=&VOLUME&,                                 
000220 //         SPACE=(CYL,(3,2))                                 
000221 //DLOG     DD DSN=&HLQ&.DLIB.SMPLOG,                         
000222 //         DISP=(NEW,CATLG),                                 
000223 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),            
000224 //         UNIT=&UNIT&,                                      
000225 //         VOL=SER=&VOLUME&,                                 
000226 //         SPACE=(CYL,(3,2))                                 
000227 //DLOGA    DD DSN=&HLQ&.DLIB.SMPLOGA,                        
000228 //         DISP=(NEW,CATLG),                                 
000229 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),            
000230 //         UNIT=&UNIT&,                                      
000231 //         VOL=SER=&VOLUME&,                                 
000232 //         SPACE=(CYL,(3,2))                                 
000233 //*                                                          
000234 //********************************************************************
000235 //*                                                                   
000236 //* Prime the CSI data sets with:                                     
000237 //* - zone definitions for a global, target, and dlib zone            
000238 //* - basic OPTIONS entry                                             
000239 //* - DDDEF entries for operational and temporary data sets           
000240 //*                                                                   
000241 //********************************************************************
000242 //*                                                                   
000243 //UPDZONES EXEC PGM=GIMSMP,COND=(0,LT)                                
000244 //SMPCSI   DD DSN=&HLQ&.GLOBAL.CSI,DISP=SHR                           
000245 //SMPLOG   DD SYSOUT=*                                                
000246 //SMPOUT   DD SYSOUT=*                                                
000247 //SMPRPT   DD SYSOUT=*                                                
000248 //SMPLIST  DD SYSOUT=*                                                
000249 //SMPPTS   DD DSN=&HLQ&.SMPPTS,DISP=SHR                               
000250 //SYSPRINT DD SYSOUT=*                                                
000251 //SMPCNTL  DD *,SYMBOLS=CNVTSYS                                       
000252   SET BOUNDARY(GLOBAL).                                     
000253   UCLIN.                                                    
000254     ADD OPTIONS(GOPT)                                       
000255           DSPREFIX(&HLQ&.SMPTLIB)                           
000256           DSSPACE(20,20,100)                                
000257           MSGFILTER(YES)                                    
000258           MSGWIDTH(80)                                      
000259           RECZGRP(ALLZONES)                                 
000260           RETRYDDN(ALL).                                    
000261     ADD GLOBALZONE                                          
000262           OPTIONS(GOPT)                                     
000263           SREL(Z038)                                        
000264           ZONEINDEX(                                        
000265                     (TARGET,&HLQ&.TARGET.CSI,TARGET)        
000266                     (DLIB,&HLQ&.DLIB.CSI,DLIB)              
000267                    ).                                       
000268     ADD DDDEF(SMPDEBUG) SYSOUT(*).                          
000269     ADD DDDEF(SMPLIST)  SYSOUT(*).                          
000270     ADD DDDEF(SMPRPT)   SYSOUT(*).                               
000271     ADD DDDEF(SMPSNAP)  SYSOUT(*).                               
000272     ADD DDDEF(SYSPRINT) SYSOUT(*).                               
000273     ADD DDDEF(SMPLOG)   DA(&HLQ&.GLOBAL.SMPLOG) MOD.             
000274     ADD DDDEF(SMPLOGA)  DA(&HLQ&.GLOBAL.SMPLOGA) MOD.            
000275     ADD DDDEF(SMPOUT)   SYSOUT(*).                               
000276     ADD DDDEF(SMPPTS)   DA(&HLQ&.SMPPTS) SHR.                    
000277     ADD DDDEF(SYSUT1)   UNIT(SYSALLDA) CYLINDERS SPACE(25,25).   
000278     ADD DDDEF(SYSUT2)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).     
000279     ADD DDDEF(SYSUT3)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).     
000280     ADD DDDEF(SYSUT4)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).     
000281     ADD DDDEF(SMPWRK1)  UNIT(SYSALLDA) CYLINDERS SPACE(10,10)    
000282                         DIR(100).                                
000283     ADD DDDEF(SMPWRK2)  UNIT(SYSALLDA) CYLINDERS SPACE(10,10)    
000284                         DIR(100).                                
000285     ADD DDDEF(SMPWRK3)  UNIT(SYSALLDA) CYLINDERS SPACE(150,50)   
000286                         DIR(1000).                               
000287     ADD DDDEF(SMPWRK4)  UNIT(SYSALLDA) CYLINDERS SPACE(5,5)      
000288                         DIR(50).                                  
000289     ADD DDDEF(SMPWRK6)  UNIT(SYSALLDA) CYLINDERS SPACE(150,50)    
000290                         DIR(1000).                                
000291   ENDUCL.                                                         
000292   SET BOUNDARY(TARGET).                                           
000293   UCLIN.                                                          
000294     ADD TARGETZONE(TARGET)                                        
000295           OPTIONS(GOPT)                                           
000296           SREL(Z038)                                              
000297           RELATED(DLIB).                                          
000298     ADD DDDEF(SMPDEBUG) SYSOUT(*).                                
000299     ADD DDDEF(SMPLIST)  SYSOUT(*).                                
000300     ADD DDDEF(SMPLOG)   DA(&HLQ&.TARGET.SMPLOG) MOD.              
000301     ADD DDDEF(SMPLOGA)  DA(&HLQ&.TARGET.SMPLOGA) MOD.             
000302     ADD DDDEF(SMPOUT)   SYSOUT(*).                                
000303     ADD DDDEF(SMPRPT)   SYSOUT(*).                                
000304     ADD DDDEF(SMPSNAP)  SYSOUT(*).                                
000305     ADD DDDEF(SYSPRINT) SYSOUT(*).                                
000306     ADD DDDEF(SMPPTS)   DA(&HLQ&.SMPPTS) SHR.                          
000307     ADD DDDEF(SMPSTS)   DA(&HLQ&.TARGET.SMPSTS) OLD.                   
000308     ADD DDDEF(SMPMTS)   DA(&HLQ&.TARGET.SMPMTS) OLD.                   
000309     ADD DDDEF(SMPLTS)   UNIT(SYSALLDA) CYLINDERS SPACE(10,10)          
000310                         DIR(1) DSNTYPE(LIBRARY) /*              @P2C*/.
000311     ADD DDDEF(SMPSCDS)  DA(&HLQ&.TARGET.SMPSCDS) OLD.                  
000312     ADD DDDEF(SYSLIB)   CONCAT(SMPMTS).                                
000313     ADD DDDEF(SYSUT1)   UNIT(SYSALLDA) CYLINDERS SPACE(25,25).         
000314     ADD DDDEF(SYSUT2)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).           
000315     ADD DDDEF(SYSUT3)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).           
000316     ADD DDDEF(SYSUT4)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).           
000317     ADD DDDEF(SMPWRK1)  UNIT(SYSALLDA) CYLINDERS SPACE(10,10)          
000318                         DIR(100).                                      
000319     ADD DDDEF(SMPWRK2)  UNIT(SYSALLDA) CYLINDERS SPACE(10,10)          
000320                         DIR(100).                                      
000321     ADD DDDEF(SMPWRK3)  UNIT(SYSALLDA) CYLINDERS SPACE(150,50)         
000322                         DIR(1000).                                     
000323     ADD DDDEF(SMPWRK4)  UNIT(SYSALLDA) CYLINDERS SPACE(5,5)            
000324                         DIR(50).                                
000325     ADD DDDEF(SMPWRK6)  UNIT(SYSALLDA) CYLINDERS SPACE(150,50)  
000326                         DIR(1000).                              
000327   ENDUCL.                                                       
000328   SET BOUNDARY(DLIB).                                           
000329   UCLIN.                                                        
000330     ADD DLIBZONE(DLIB)                                          
000331           OPTIONS(GOPT)                                         
000332           SREL(Z038)                                            
000333           ACCJCLIN                                              
000334           RELATED(TARGET).                                      
000335     ADD DDDEF(SMPDEBUG) SYSOUT(*).                              
000336     ADD DDDEF(SMPLIST)  SYSOUT(*).                              
000337     ADD DDDEF(SMPLOG)   DA(&HLQ&.DLIB.SMPLOG) MOD.              
000338     ADD DDDEF(SMPLOGA)  DA(&HLQ&.DLIB.SMPLOGA) MOD.             
000339     ADD DDDEF(SMPOUT)   SYSOUT(*).                              
000340     ADD DDDEF(SMPRPT)   SYSOUT(*).                              
000341     ADD DDDEF(SMPSNAP)  SYSOUT(*).                              
000342     ADD DDDEF(SYSPRINT) SYSOUT(*).                                     
000343     ADD DDDEF(SMPPTS)   DA(&HLQ&.SMPPTS) SHR.                          
000344     ADD DDDEF(SMPSTS)   DA(&HLQ&.TARGET.SMPSTS) OLD.                   
000345     ADD DDDEF(SMPMTS)   DA(&HLQ&.TARGET.SMPMTS) OLD.                   
000346     ADD DDDEF(SMPLTS)   UNIT(SYSALLDA) CYLINDERS SPACE(10,10)          
000347                         DIR(1) DSNTYPE(LIBRARY) /*              @P2C*/.
000348     ADD DDDEF(SMPSCDS)  DA(&HLQ&.TARGET.SMPSCDS) OLD.                  
000349     ADD DDDEF(SYSLIB)   CONCAT(SMPMTS).                                
000350     ADD DDDEF(SYSUT1)   UNIT(SYSALLDA) CYLINDERS SPACE(25,25).         
000351     ADD DDDEF(SYSUT2)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).           
000352     ADD DDDEF(SYSUT3)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).           
000353     ADD DDDEF(SYSUT4)   UNIT(SYSALLDA) CYLINDERS SPACE(5,5).           
000354     ADD DDDEF(SMPWRK1)  UNIT(SYSALLDA) CYLINDERS SPACE(10,10)          
000355                         DIR(100).                                      
000356     ADD DDDEF(SMPWRK2)  UNIT(SYSALLDA) CYLINDERS SPACE(10,10)          
000357                         DIR(100).                                      
000358     ADD DDDEF(SMPWRK3)  UNIT(SYSALLDA) CYLINDERS SPACE(150,50)         
000359                         DIR(1000).                                     
000360     ADD DDDEF(SMPWRK4)  UNIT(SYSALLDA) CYLINDERS SPACE(5,5)             
000361                         DIR(50).                                        
000362     ADD DDDEF(SMPWRK6)  UNIT(SYSALLDA) CYLINDERS SPACE(150,50)          
000363                         DIR(1000).                                      
000364   ENDUCL.                                                               
000365 /*                                                                      
****** **************************** Bottom of Data ****************************

CHANGE &HLQ& 'Z38515.SMP' ALL changes all keywords &HLQ& to my userid Z38515
CHANGE &VOLUME& 'VPWRKA' ALL 
Change &UNIT& '3390' ALL 

ALL CLUSTERS IN STEP DEFZONES CYL WAS CHANGE TO TRACKS(2 1)  AS WELL      

//DEFZONES EXEC PGM=IDCAMS                          
//SYSPRINT DD SYSOUT=*                              
//GIMZPOOL DD DSN=SYS1.MACLIB(GIMZPOOL),DISP=SHR    
//SYSIN    DD *,SYMBOLS=CNVTSYS                     
  DEFINE CLUSTER(                            +      
           NAME(Z38515.SMP.GLOBAL.CSI)           +      
           VOLUMES(VPWRKA)                   +      
           CYLINDERS(100 10)                 +      
           FREESPACE(10 5)                   +      
           KEYS(24 0)                        +      
           RECORDSIZE(24 143)                +      
           SHAREOPTIONS(2 3)                 +      
               )                             +      
      DATA (                                 +      
           NAME(Z38515.SMP.GLOBAL.CSI.DATA)      +      
           CONTROLINTERVALSIZE(8192)         +      
           )                                 +      
     INDEX (NAME(Z38515.SMP.GLOBAL.CSI.INDEX)    +      
           CONTROLINTERVALSIZE(4096)         +        
           )                                          
  REPRO INFILE(GIMZPOOL)                     +        
           OUTDATASET(Z38515.SMP.GLOBAL.CSI)              
  DEFINE CLUSTER(                            +        
           NAME(Z38515.SMP.TARGET.CSI)           +        
           VOLUMES(VPWRKA)                   +        
           CYLINDERS(100 10)                 +        
           FREESPACE(10 5)                   +        
           KEYS(24 0)                        +        
           RECORDSIZE(24 143)                +        
           SHAREOPTIONS(2 3)                 +        
               )                             +        
      DATA (                                 +        
           NAME(Z38515.SMP.TARGET.CSI.DATA)      +        
           CONTROLINTERVALSIZE(8192)         +        
           )                                 +        
     INDEX (NAME(Z38515.SMP.TARGET.CSI.INDEX)    +        
            CONTROLINTERVALSIZE(4096)         +       
            )                                         
   REPRO INFILE(GIMZPOOL)                     +       
            OUTDATASET(Z38515.SMP.TARGET.CSI)             
   DEFINE CLUSTER(                            +       
            NAME(Z38515.SMP.DLIB.CSI)             +       
            VOLUMES(VPWRKA)                   +       
            CYLINDERS(100 10)                 +       
            FREESPACE(10 5)                   +       
            KEYS(24 0)                        +       
            RECORDSIZE(24 143)                +       
            SHAREOPTIONS(2 3)                 +       
                )                             +       
       DATA (                                 +       
            NAME(Z38515.SMP.DLIB.CSI.DATA)        +       
            CONTROLINTERVALSIZE(8192)         +       
            )                                 +       
      INDEX (NAME(Z38515.SMP.DLIB.CSI.INDEX)      +       
            CONTROLINTERVALSIZE(4096)         +   
            )                                     
   REPRO INFILE(GIMZPOOL)                     +   
            OUTDATASET(Z38515.SMP.DLIB.CSI)           
 /*                                               

CHANGE CYL TO TRACKS AND IF ITS A PO CHANGE TO SPACE TO SPACE=(TRK,(1,1,1)) 

ELSE IF ITS A PS 

SPACE=(TRK,(1,1))


000161 //ALLOCDS  EXEC  PGM=IEFBR14,COND=(0,LT)                       
000162 //*                                                            
000163 //*  Recommend SMPPTS be a PDSE (DSNTYPE=LIBRARY)              
000164 //*                                                            
==CHG> //SMPPTS   DD DSN=Z38515.SMPPTS,                               
000166 //         DISP=(NEW,CATLG),                                   
000167 //         DCB=(RECFM=FB,LRECL=80,BLKSIZE=0,DSORG=PO),         
000168 //         DSNTYPE=LIBRARY,                                    
==CHG> //         UNIT=3390,                                          
==CHG> //         VOL=SER=VPWRKA,                                     
000171 //         SPACE=(TRK,(1,1,1))                                 
000172 //*                                                            
000173 //* Target zone must have its own SMPMTS, SMPSTS and SMPSCDS.  
000174 //*                                                            
==CHG> //SMPMTS   DD DSN=Z38515.TARGET.SMPMTS,                        
000176 //         DISP=(NEW,CATLG),                                   
000177 //         DCB=(RECFM=FB,LRECL=80,BLKSIZE=0,DSORG=PO),         
==CHG> //         UNIT=3390,                                          
==CHG> //         VOL=SER=VPWRKA,                                             
000180 //         SPACE=(TRK,(1,1,1))                                         
==CHG> //SMPSTS   DD DSN=Z38515.TARGET.SMPSTS,                                
000182 //         DISP=(NEW,CATLG),                                           
000183 //         DCB=(RECFM=FB,LRECL=80,BLKSIZE=0,DSORG=PO),                 
==CHG> //         UNIT=3390,                                                  
==CHG> //         VOL=SER=VPWRKA,                                             
000186 //         SPACE=(TRK,(1,1,1))                                    7@P2D
==CHG> //SMPSCDS  DD DSN=Z38515.TARGET.SMPSCDS,                               
000188 //         DISP=(NEW,CATLG),                                           
000189 //         DCB=(RECFM=FB,LRECL=80,BLKSIZE=0,DSORG=PO),                 
==CHG> //         UNIT=3390,                                                  
==CHG> //         VOL=SER=VPWRKA,                                             
000192 //         SPACE=(TRK,(1,1,1))                                         
000193 //*                                                                    
000194 //* SMPLOG and SMPLOGA data sets.  Each zone (global, target, and      
000195 //* dlib) should have their own.                                       
000196 //*                                                                    
==CHG> //GLOG     DD DSN=Z38515.GLOBAL.SMPLOG,                       
000198 //         DISP=(NEW,CATLG),                                  
000199 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),             
==CHG> //         UNIT=3390,                                         
==CHG> //         VOL=SER=VPWRKA,                                    
000202 //         SPACE=(TRK,(1,1))                                  
==CHG> //GLOGA    DD DSN=Z38515.GLOBAL.SMPLOGA,                      
000204 //         DISP=(NEW,CATLG),                                  
000205 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),             
==CHG> //         UNIT=3390,                                         
==CHG> //         VOL=SER=VPWRKA,                                    
000208 //         SPACE=(TRK,(1,1))                                  
==CHG> //TLOG     DD DSN=Z38515.TARGET.SMPLOG,                       
000210 //         DISP=(NEW,CATLG),                                  
000211 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),             
==CHG> //         UNIT=3390,                                         
==CHG> //         VOL=SER=VPWRKA,                                    
000214 //         SPACE=(TRK,(1,1))                                  
==CHG> //TLOGA    DD DSN=Z38515.TARGET.SMPLOGA,                    
000216 //         DISP=(NEW,CATLG),                                
000217 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),           
==CHG> //         UNIT=3390,                                       
==CHG> //         VOL=SER=VPWRKA,                                  
000220 //         SPACE=(TRK,(1,1))                                
==CHG> //DLOG     DD DSN=Z38515.DLIB.SMPLOG,                       
000222 //         DISP=(NEW,CATLG),                                
000223 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),           
==CHG> //         UNIT=3390,                                       
==CHG> //         VOL=SER=VPWRKA,                                  
000226 //         SPACE=(TRK,(1,1))                                
==CHG> //DLOGA    DD DSN=Z38515.DLIB.SMPLOGA,                      
000228 //         DISP=(NEW,CATLG),                                
000229 //         DCB=(RECFM=VB,LRECL=510,BLKSIZE=3200),           
==CHG> //         UNIT=3390,                                       
==CHG> //         VOL=SER=VPWRKA,                                  
000232 //         SPACE=(TRK,(1,1))                                



JOB SUBMITTED: 

 15.35.22 JOB06496 $HASP165 GIMSAMPU ENDED AT SVSCJES2 MAXCC=0000 CN(INTERNAL) 
 ***                                                                           
                                                                               
 SUCCESSFUL                                                                              

********************************* TOP OF DATA **********************************
                   J E S 2  J O B  L O G  --  S Y S T E M  S 0 W 1  --  N O D E 
                                                                                
15.34.46 JOB06496 ---- THURSDAY,  25 APR 2024 ----                              
15.34.46 JOB06496  IRR010I  USERID Z38515   IS ASSIGNED TO THIS JOB.            
15.34.49 JOB06496  ICH70001I Z38515   LAST ACCESS AT 15:06:53 ON THURSDAY, APRIL
15.34.49 JOB06496  $HASP373 GIMSAMPU STARTED - INIT 1    - CLASS A        - SYS 
15.34.50 JOB06496  -                                      -----TIMINGS (MINS.)--
15.34.50 JOB06496  -STEPNAME PROCSTEP    RC   EXCP   CONN       TCB       SRB  C
15.34.50 JOB06496  -DELVSAM              00     12      1       .00       .00   
15.34.56 JOB06496  -DELPRIM              00     32     10       .00       .00   
15.35.04 JOB06496  -DEFZONES             00     75     16       .00       .00   
15.35.06 JOB06496  -ALLOCDS              00      2      0       .00       .00   
15.35.21 JOB06496  -UPDZONES             00    189     16       .00       .00   
15.35.21 JOB06496  -GIMSAMPU ENDED.  NAME-                     TOTAL TCB CPU TIM
15.35.21 JOB06496  $HASP395 GIMSAMPU ENDED - RC=0000                            
------ JES2 JOB STATISTICS ------                                               
  F1=HELP      F2=SPLIT     F3=END       F4=RETURN    F5=IFIND     F6=BOOK      

 Z38515.GLOBAL.CSI                                              *VSAM*
 Z38515.GLOBAL.CSI.DATA                                         ZXPM03
 Z38515.GLOBAL.CSI.INDEX                                        ZXPM03
 Z38515.GLOBAL.SMPLOG                                           ZXPM03
 Z38515.GLOBAL.SMPLOGA                                          ZXPM03
Z38515.TARGET.CSI                                              *VSAM*
Z38515.TARGET.CSI.DATA                                         ZXPM03
Z38515.TARGET.CSI.INDEX                                        ZXPM03
Z38515.TARGET.SMPLOG                                           ZXPM03
Z38515.TARGET.SMPLOGA                                          ZXPM03
Z38515.TARGET.SMPMTS                                           ZXPM03
Z38515.TARGET.SMPSCDS                                          ZXPM03
Z38515.TARGET.SMPSTS                                           ZXPM03
