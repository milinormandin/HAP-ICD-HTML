== Data Transfer Overview

This section summarizes historical and ongoing deliveries, submission channels (SFTP vs. Portal), and notifications.

- *Delivery Schedule:*
  - _Historical (2009–Q2 2024):_ ITR, PCR, PAM (member-level); FAS (provider-level).
  - _Ongoing (begins Q2 2024):_ QAPI (Quarterly), ITR (Quarterly), PAM (Quarterly), OUS (Quarterly), FAS (Quarterly), ASR (Annual/Ad Hoc), PCR (Annual).

- *Submission Channels:*
  - _Historical:_ SFTP (CR006-aligned) for direct load into IDAP. Host: `[TBD]` (AHCCCS SFTP) #h(1em) Path: `[TBD]` (MCO Reporting folder)
  - _Ongoing:_ Managed Care Reports Submission Portal (CR006) with automated data quality checks and KPI calculations.

- *File Notifications:*
  - _Historical:_ Email/designated channel to notify IDAP vendor when files are available on SFTP and to provide processing status updates.
  - _Ongoing (Portal):_ Automated notifications on submission, DQ completion, acceptance/rejection, and extension requests.

==== Managed Care Reports: Cadence, Components, and Responsibilities

#set text(size: 8pt)
#table(
  columns: (1.5fr, 1fr, 1fr, 2fr, 1fr, 2fr),
  align: left,
  stroke: 0.5pt,
  fill: (_, y) => if y == 0 { rgb("#BDD7EE") } else if calc.odd(y) { luma(245) } else { white },
  [*Report*], [*Phase*], [*Cadence*], [*Files / Components*], [*Data Level*], [*ALDF Responsibility*],

  [ITR (Interpretation / Translated Documents)], [Historical], [One-time], [CSV / delimited flat file], [Member-level], [N/A (historical load)],
  [PCR (Primary Care Report)], [Historical], [One-time], [CSV / delimited flat file], [Member-level], [N/A (historical load)],
  [PAM (Prior Authorizations - Medical)], [Historical], [One-time], [CSV / delimited flat file], [Member-level], [N/A (historical load)],
  [FAS (Fraud, Waste & Abuse)], [Historical], [One-time], [CSV / delimited flat file], [Provider-level], [N/A (historical load)],
  [QAPI (Quality Assurance & Program Improvement)], [Ongoing], [Quarterly], [QAPI report files & Aggregated Level Data Files (ALDF)], [Aggregate], [Plans provide ALDF],
  [ITR (Interpretation / Translated Documents)], [Ongoing], [Quarterly], [ITR report & Member Level Data Files (MLDF)], [Member-level], [IDAPV generates ALDF (SQL from HAO)],
  [PAM (Prior Authorizations - Medical)], [Ongoing], [Quarterly], [PAM report & MLDF], [Member-level], [IDAPV generates ALDF (SQL from HAO)],
  [OUS (Over/Under-Utilization of Services)], [Ongoing], [Quarterly], [OUS report & ALDF], [Aggregate], [Plans provide ALDF],
  [FAS (Fraud, Waste & Abuse)], [Ongoing], [Quarterly], [FAS report, MLDF, Provider-Level Data Files (PLDF)], [Mixed], [IDAPV generates ALDF (FAS+MLDF+PLDF SQL from HAO)],
  [ASR (Accreditation Status Report)], [Ongoing], [Annual / Ad Hoc], [ASR report only], [N/A], [None (no ALDF)],
  [PCR (Primary Care Report)], [Ongoing], [Annual], [PCR report files], [Member-level], [N/A],
)
