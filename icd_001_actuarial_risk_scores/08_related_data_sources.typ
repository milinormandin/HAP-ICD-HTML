== Related Data Sources

#table(
  columns: (auto, auto, 1fr, 1fr),
  align: (left, left, left, left),
  stroke: 0.5pt,

  [*Relationship*], [*Data Source*], [*Description*], [*Frequency*],

  [Receives data from],
  [KOLEA],
  [KOLEA is configured to automatically send Medicaid eligibility information and Long Term Care information, as applicable.],
  [Daily batch files between HPMMIS and KOLEA],

  [Sends data to],
  [KOLEA],
  [Member enrollment],
  [Daily batch files between HPMMIS and KOLEA],

  [Receives data from],
  [HOKU],
  [Provider enrollment status, address, licensure, PT],
  [Daily batch files between HPMMIS and HOKU],

  [Sends data to],
  [HOKU],
  [One time "conversion" of HPMMIS providers to HOKU],
  [Daily batch files between HPMMIS and HOKU],
)