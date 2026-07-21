== File Layout

All data files submitted via the [DATA SOURCE NAME] interface will follow the specifications below.

#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Format*], [[FORMAT (e.g. CSV, Fixed-width, Delimited)]],
    [Row Delimiter], [[ROW DELIMITER]],
    [Column Delimiter], [[COLUMN DELIMITER]],
    [Text Qualifier], [[TEXT QUALIFIER]],
    [Column names in first data row?], [[Yes / No]],
    [File Naming Convention], [See below],
    [Encoding], [[ENCODING (e.g. UTF-8)]],
  ), caption: [Interface Specification Overview - [DATA SOURCE NAME]]
)

*File Naming Conventions:*

- *[FILE TYPE]:* `[NAMING PATTERN]`
  - Example: `[EXAMPLE FILENAME]`
