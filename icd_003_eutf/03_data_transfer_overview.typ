== Data Transfer Overview
This section describes how files are exchanged between HHDC and IDAP, including the transfer schedule, SFTP connection details, and the notification process for file delivery.

- *Delivery Schedule:*
  - Files are picked up from HHDC's SFTP server on the 15th of each month (HST business hours). If the 15th falls on a weekend or holiday, delivery occurs on the next business day.
  - Monthly transfers include CT, FS, EME, and PF. Quarterly transfers include MK, ME, MC, PC, DC, and PV.

- *SFTP Location:* Host: `submit.phidc.org` #h(1em) Path: `/DATA/ResDAC/`

- *File Notification:*
  - HHDC requires 15 business days to prepare data (13 days extract, 1 day control files, 1 day encryption).
  - Files are sent via SFTP within 2 business days after preparation.
  - IDAP sends confirmation upon receipt, imports, and validates the data.
  - If data fails acceptance checks, IDAP reports issues back to HHDC for correction and resubmission until successful.
*Schedule:* Monthly/Quarterly.

*SFTP:* Fill in host and path (e.g., `/DATA/<Interface>/`).

*Notification:* Indicate sender and recipient mailbox for delivery notices.
