== Data Transfer Overview

This section outlines the SFTP location, archiving responsibilities, and table extract details for file transfers between AHCCCS and MedQuest.

- *SFTP Location:*
  - Host: `sftp.statemedicaid.us`
  - Path: `/HAQ_Extracts`
  - Subfolders: `/PROD/IN/EVV`, `/PROD/OUT/EVV`

- *Archiving and Retention:*
  - All zip files are placed in `/PROD/OUT`.
  - MedQuest vendor must remove files after processing or establish timestamp logic to pull the correct file.
  - Files are auto-removed from SFTP after 60 days; AHCCCS retains two copies locally for analysis.
  - The `/PROD/IN` folder is available if MedQuest needs to send files back to AHCCCS.

=== Table Extract Details

- Each functional area contains a zip file created based on its refresh schedule.
- Zip file naming convention: `FunctionalArea_YYMMDDHHMMSS` _Example:_ `Provider_-20230131020030`
- Zip files remain in the drop directory until moved by the Med-QUEST team.
- Files on the SFTP are automatically deleted after 60 days.
- Files are zipped using Linux command: `zip -r`.
