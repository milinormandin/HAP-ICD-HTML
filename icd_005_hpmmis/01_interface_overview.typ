
== Interface Overview

The Hawaii Prepaid Medicaid Management Information System (HPMMIS) is the mainframe system that supports healthcare claims and encounter processing, managed care enrollment, and managed care capitation payments on behalf of Hawaii’s Medicaid beneficiaries. Fee for Service (FFS) claims received by HPMMIS are managed and processed by the Medicaid Fiscal Agent. Encounter data is received in standardized formats and fed into the HPMMIS system directly from each Medicaid Managed Care Organization (MCO). HPMMIS also receives claims and encounter data where MQD serves as a Third-PartyAdministrator (TPA). After encounter and claims data are received by the HPMMIS, a data validation process runs a comprehensive series of formatting and reasonableness checks. Data that pass validation checks are moved into HPMMIS for storage alongside various reference tables. HPMMIS and the related data warehouses serve as the central data repository for all Medicaid beneficiaries in Hawaii. The HPMMIS data will include recipient, enrollment, capitation, claims and encounters, provider, and other reference data. Another data source from HPMMIS includes T-MSIS files submitted to CMS, which may be used for data validation and consistency checks.
 

#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Attribute*], [*Details*],
    [System - Title], [HPMMIS (AHCCCS DW)],
    [Abbreviation], [HPMMIS],
    [Point of Contact (Source)],[Patrick Fyie(Data Steward) \<patrick.fyie\@azahcccs.gov\> \ Robert Heppler. (TMSIS Application Architect) \<robert.heppler\@azahcccs.gov\>], 
    [Point of Contact (MQD)], [Holly Bryant (Healthcare Business Analyst) \<hbryant\@dhs.hawaii.gov\> \ Haidee Shaw (BA Health Plan Data/ Member Enrollment)\<hshaw\@dhs.hawaii.gov\>],
    [Point of Contact (Vendor)], [Julie Barabash \<julie.barabash\@azahcccs.gov\>],
    [Vendor], [Arizona Health Care Cost Containment System Data Warehouse (AHCCCS)]
  ), caption: [Interface Specification Overview - HPMMIS]
)
