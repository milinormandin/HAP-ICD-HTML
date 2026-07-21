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

// ── 2020: flat table — Field Name(0), Field Description(1), Other Notes(5) ───

#let render-flat(filename, title) = {
  heading(level: 3, title)
  let desc = get-description(title)
  if desc != none { desc }
  let data = csv(filename)
  let rows = data.slice(1)
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (2fr, 3fr, 3fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Field Name*], [*Field Description*], [*Other Notes*],
    ..rows.map(r => (
      [#r.at(0)],
      [#wb(r.at(1))],
      [#wb(r.at(5))],
    )).flatten(),
  )
}

#render-flat("Combined HI HEDIS MY 2020 PLD Data Dictionary (NEW)(PLD Data Dictionary).csv", "Combined HI HEDIS MY 2020")

// ── 2021/2022/2023: two-level grouping ────────────────────────────────────────
// 2021 indices: group=0, name=1, length=7, desc=4, notes=8
// SAS  indices: group=1, name=4, length=6, desc=8, notes=5

#let render-grouped(filename, title, idx-group: 0, idx-name: 1, idx-length: 7, idx-desc: 4, idx-notes: 8) = {
  heading(level: 3, title)
  let desc = get-description(title)
  if desc != none { desc }
  let data = csv(filename)
  let rows = data.slice(1)
  let groups = unique(rows.map(r => r.at(idx-group)))
  for g in groups [
    ==== #g
    #let cols = rows.filter(r => r.at(idx-group) == g)
    #set text(size: 8pt, font: "Times New Roman")
    #table(
      columns: (2fr, 0.75fr, 3fr, 1.5fr),
      align: left,
      stroke: 0.5pt,
      fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
      [*Field Name*], [*Field Length*], [*Field Description*], [*Other Notes*],
      ..cols.map(r => (
        [#r.at(idx-name)],
        [#r.at(idx-length)],
        [#wb(r.at(idx-desc))],
        [#wb(r.at(idx-notes))],
      )).flatten(),
    )
  ]
}

#render-grouped("HI HEDIS MY 2021_CCS_PLD File Data Dictionary(HI PLD Data Dictionary CCS).csv", "HI HEDIS MY 2021 - CCS PLD")
#render-grouped("HI HEDIS MY 2021_QI_PLD File Data Dictionary(HI PLD Data Dictionary QI).csv", "HI HEDIS MY 2021 - QI PLD")

// SAS files use different column indices
#render-grouped("HI_CCS Data Dictionary_HEDIS MY2022(Table).csv", "HI HEDIS MY 2022 - CCS PLD", idx-group: 1, idx-name: 4, idx-length: 6, idx-desc: 8, idx-notes: 5)
#render-grouped("HI_QI PLD Data Dictionary_HEDIS MY2022(Table).csv", "HI HEDIS MY 2022 - QI PLD", idx-group: 1, idx-name: 4, idx-length: 6, idx-desc: 8, idx-notes: 5)
#render-grouped("HI_CCS Data Dictionary_HEDIS MY2023(Table).csv", "HI HEDIS MY 2023 - CCS PLD", idx-group: 1, idx-name: 4, idx-length: 6, idx-desc: 8, idx-notes: 5)
#render-grouped("HI_QI PLD Data Dictionary_HEDIS MY2023(Table).csv", "HI HEDIS MY 2023 - QI PLD", idx-group: 1, idx-name: 4, idx-length: 6, idx-desc: 8, idx-notes: 5)
