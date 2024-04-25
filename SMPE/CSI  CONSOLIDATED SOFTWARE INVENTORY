CONSOLIDATED SOFTWARE INVENTORY

The Consolidated Software Inventory (CSI) is a database that contains the information SMP/E needs to
correctly install products and their associated maintenance. It stores information about installed
software products and their elements, fixes, and other information.
CSI is a roadmap for SMP/E. It tells SMP/E what to do and where to go.
There are three zones (stored in VSAM datasets) of a CSI:

Global Zone
Target Zone
Distribution Zone

GLOBAL ZONE
The global zone tracks information on every SYSMOD that have been RECEIVEd
The global zone acts as an index to other zones in the CSI
Records all target zones
Records all distribution zones
There can only be one global zone per CSI
As you will see, there can be many CSIs on a given system.

TARGET ZONE
Contains information that describes the content, structure, and status of the target libraries
There can be multiple target zones in a CSI

Target Libraries
- Contain the executable code needed to run your system
- During APPLY, SYSMOD elements are installed here
 - It is recommended to never install directly into a production target library.
 - You would typically APPLY into a test SMP/E environment first and switch when appropriate
testing/validation has been completed

DISTRIBUTION ZONE

Contains information that describes the content, structure, and status of the distribution
libraries
There can be multiple distribution zones
Distribution Libraries (DLIBs)
Contain the last ACCEPTed copy of each element for a software product
Used during the installation process
Used for backup when elements in the target libraries must be restored

Next, you will get hands-on by setting up your own CSI, similar to what a client would do for
themselves.

When you create a CSI, the datasets are VSAM clusters that contain components. You will be using a
sample job to do this.

In the sample job you will find:

Cluster 1 - hlq.GLOBAL.CSI
Components:
hlq.GLOBAL.DATA
hlq.GLOBAL.INDEX

Cluster 2 - hlq.TARGET.CSI
Components:
hlq.TARGET.DATA
hlq.TARGET.INDEX

Cluster 3 - hlq.DLIB.CSI
Components:
hlq.DLIB.DATA
hlq.DLIB.INDEX
