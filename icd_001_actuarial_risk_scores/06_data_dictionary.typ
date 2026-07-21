== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)
#let wb(s) = s.replace("_", "_\u{200B}")

#let attrs = csv("HAP DG Data Dictionary - Milliman Actuarial(Attributes).csv")
#let attr-rows = attrs.slice(1)

#let desc-lookup = csv("table-descriptions.csv")
#let desc-rows = desc-lookup.slice(1)
#let get-description(tname) = {
  let match = desc-rows.filter(r => r.at(0) == tname)
  if match.len() > 0 and match.first().at(1) != "" { [#match.first().at(1)] }
}

#let render-table(layout-name) = {
  let cols = attr-rows.filter(r => r.at(2) == layout-name)
  if cols.len() == 0 { return }

  heading(level: 3, layout-name)

  let desc = get-description(layout-name)
  if desc != none { desc }

  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (2fr,1fr, 3fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column Name*], [*Data Type*], [*Description*],
    ..cols.map(r => (
      [#r.at(3)],
  
      [#r.at(6)],
      [#wb(r.at(5))],
    )).flatten(),
  )
}

#render-table("2017 Data Layout File")
#render-table("2018 - 2020 Data Layout File")
#render-table("2021 Data Layout File")
