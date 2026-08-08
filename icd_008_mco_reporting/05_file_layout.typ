== File Layout

#show raw.where(block: false): it => text(font: "Verdana", size: 1.01em, it.text)

#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Format*], [CSV],
    [*Row Delimiter*], [TBD],
    [*Column Delimiter*], [Comma (`,`)],
    [*Text Qualifier*], [Double Quote (`" "`)],
    [*Column Names in First Row?*], [Yes],
    [*File Naming Convention*], [#raw("[HealthPlanAcronym]_[ReportAcronym]_[File]_-REL[Date MM.YY].csv")],
    [*Example*], [AC_PCR_MAAT_REL04.24.csv],
    [*Encoding*], [UTF-8],
  ), caption: [Interface Specification Overview - MCO Reporting]
)
