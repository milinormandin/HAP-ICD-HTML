== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)
#let unique(arr) = arr.fold((), (acc, x) => if acc.contains(x) { acc } else { acc + (x,) })
#let wb(s) = s.replace("_", "_\u{200B}")

// Column indices (0-based):
// 1 = TABLE_NAME, 2 = COLUMN_NAME, 3 = ADDED_DESCRIPTION
// 4 = DATA_TYPE, 7 = DATA_LENGTH

#let attrs = csv("KOLEA - Data Dictionary_v4(Table Metadata).csv")
#let attr-rows = attrs.slice(1)
#let table-names = unique(attr-rows.map(r => r.at(1)))

#let desc-lookup = csv("table-descriptions.csv")
#let desc-rows = desc-lookup.slice(1)
#let get-description(tname) = {
  let match = desc-rows.filter(r => r.at(0) == tname)
  if match.len() > 0 and match.first().at(1) != "" { [#match.first().at(1)] }
}

#let render-table(tname) = {
  let cols = attr-rows.filter(r => r.at(1) == tname)
  if cols.len() == 0 { return }
  heading(level: 3, tname)
  let desc = get-description(tname)
  if desc != none { desc }
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (3fr, 1fr, 0.75fr, 2.5fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column Name*], [*Data Type*], [*Data Length*], [*Description*],
    ..cols.map(r => (
      [#wb(r.at(2))],
      [#r.at(4)],
      [#r.at(7)],
      [#wb(r.at(3))],
    )).flatten(),
  )
}

#for tname in table-names {
  render-table(tname)
}
