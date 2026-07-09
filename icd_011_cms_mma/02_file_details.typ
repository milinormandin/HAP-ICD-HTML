== File Details

The CMS MMA interface contains fixed-width enrollment and eligibility files associated with MQD dual eligible beneficiaries. The data supports coordination of Medicare and Medicaid benefits and includes beneficiary-level enrollment information, eligibility indicators, subsidy and cost-sharing assistance information, and related Medicare coordination data. Files may also contain CMS processing and validation information, including response and error codes associated with submitted member records. Based on current HAP holdings, available data currently ranges from May 2021 through May 2026.
The interface uses multiple record types to organize file-level metadata, beneficiary detail information, summary totals, and transmission validation records. Record types are identified by a three-character code located in the first field of each record.

#figure
#table(
  columns: (2fr, 2fr, 4fr),
  align: left,
  [*Record Type*], [*Record Identification Code*], [*Purpose*],
  [Header Record], [HRD], [Identifies the beginning of the file and contains file-level metadata.],
  [Detail Records], [DET, PRO, LIS], [Contains beneficiary-level enrollment, eligibility, subsidy, and program-related information.],
  [File Summary Record], [FSM], [Contains summary totals and file validation information.],
  [Monthly Summary Record], [MSM], [Contains monthly aggregate summary information.],
  [Trailer Record], [TRL], [Identifies the end of the file and supports file completeness validation.],
)