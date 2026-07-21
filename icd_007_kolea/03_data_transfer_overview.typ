== Data Transfer Overview

This section outlines the KOLEA delivery schedule, SFTP connection details, file notification process, and security/privacy considerations.

- *Delivery Schedule:*
  - Transfers are scheduled during the first week of each month, ideally on the 1st--3rd.

- *SFTP Location:*
  - Host: `https://sftp.statemedicaid.us`
  - Path: `HAO_EXTRACTS/KOLEA`
  - Notes:
    - ARCHIVE folder created for post-download file moves.
    - Optum currently lacks delete/move permissions; follow-up pending.
    - New FTP site retains files for only 30 days.
    - Known issues: login errors (Baskar to follow up with Haidee); "File Part" setting in WinSCP will be disabled.

- *File Notifications:*
  - Email sent to `hap_edw_inbound@optum.com` when file transfers are complete.
