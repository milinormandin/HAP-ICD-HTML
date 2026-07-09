== File Details

/* In paragraph form, provide a more detailed descriptions about the data (e.g. claims or enrollment, etc.) and how it was generated/collected and any related nuances. */

=== Data Transfer Overview

- *Delivery Schedule*
  - Files are delivered monthly, between the 16th and 22nd of each month
- *SFTP Location*
  - Host: `https://kui.medquest.hawaii.gov`
  - Path: `/HI/HAO_Extracts`
  - Subfolder: `/PROD/OUT/TMSIS`
- *File Notifications*
  - AHCCCS emails `hap_edw_inbound@optum.com` when monthly files are dropped or transmitted.

=== File Conversions

Certain fields require conversion from the EBCDIC zoned decimal format.
- Fields marked S9 in the SIZE column are signed numeric.
- The rightmost digit encodes both value and sign.
- Example: S9(5)V99  decimal precision 7 (5 digits before decimal, 2 after), scale 2.


#align(center)[
  ==== BDC to EBCDIC Mapping
  #table(
  columns: (auto, auto), align: (left, left), stroke: 0.5pt,
  [*BCD Digit*], [*EBCDIC Character*],

  [0+], [A],
  [1+], [B],
  [2+], [C],
  [3+], [D],
  [4+], [E],
  [5+], [F],
  [6+], [G],
  [7+], [H],
  [8+], [I],

  [0EUR], [J],
  [1EUR], [K],
  [2EUR], [L],
  [3EUR], [M],
  [4EUR], [N],
  [5EUR], [O],
  [6EUR], [P],
  [7EUR], [Q],
  [8EUR], [R]
)
]


#align(center)[
  ==== Zoned Decimal Conversion
    #table(
    columns: (auto, auto, auto), align: (left, left, left), stroke: 0.5pt,
    [*Size*], [*Precision*], [*Scale*],

    [S9(5)], [5], [0],
    [S9(7)], [7], [0],
    [S9(5)V9], [6], [1],
    [S9(5)V99], [7], [2],
    [S9(6)V99], [8], [2],
    [S9(6)V999], [9], [3],
    [S9(7)V999], [10], [3],
    [S9(11)V99], [13], [2]
  )
]

#align(center)[
  ==== Conversion Examples
  #table(
    columns: (auto, auto, auto), align: (left, left, left), stroke: 0.5pt,
    [*Size*], [*Zoned Decimal*], [*Converted*],

    [S9(6)V99], [1234567H], [123456.78],
    [S9(6)V9], [1234E], [1234.5],
    [S9(5)], [6789}], [-67890]
  )
]


