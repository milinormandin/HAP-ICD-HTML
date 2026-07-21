== Data Transfer Overview

- *Delivery Schedule:*
  - _Monthly Snapshot:_ Captures all MQD beneficiaries; delivered during the last week of each month.
  - _Daily Feed:_ Includes only members with eligibility changes since the prior day. Began April 2022; between 2013 and April 2022, feeds were sent twice monthly.
  - Both daily and monthly files use the same layout and naming conventions, though the monthly snapshot is larger.
  - HAP will only receive the monthly snapshot file.

- *SFTP Location:*
  - Host: `kui.medquest.hawaii.gov`
  - Path: `/HI/HAO_Extracts`
  - Subfolder: `/PROD/OUT/RECIPIENT`

- *File Notifications:*
  - AHCCCS notifies `hap_edw_inbound@optum.com` each time monthly files are delivered or made available.
