
== Interface Overview

#par[The Health Services Advisory Group (HSAG), a contractor for the Department of
Human Services (DHS), conducts several external quality review services for Medicaid
managed care plans in Hawaii. These include compliance assessments, performance
improvement projects, and the collection of Healthcare Effectiveness Data and Information
Set (HEDIS) quality measures. In addition to HEDIS, health plans submit non-HEDIS
measures, stratifications, and homegrown measures required by MQD.]

#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Attribute*], [*Details*],
    [System - Title], [MCO Quality],
    [Abbreviation], [MCOQUAL],
    [Point of Contact (MQD)], [#highlight[Name / Email]],
    [Point of Contact (Vendor)], [David Robison \<drobison\@hsag.com\>],
    [Vendor], [Health Services Advisory Group (HSAG)]
  ), caption: [Interface Specification Overview - MCO Quality]
)
#par[Performance measures are submitted at the beneficiary level and shared with MQD
through:]
#set list(indent: .25in)
- A performance measure Excel workbook (all plan rates and statewide averages).
- A flat file consolidating member-level data across plans, reporting quality measures by measurement year.