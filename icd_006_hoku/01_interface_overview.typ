
== Interface Overview

HOKU is MQD’s provider enrollment system. HOKU interfaces with and receives
applications for enrollment/credentialing from providers who serve Hawaii Medicaid
members. Some data from HOKU is exchanged with HPMMIS and will therefore be
available via the provider file extracted from HPMMIS. However, other HOKU-specific
identifiers, as well as information on providers pending within HOKU, will be made
available through a special feed extracted directly from HOKU.

#figure(
  table(
    columns: (auto, 1fr), align: (left, left), stroke: 0.5pt,
    [*Attribute*], [*Details*],
    [System - Title], [Hawaii Online Kahu Utility],
    [Abbreviation], [HOKU],
    [Point of Contact (MQD)], [Marvin Malohi \<mmalohi\@dhs.hawai.gov\>],
    [Point of Contact (Vendor)], [Bin Shi \<c.bin.shi\@acentra.com\>],
    [Vendor], [Acentra]
  ), caption: [Interface Specification Overview - HOKU]
)
