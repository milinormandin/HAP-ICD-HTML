== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)
#let unique(arr) = arr.fold((), (acc, x) => if acc.contains(x) { acc } else { acc + (x,) })
#let wb(s) = s.replace("_", "_\u{200B}")

// Column indices (0-based):
// 2 = Table Name, 3 = Column, 5 = Column Comment (Description)
// 6 = Data Type, 15 = Start Position, 16 = End Position, 22 = Column Order

#let attrs = csv("HAP DG Data Dictionary_CMSMMA(Attributes).csv")
#let attr-rows = attrs.slice(1)
#let table-names = unique(attr-rows.map(r => r.at(2)))

#let desc-lookup = csv("table-descriptions.csv")
#let desc-rows = desc-lookup.slice(1)
#let get-description(tname) = {
  let match = desc-rows.filter(r => r.at(0) == tname)
  if match.len() > 0 and match.first().at(1) != "" { [#match.first().at(1)] }
}

#let render-table(tname) = {
  let cols = attr-rows.filter(r => r.at(2) == tname)
  if cols.len() == 0 { return }
  heading(level: 3, tname)
  let desc = get-description(tname)
  if desc != none { desc }
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (2fr, 0.75fr, 0.75fr, 1fr, 3fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column Name*], [*Start Position*], [*End Position*], [*Data Type*], [*Description*],
    ..cols.map(r => (
      [#wb(r.at(3))],
      [#r.at(15)],
      [#r.at(16)],
      [#r.at(6)],
      [#wb(r.at(5))],
    )).flatten(),
  )
}

#for tname in table-names {
  render-table(tname)
}
