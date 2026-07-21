== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)
#let unique(arr) = arr.fold((), (acc, x) => if acc.contains(x) { acc } else { acc + (x,) })
#let wb(s) = s.replace("_", "_\u{200B}")

// ── Table Descriptions ──────────────────────────────────────────────────
// Row 0 = headers, Row 1+ = data
// Indices: 0=File Segment Name, 1=File Segment Definition, 2=File Name, 3=Definition (File Definition)

#let desc-lookup = csv("table-descriptions.csv")
#let desc-rows = desc-lookup.slice(1)
#let get-description(tname) = {
  let match = desc-rows.filter(r => r.at(0) == tname)
  if match.len() > 0 and match.first().at(1) != "" { [#match.first().at(1)] }
}

#let get-file-description(fname) = {
  let match = desc-rows.filter(r => r.at(2) == fname)
  if match.len() > 0 and match.first().at(3) != "" { [#match.first().at(3)] }
}

// ── Data Element Definitions ──────────────────────────────────────────────────
// Row 0 = headers, Row 1+ = data
// Indices: 14=file_name, 0=DE Number, 2=Data Element,
//          3=Data Element Text, 5=Definition, 8=File Segment Name

=== Data Element Definitions

#let dd-raw = csv("T-MSIS_v4.0.3.2_DataDictionary_Transformed.csv")
#let dd-rows = dd-raw.slice(1)
#let dd-files = unique(desc-rows.map(r => r.at(2)))
// #let dd-tables = unique(dd-rows.map(r => r.at(8)))

#let render-grouped-data-dictionary(tname) = {
  let cols = dd-rows.filter(r => r.at(8) == tname)
  if cols.len() == 0 { return }
  heading(level: 5, tname)
  let desc = get-description(tname)
  if desc != none { desc }
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (0.75fr, 2fr, 4fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column ID*], [*Column Name*], [*Definition*],
    ..cols.map(r => (
      [#r.at(0)],
      [#r.at(2)],
      [#wb(r.at(5))],
    )).flatten(),
  )
}

#for file in dd-files {

  // Print file name once
  heading(level: 4, file)
  let desc = get-file-description(file)
  if desc != none { desc }

  // Get rows for this file
  let file-rows = desc-rows.filter(r => r.at(2) == file)

  // Extract file segment column from rows that match file group
  let file-segments = unique(file-rows.map(r => r.at(0)))

  // Group file segments together and output tablee
  for seg in file-segments {
    render-grouped-data-dictionary(seg)
  }
}

// #for tname in dd-tables {
//   render-grouped-data-dictionary(tname)
// }

// ── Record Layouts ────────────────────────────────────────────────────────────
// Row 0 = headers, Row 1+ = data
// Indices: 0=DE_NO, 1=DATA_ELEMENT_NAME, 2=SIZE,
//          3=START POSITION, 4=STOP POSITION, 
//          7=File Segment Number, 8=File Segment Name

=== Record Layouts (v3.0)

#let rl-raw = csv("4 - T-MSIS Record Layouts v3.0_transformed.csv")
#let rl-rows = rl-raw.slice(2)
#let rl-tables = unique(rl-rows.map(r => r.at(8)))
#let rl-tables-set = (
  ..rl-tables.map(v => (v, true))
).to-dict()
#let rl-files = unique(desc-rows.map(r => r.at(2)))

#let render-grouped-record-layout(tname) = {
  let cols = rl-rows.filter(r => r.at(8) == tname)
  if cols.len() == 0 { return }
  heading(level: 5, tname)
  let desc = get-description(tname)
  if desc != none { desc }
  set text(size: 7pt, font: "Times New Roman")
  table(
    columns: (0.75fr, 2fr, 1fr, 0.5fr, 0.5fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column ID*], [*Column Name*], [*Size*], [*Start*], [*Stop*],
    ..cols.map(r => (
      [#r.at(0)],
      [#r.at(1)],
      [#r.at(2)],
      [#r.at(3)],
      [#r.at(4)],
    )).flatten(),
  )
}

#for file in rl-files {

  // Get rows for this file
  let file-rows = desc-rows.filter(r => r.at(2) == file)

  // Extract file segment column from rows that match file group
  let file-segments = unique(file-rows.map(r => r.at(0)))

  // Check if at least one file segment is present in layout file
    if file-segments.any(seg => rl-tables-set.at(seg, default: false)) {
      // Print file name once
      heading(level: 4, file)
      let desc = get-file-description(file)
      if desc != none { desc }

      // Group file segments together and output tablee
      for seg in file-segments {
        render-grouped-record-layout(seg)
      }
  }
}

// ── Record Layouts (v4.0.0) ───────────────────────────────────────────────────
// Row 0 = headers, Row 1+ = data
// Indices: 3=File Segment Name, 0=DE Number, 2= Data Element,
//          9=Size, 10=Start, 11=Stop

=== Record Layouts (v4.0.0)

#let rl4-raw = csv("tmsis_v4_layout_transformed.csv")
#let rl4-rows = rl4-raw.slice(1)
#let rl4-tables = unique(rl4-rows.map(r => r.at(3)))
#let rl4-tables-set = (
  ..rl4-tables.map(v => (v, true))
).to-dict()
#let rl4-files = unique(desc-rows.map(r => r.at(2)))

#let render-grouped-record-layout-v4(seg-name) = {
  let cols = rl4-rows.filter(r => r.at(3) == seg-name)
  if cols.len() == 0 { return }
  heading(level: 5, seg-name)
  let desc = get-description(seg-name)
  if desc != none { desc }
  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (1fr, 2fr, 1fr, 0.5fr, 0.5fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column ID*], [*Column Name*], [*Size*], [*Start*], [*Stop*],
    ..cols.map(r => (
      [#r.at(5)],
      [#r.at(6)],
      [#r.at(8)],
      [#r.at(9)],
      [#r.at(10)],
    )).flatten(),
  )
}

#for file in rl4-files {

  // Get rows for this file
  let file-rows = desc-rows.filter(r => r.at(2) == file)

  // Extract file segment column from rows that match file group
  let file-segments = unique(file-rows.map(r => r.at(0)))

  // Check if at least one file segment is present in layout file
    if file-segments.any(seg => rl4-tables-set.at(seg, default: false)) {
      // Print file name once
      heading(level: 4, file)
      let desc = get-file-description(file)
      if desc != none { desc }

      // Group file segments together and output tablee
      for seg in file-segments {
        render-grouped-record-layout-v4(seg)
      }
  }
}
