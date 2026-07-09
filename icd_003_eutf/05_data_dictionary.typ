== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)
#let unique(arr) = arr.fold((), (acc, x) => if acc.contains(x) { acc } else { acc + (x,) })
#let wb(s) = s.replace("_", "_\u{200B}")

#let desc-lookup = csv("table-descriptions.csv")
#let desc-rows = desc-lookup.slice(1)
#let get-description(tname) = {
  let match = desc-rows.filter(r => r.at(0) == tname)
  if match.len() > 0 and match.first().at(1) != "" { [#match.first().at(1)] }
}

// DSG: 0=TABLE_NAME, 1=COLUMN_NAME, 2=NEW_DATA_TYPE, 4=CHARACTER_MAXIMUM_LENGTH, 5=BUSINESS NAME, 6=DESCRIPTION
#let dsg-attrs = csv("DSG_DATA_TYPES_CORRECTED_20260422(Sheet1)(1).csv")
#let dsg-rows = dsg-attrs.slice(1)
#let dsg-tables = unique(dsg-rows.map(r => r.at(0)))

#let render-dsg(tname) = {
  let cols = dsg-rows.filter(r => r.at(0) == tname)
  if cols.len() == 0 { return }
  heading(level: 4, tname)
  let desc = get-description(tname)
  if desc != none { desc }
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (1.5fr, 2fr, 1fr, 3fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column Name*], [*Business Name*], [*Data Type*], [*Description*],
    ..cols.map(r => (
      [#wb(r.at(1))],
      [#r.at(5)],
      [#r.at(2)],
      [#wb(r.at(6))],
    )).flatten(),
  )
}

=== DSG Data

#for tname in dsg-tables {
  render-dsg(tname)
}

// Ariel: 1=TABLE_NAME, 2=COLUMN_NAME, 3=DESCRIPTION, 5=DATA_TYPE, 7=LENGTH
#let ariel-attrs = csv("EUTF Ariel File Layout_20240923(Data Dictionary).csv")
#let ariel-rows = ariel-attrs.slice(1)
#let ariel-tables = unique(ariel-rows.map(r => r.at(1)))

#let render-ariel(tname) = {
  let cols = ariel-rows.filter(r => r.at(1) == tname)
  if cols.len() == 0 { return }
  heading(level: 4, tname)
  let desc = get-description(tname)
  if desc != none { desc }
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (2fr, 3fr, 1fr, 0.75fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column Name*], [*Description*], [*Data Type*], [*Length*],
    ..cols.map(r => (
      [#wb(r.at(2))],
      [#wb(r.at(3))],
      [#r.at(5)],
      [#r.at(7)],
    )).flatten(),
  )
}

=== Ariel Data

#for tname in ariel-tables {
  render-ariel(tname)
}

// V3: 0=Table, 2=Column Name, 3=Description, 4=Data Type, 5=Length
#let v3-attrs = csv("EUTF V3 Data Layout(ICD)(2).csv")
#let v3-rows = v3-attrs.slice(1)
#let v3-tables = unique(v3-rows.map(r => r.at(0)))

#let render-v3(tname) = {
  let cols = v3-rows.filter(r => r.at(0) == tname)
  if cols.len() == 0 { return }
  heading(level: 4, tname)
  let desc = get-description(tname)
  if desc != none { desc }
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (2fr, 3fr, 1fr, 0.75fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column Name*], [*Description*], [*Data Type*], [*Length*],
    ..cols.map(r => (
      [#wb(r.at(2))],
      [#wb(r.at(3))],
      [#r.at(4)],
      [#r.at(5)],
    )).flatten(),
  )
}

=== V3 Data

#for tname in v3-tables {
  render-v3(tname)
}
