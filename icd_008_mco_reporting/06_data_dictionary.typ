== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)
#let wb(s) = s.replace("_", "_\u{200B}")

// MCO Data Dictionaries_May 2025 CSVs: row 0 = title, row 1 = header, row 2+ = data.
// Columns (0-based) are consistent for Variable/Format/Length (0-2);
// Values, Missing/NA, and Description are merged into a single Description cell per row.
// idx-missing/idx-desc give each sheet's column position for Missing/NA and Description (none if absent).

#let render-table(filename, title, idx-missing: 4, idx-desc: 5) = {
  heading(level: 3, title)
  let data = csv(filename)
  let rows = data.slice(2)
  set text(size: 8pt)
  table(
    columns: (1.5fr, 1.5fr, 4fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Column Name*], [*Data Type*], [*Description*],
    ..rows.map(r => {
      let parts = ()
      if idx-desc != none and r.at(idx-desc).trim() != "" {
        parts = parts + ([#wb(r.at(idx-desc))],)
      }
      if r.at(3).trim() != "" {
        parts = parts + ([*Values:*#linebreak()#wb(r.at(3))],)
      }
      if idx-missing != none and r.at(idx-missing).trim() != "" {
        parts = parts + ([*Missing/NA:*#linebreak()#wb(r.at(idx-missing))],)
      }
      let merged = if parts.len() == 0 { [] } else { parts.join(linebreak() + linebreak()) }
      (
        [#wb(r.at(0))],
        [#r.at(1)#if r.at(2).trim() != "" { "(" + r.at(2) + ")" }],
        merged,
      )
    }).flatten(),
  )
}

#render-table("MCO Data Dictionaries_May 2025(PAM MLDF).csv", "PAM MLDF")
#render-table("MCO Data Dictionaries_May 2025(PAM Proc Codes).csv", "PAM Proc Codes")
#render-table("MCO Data Dictionaries_May 2025(PCR APC).csv", "PCR APC", idx-missing: none, idx-desc: none)
#render-table("MCO Data Dictionaries_May 2025(PCR MAAT).csv", "PCR MAAT")
#render-table("MCO Data Dictionaries_May 2025(PCR PCPE).csv", "PCR PCPE", idx-missing: none, idx-desc: none)
#render-table("MCO Data Dictionaries_May 2025(OUS Inpatient).csv", "OUS Inpatient", idx-missing: none, idx-desc: 4)
#render-table("MCO Data Dictionaries_May 2025(OUS Outpatient).csv", "OUS Outpatient", idx-missing: none, idx-desc: none)
#render-table("MCO Data Dictionaries_May 2025(ITR MLDF).csv", "ITR MLDF")
#render-table("MCO Data Dictionaries_May 2025(FAS II).csv", "FAS II")
#render-table("MCO Data Dictionaries_May 2025(FAS III Activities).csv", "FAS III Activities")
#render-table("MCO Data Dictionaries_May 2025(FAS III Trainings).csv", "FAS III Trainings")
#render-table("MCO Data Dictionaries_May 2025(FAS IV).csv", "FAS IV", idx-desc: none)
#render-table("MCO Data Dictionaries_May 2025(FAS V).csv", "FAS V", idx-desc: none)
#render-table("MCO Data Dictionaries_May 2025(FAS VI).csv", "FAS VI")




/*
// Variable, Format, Length / Format Detail, Values, Missing/NA, Description
#let render-full(filename, title) = {
  heading(level: 3, title)
  let data = csv(filename)
  let rows = data.slice(2)
  set text(size: 8pt)
  table(
    columns: (1.5fr, 1fr, 2.5fr, 2fr, 3fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Variable*], [*Format*], [*Values*], [*Missing/NA*], [*Description*],
    ..rows.map(r => (
      [#wb(r.at(0))],
      [#r.at(1)#if r.at(2).trim() != "" { "(" + r.at(2) + ")" }],
      [#wb(r.at(3))],
      [#wb(r.at(4))],
      [#wb(r.at(5))],
    )).flatten(),
  )
}

// Variable, Format, Length / Format Detail, Values, Missing/NA (no Description)
#let render-no-desc(filename, title) = {
  heading(level: 3, title)
  let data = csv(filename)
  let rows = data.slice(2)
  set text(size: 8pt)
  table(
    columns: (1.5fr, 1fr, 3fr, 2.5fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Variable*], [*Format*], [*Values*], [*Missing/NA*],
    ..rows.map(r => (
      [#wb(r.at(0))],
      [#r.at(1)#if r.at(2).trim() != "" { "(" + r.at(2) + ")" }],
      [#wb(r.at(3))],
      [#wb(r.at(4))],
    )).flatten(),
  )
}

// Variable, Format, Length / Format Detail, Values, Description (no Missing/NA)
#let render-desc-only(filename, title) = {
  heading(level: 3, title)
  let data = csv(filename)
  let rows = data.slice(2)
  set text(size: 8pt)
  table(
    columns: (1.5fr, 1fr, 3fr, 3.5fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Variable*], [*Format*], [*Values*], [*Description*],
    ..rows.map(r => (
      [#wb(r.at(0))],
      [#r.at(1)#if r.at(2).trim() != "" { "(" + r.at(2) + ")" }],
      [#wb(r.at(3))],
      [#wb(r.at(4))],
    )).flatten(),
  )
}

// Variable, Format, Length / Format Detail, Values only
#let render-minimal(filename, title) = {
  heading(level: 3, title)
  let data = csv(filename)
  let rows = data.slice(2)
  set text(size: 8pt)
  table(
    columns: (1.5fr, 1fr, 4fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Variable*], [*Format*], [*Values*],
    ..rows.map(r => (
      [#wb(r.at(0))],
      [#r.at(1)#if r.at(2).trim() != "" { "(" + r.at(2) + ")" }],
      [#wb(r.at(3))],
    )).flatten(),
  )
}

#render-full("MCO Data Dictionaries_May 2025(FAS II).csv", "FAS II")
#render-full("MCO Data Dictionaries_May 2025(FAS III Activities).csv", "FAS III Activities")
#render-full("MCO Data Dictionaries_May 2025(FAS III Trainings).csv", "FAS III Trainings")
#render-no-desc("MCO Data Dictionaries_May 2025(FAS IV).csv", "FAS IV")
#render-no-desc("MCO Data Dictionaries_May 2025(FAS V).csv", "FAS V")
#render-full("MCO Data Dictionaries_May 2025(FAS VI).csv", "FAS VI")
#render-full("MCO Data Dictionaries_May 2025(ITR MLDF).csv", "ITR MLDF")
#render-desc-only("MCO Data Dictionaries_May 2025(OUS Inpatient).csv", "OUS Inpatient")
#render-minimal("MCO Data Dictionaries_May 2025(OUS Outpatient).csv", "OUS Outpatient")
#render-full("MCO Data Dictionaries_May 2025(PAM MLDF).csv", "PAM MLDF")
#render-full("MCO Data Dictionaries_May 2025(PAM Proc Codes).csv", "PAM Proc Codes")
#render-minimal("MCO Data Dictionaries_May 2025(PCR APC).csv", "PCR APC")
#render-full("MCO Data Dictionaries_May 2025(PCR MAAT).csv", "PCR MAAT")
#render-minimal("MCO Data Dictionaries_May 2025(PCR PCPE).csv", "PCR PCPE")
*/