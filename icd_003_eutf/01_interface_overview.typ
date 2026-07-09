
== Interface Overview

HHDC is the formal name of the center, which acts as the State's All-Payer Claims
Database (APCD) and includes data sources from EUTF, the health plans, and Medicare
(via CMS ResDAC). APCD and EUTF datasets are maintained together, while Medicare
data is treated as a separate source.

APCD Overview: The Hawai‘i All-Payer Claims Database (APCD) is a large-scale
database that collects data derived from eligibility files, medical claims, pharmacy claims,
dental claims, and provider files. It enhances the member and provider matching process. In practice,
APCD is treated as a Medicaid-equivalent (all-payer claims) source.
#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Attribute*], [*Details*],
    [System - Title], [Hawai‘i Employer-Union Health Benefits (EUTF) Enrollment and Health Plan Data],
    [Abbreviation], [EUTF],
    [Point of Contact (HAP)], [Sean Okamoto \<sean\@uhtasi.org\> \ Ana Taualupe \<ana\@uhtasi.org\>],
    [Point of Contact (EUTF)], [Le, Quoc \<quoc.le\@hawaii.gov\>],
    [Vendor], [Hawai‘i Health Data Center (HHDC)]
  ), caption: [Interface Specification Overview - EUTF]
)
