== File Layout

All data files submitted via the CMS ResDAC interface will follow the specifications below.

#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Format*], [*Delimited*],
    [Row Delimiter], [Carriage return and line feed {CR}{LF}],
    [Column Delimiter], [Pipe (`|`)],
    [Text Qualifier], [Double Quote (`"`)],
    [Column names in first data row?], [Yes],
    [File Naming Convention], [See below],
    [Encoding],[],
  ), caption: [Interface Specification Overview - CMS ResDAC]
)

*File Naming Conventions:*

- *Control File:* `resdac_control_pulldate(CCYYMMDD).cnt`
  - Example: `resdac_control_20230831.cnt`

- *Data Files:* `tabletype_tablename_year(YYYY)_timestamp(CCYYMMDDhhmmss).txt`
  - Example: `df_bcarrier_claims_2010_20230831.txt`

- *Characteristics Files:* `tabletype_tablename_year(YYYY)_timestamp(CCYYMMDDhhmmss).txt`
  - Example: `cf_excl_drugs_2010_20230831.txt`

- *Reference Files:* `tabletype_tablename_timestamp(CCYYMMDDhhmmss).txt`
  - Example: `rf_betos_codes_20230831.txt`
