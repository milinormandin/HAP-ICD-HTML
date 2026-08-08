== File Layout

#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Format*], [Delimited text file (.txt)],
    [*Row Delimiter*], [Newline (\n) ],
    [*Column Delimiter*], [Pipe (|) ],
    [*Text Qualifier*], [Double Quote (`" "`)],
    [*Column Names in First Row?*], [Yes],
    [*File Naming Convention*], [`TABLE_NAME_[Timestamp YYYYMMDDHHMMSS].txt`],
    [*Example*], [`S_CASE_20240320173915.txt`],
    [*File Naming Convention (with Sequence)*], [`TABLE_NAME_[Timestamp YYYYMMDDHHMMSS]_SEQ[SequenceNumber].txt`],
    [*Example (with Sequence)*], [`S_CASE_01_20240320173915.txt`],
    [*Encoding*], [UTF-8],
  ), caption: [Interface Specification Overview - KOLEA]
)
