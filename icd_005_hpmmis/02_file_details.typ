== File Details

=== Validation Process

Validation is handled internally by Plante and covers full and delta extracts, notifications, file zips, and SFTP movement. Extracted files are loaded into empty Synapse schema tables for comparison, and two checks are performed: a row count validation and a row-by-row validation using MD5 hash comparison. The objective is to ensure data integrity and detect any special characters that could disrupt loading. Any anomalies identified during this process are documented in a prior section.

=== Validation Files

Each functional area folder includes a validation file named `Control_<FunctionalArea>_YYMMDDHHMMSS.zip`, which contains file names, total row counts, load dates, and aggregate column details for select claims and encounters tables. Upon successful completion of an extract, a notification email is automatically generated for each domain and sent to `HAP_EDW_OPERATIONS@ds.uhc.com`.
