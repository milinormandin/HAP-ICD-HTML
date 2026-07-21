== Data Transfer Overview

This section outlines SFTP locations, file notifications, file specifications, and security/privacy constraints.

- *SFTP Location:*
  - Host: `sftp.statemedicaid.us`
  - Path: `/HI/PES/PROD/IN/HOKU_Extracts`

- *File Notifications:*
  - Acentra emails `hap_edw_inbound@optum.com` when bi-weekly files are dropped or transmitted.

- *File Specifications:*
  - All files are delivered in a single zip folder. _Naming convention:_ `HOKU_PROVIDER_EXTRACT_[YYYYMMDD].zip`
  - Control files accompany each data file, containing:
    - Filename
    - Row count
    - File hash
    - Date submitted
  - Acentra will confirm control file formats and expectations with the development team.
