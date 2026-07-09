== File Details

=== Validation Process

Validation is handled internally by Plante and covers full and delta extracts, notifications, file zips, and SFTP movement. Extracted files are loaded into empty Synapse schema tables for comparison, and two checks are performed: a row count validation and a row-by-row validation using MD5 hash comparison. The objective is to ensure data integrity and detect any special characters that could disrupt loading. Any anomalies identified during this process are documented in a prior section.

=== Validation Files

Each functional area folder includes a validation file named `Control_<FunctionalArea>_YYMMDDHHMMSS.zip`, which contains file names, total row counts, load dates, and aggregate column details for select claims and encounters tables. Upon successful completion of an extract, a notification email is automatically generated for each domain and sent to `HAP_EDW_OPERATIONS@ds.uhc.com`.

=== Data Transfer Overview

File transfers between AHCCCS and MedQuest are conducted via SFTP at `sftp.statemedicaid.us`, using the path `/HAO_Extracts` with subfolders `/PROD/IN/EVV` and `/PROD/OUT/EVV`. All zip files are placed in `/PROD/OUT` and must either be removed by the MedQuest vendor after processing or retrieved using timestamp logic to ensure the correct file is pulled. Files are automatically removed from the SFTP server after 60 days, though AHCCCS retains two local copies for analysis purposes. The `/PROD/IN` folder is available should MedQuest need to send files back to AHCCCS.

=== Table Extract Details

Each functional area produces a zip file based on its refresh schedule, named using the convention `FunctionalArea_YYMMDDHHMMSS` --- for example, `Provider_20230131020030` --- and files remain in the drop directory until they are moved by the MedQuest team. All files are compressed using the Linux command `zip -r`.