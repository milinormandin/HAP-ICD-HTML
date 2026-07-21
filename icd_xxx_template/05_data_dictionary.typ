== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)

#let unique(arr) = arr.fold((), (acc, x) => if acc.contains(x) { acc } else { acc + (x,) })

// ============================================================
// INSTRUCTIONS:
// 1. Place your Attributes CSV in this folder
// 2. Update CSV_FILE and the column indices below
//    (open your CSV and count columns from 0)
// 3. By default all tables render automatically via the for
//    loop at the bottom. To control order or add notes,
//    replace the for loop with explicit render-table() calls:
//    #render-table("TABLE_NAME", note: [Note above this table])
// ============================================================

// Column indices (0-based) — update these to match your CSV:
#let CSV_FILE   = "[YOUR_ATTRIBUTES_FILE].csv"
#let IDX_TABLE  = 0  // column that groups rows into tables
#let IDX_COLUMN = 1  // column name
#let IDX_TYPE   = 2  // data type
#let IDX_DESC   = 3  // description

#let attrs = csv(CSV_FILE)
#let attr-rows = attrs.slice(1)
#let table-names = unique(attr-rows.map(r => r.at(IDX_TABLE)))

#let render-table(tname, note: none) = {
  let cols = attr-rows.filter(r => r.at(IDX_TABLE) == tname)
  if cols.len() == 0 { return }
  heading(level: 3, tname)
  if note != none { note }
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (2fr, 1fr, 3fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column Name*], [*Data Type*], [*Description*],
    ..cols.map(r => (
      [#r.at(IDX_COLUMN)],
      [#r.at(IDX_TYPE)],
      [#r.at(IDX_DESC)],
    )).flatten(),
  )
}

#for tname in table-names {
  render-table(tname)
}
