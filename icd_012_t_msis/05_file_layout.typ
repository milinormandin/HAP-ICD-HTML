== File Layout

#table(
  columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
  [*Attribute*], [*Specification*],
  [Format], [Fixed-Width Files],
  [Row Delimiter], [`Carriage return and line feed {CR}{LF}`],
  [Column Delimiter], [None],
  [Text Qualifier], [None],
  [Column Names in First Row?], [No],
  [File Naming Convention], [`P#EFT.ON.TMSIS.HI.{FileCode}.M{MM}Y{YY}.D{YYMMDD}.T{HHMMSS}`],
  [Example (Compressed)], [`P#EFT.ON.TMSIS.HI.CI.M01Y15.D170801.T033222`],
  [Example (Extracted)],[`P#EFT.ON.TMSIS.HI.CI.M01Y15.DYYMMDD.THHMMSST`],
  /* [Encoding], [] */
)

=== Two-Digit File Codes

#table(
  columns: (auto, 1fr, auto), align: (left, left, left), stroke: 0.5pt,
  [*File Code*], [*File Name*], [*File Segment Identifier*],
  [CI], [Claim Inpatient], [CIP],
  [CL], [Claim Long-Term Care], [CLT],
  [CO], [Claim Other], [COT],
  [CR], [Claim Pharmacy], [CRX],
  [CE], [Eligible], [ELG],
  [CF], [Financial Transaction], [FTX],
  [CM], [Managed Care Plan Information], [MCR],
  [CP], [Provider], [PRV],
  [CT], [Third-Party Liability], [TPL],
)

