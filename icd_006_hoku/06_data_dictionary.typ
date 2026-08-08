== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)
#let wb(s) = s.replace("_", "_\u{200B}")

// HOKU_PE_InReview: 0=Field Name (MMIS), 1=hoku_special_feed Name, 2=Definition, 3=Notes
#let inreview-attrs = csv("HOKU Special Feed Data Dictionary 20221114(HOKU_PE_InReview)(1).csv")
#let inreview-rows = inreview-attrs.slice(1)

=== HOKU PE In Review

#set text(size: 8pt)
#table(
  columns: (2fr, 2fr, 3fr, 2fr),
  align: left,
  stroke: 0.5pt,
  fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
  [*Field Name*], [*HOKU Special Feed Name*], [*Definition*], [*Notes*],
  ..inreview-rows.map(r => (
    [#wb(r.at(0))],
    [#wb(r.at(1))],
    [#r.at(2)],
    [#r.at(3)],
  )).flatten(),
)
