The GIMSAMPU member in SYS1.SAMPLIB is a sample job to allocate and prime CSI and SMP/E operational data sets

ALSO 

SYS1.MACLIB(GIMZPOOL)  
*******************************************

Allocating a CSI data set
Last Updated: 2021-04-30
CSI data sets are keyed VSAM clusters and are allocated by use of access method services. For additional information and a description of the parameters, see z/OS DFSMS Access Method Services Commands.

The GIMSAMPU member in SYS1.SAMPLIB is a sample job to allocate and prime CSI and SMP/E operational data sets. The following sample job step, which is taken from the sample job in GIMSAMPU, allocates a CSI data set with enough space to have multiple target or distribution zones and then initializes the CSI with the zpool record:
//DEFZONES EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//GIMZPOOL DD DSN=SYS1.MACLIB(GIMZPOOL),DISP=SHR
//SYSIN    DD *
   DEFINE CLUSTER(                            +
            NAME(SMPE.GLOBAL.CSI)             +
            VOLUMES(volid)             +
            CYLINDERS(100 10)                 +
            FREESPACE(10 5)                   +
            KEYS(24 0)                        +
            RECORDSIZE(24 143)                +
            SHAREOPTIONS(2 3)                 +
                )                             +
       DATA (                                 +
            NAME(SMPE.GLOBAL.CSI.DATA)        +
            CONTROLINTERVALSIZE(8192)         +
            )                                 +
      INDEX (NAME(SMPE.GLOBAL.CSI.INDEX)      +
            CONTROLINTERVALSIZE(4096)         +
            )
   REPRO INFILE(GIMZPOOL)                     +
            OUTDATASET(SMPE.GLOBAL.CSI)
 /*

In your own job, be sure to include:
NAME
These are the naming conventions for CSI data sets:
The high-level qualifier must not be SYS1 if the CSI data set is cataloged in a user catalog rather than in the master catalog. However, the user catalog should be accessible through an alias entry in the master catalog.
The low-level qualifier must be CSI.
These are examples of SMP/E data set names:
'SMPE.SMPCSI.CSI'
'PP.SMPCSI.CSI'
'IMS.SMPCSI.CSI'
'TEST.CSI'

KEYS(24 0)
RECORDSIZE(24 143)
SHAREOPTIONS(2 3)
SMP/E requires 2 as the cross-region SHAREOPTIONS value. It uses the default value of 3 as the cross-system SHAREOPTIONS value. Because SMP/E does not support cross-system sharing of the CSI, you cannot specify 4 as the cross-system value for SHAREOPTIONS. If you want to support cross-zone sharing, you must either use Global Resource Serialization (GRS) or a similar function, or ensure that the data set is not updated by multiple systems simultaneously.

CONTROLINTERVALSIZE (CISIZE)
If you allocate more than one CSI data set, ensure that they all have the same data CI size and index CI size. Doing so will allow SMP/E to take advantage of local shared resources (LSR) and VSAM resource pools. If the CSI data sets have different CISIZE values, SMP/E may open the data sets without using LSR.

CYLINDERS
The CYLINDERS value is only an estimated starting value. Your cylinder value may vary according to the device type, the software arrangement, the amount of service you install, and the number of CSIs.
