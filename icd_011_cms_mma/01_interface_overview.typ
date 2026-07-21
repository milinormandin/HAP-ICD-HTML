  
== Interface Overview

Hawaii has transmitted MMA files to CMS on at least a monthly basis since 2013. This “MMA file” (also referred to as the State Phasedown File) contains information related to dual eligible beneficiaries, including individuals receiving full Medicaid benefits as well as partial benefit assistance such as Medicare premium and cost-sharing support. The interface was established under the Medicare Prescription Drug, Improvement, and Modernization Act of 2003.

MQD submits an MMA Request file to CMS containing member enrollment and eligibility information. CMS returns an MMA Response file containing the original request information, processing and validation results, error codes, and additional Medicare-related information where applicable.


#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Attribute*], [*Details*],
    [System - Title], [CMS MMA -  MMA File of Dual Eligible Beneficiaries],
    [Abbreviation], [CMS MMA],
    [Point of Contact (Source)], [Holly Bryant / hbryant\@dhs.hawaii.org],
    [Point of Contact (MQD)], [Holly Bryant / hbryant\@dhs.hawaii.org],
    [Vendor], [MQD, AHCCCS]
  ), caption: [Interface Specification Overview - CMS MMA]
)
