== File Layout

#table(
  columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
  [*Attribute*], [*Specification*],
  [Format], [Flat File],
  [Row Delimiter], [`\n` (LF)],
  [Column Delimiter], [Comma `,`],
  [Text Qualifier], [Double Quote `"`],
  [Column Names in First Row?], [Yes],
  [File Naming Convention], [`s_<ft/dl>_<TABLE_NAME>_Data.txt`, \ where `s` denotes a flat file, `ft` indicates a full table extract of the entire table, and `dl` indicates a delta load containing only new data since the last delivery for tables with viable date fields],
  [Example], [`s_ft_T_PR_ADDR_ID.txt`],
  [Encoding], [UTF-8]
)
