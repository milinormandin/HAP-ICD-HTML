== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)
#let unique(arr) = arr.fold((), (acc, x) => if acc.contains(x) { acc } else { acc + (x,) })
#let wb(s) = s.replace("_", "_\u{200B}")

// Column indices (0-based) — standard across all CSVs except Provider Merge:
// 2 = Table Name, 3 = Column, 4 = Column Alias, 5 = Description, 6 = Data Type
// Provider Merge exception: 5 = "for RT" shifts Description → 6, Data Type → 7

#let desc-lookup = csv("table-descriptions.csv")
#let desc-rows = desc-lookup.slice(1)
#let get-description(tname) = {
  let match = desc-rows.filter(r => r.at(0) == tname)
  if match.len() > 0 and match.first().at(1) != "" { [#match.first().at(1)] }
}

#let render-sheet(filename, title, idx-col: 3, idx-alias: 4, idx-desc: 5, idx-type: 6, idx-start: none, idx-end: none) = {
  heading(level: 3, title)
  let desc = get-description(title)
  if desc != none { desc }
  let data = csv(filename)
  let rows = data.slice(1)
  let table-names = unique(rows.map(r => r.at(2)))
  for tname in table-names [
    ==== #tname
    #let cols = rows.filter(r => r.at(2) == tname)
    #set text(size: 8pt, font: "Times New Roman")
    #if idx-start != none {
      table(
        columns: (2fr, 2fr, 0.5fr, 0.5fr, 1fr, 3fr),
        align: left,
        stroke: 0.5pt,
        fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
        [*Column Name*], [*Business Name*], [*Start*], [*End*], [*Data Type*], [*Description*],
        ..cols.map(r => (
          [#r.at(idx-col)],
          [#r.at(idx-alias)],
          [#r.at(idx-start)],
          [#r.at(idx-end)],
          [#r.at(idx-type)],
          [#wb(r.at(idx-desc))],
        )).flatten(),
      )
    } else {
      table(
        columns: (2fr, 2fr, 1fr, 3fr),
        align: left,
        stroke: 0.5pt,
        fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
        [*Column Name*], [*Column Alias*], [*Data Type*], [*Description*],
        ..cols.map(r => (
          [#r.at(idx-col)],
          [#r.at(idx-alias)],
          [#r.at(idx-type)],
          [#wb(r.at(idx-desc))],
        )).flatten(),
      )
    }
  ]
}

#render-sheet("HAP DG Data Dictionary - HPMMIS - Claims and Encounters(Attributes).csv", "Claims and Encounters")
#render-sheet("HAP DG Data Dictionary - HPMMIS - Code & Reference Merge(Attributes).csv", "Code and Reference")
#render-sheet("HAP DG Data Dictionary - HPMMIS - EVV(Attributes).csv", "EVV")
#render-sheet("HAP DG Data Dictionary - HPMMIS - Provider Merge(Attributes).csv", "Provider", idx-desc: 6, idx-type: 7)
// Provider Merge has an extra "for RT" column at index 5, shifting Description → 6 and Data Type → 7
#render-sheet("HAP DG Data Dictionary - HPMMIS - Recipient Merge (1)(Attributes).csv", "Recipient")
#render-sheet("HAP DG Data Dictionary - TMSIS(Attributes v3.csv", "TMSIS", idx-start: 15, idx-end: 16)
