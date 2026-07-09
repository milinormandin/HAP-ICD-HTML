== Data Dictionary

#let header-fill = rgb("#BDD7EE")
#let row-alt-fill = luma(245)

#let desc-lookup = csv("table-descriptions.csv")
#let desc-rows = desc-lookup.slice(1)
#let get-description(tname) = {
  let match = desc-rows.filter(r => r.at(0) == tname)
  if match.len() > 0 and match.first().at(1) != "" { [#match.first().at(1)] }
}

#let render-sheet(filename, sheet-name) = {
  let data = csv(filename)
  let rows = data.slice(1)

  [=== #sheet-name]

  let desc = get-description(sheet-name)
  if desc != none { desc }

  set text(size: 8pt, font: "Times New Roman")
  table(
    columns: (2fr, 2fr, 1fr, 0.75fr),//, 3fr),
    align: left,
    stroke: 0.5pt,
    fill: (_, y) => if y == 0 { header-fill } else if calc.odd(y) { row-alt-fill } else { white },
    [*Data Element*], [*Column Name*], [*Data Type*], [*Length*], //[*Note*],
    ..rows.map(r => (
      [#r.at(0)],
      [#r.at(1)],
      [#r.at(2)],
      [#r.at(3)],
      // [#r.at(2)],
    )).flatten(),
  )
}

#render-sheet("Provider_Extract_Inventory(App Review History).csv", "App Review History")
#render-sheet("Provider_Extract_Inventory(Auth Rep).csv", "Auth Rep")
#render-sheet("Provider_Extract_Inventory(Basic Info).csv", "Basic Info")
#render-sheet("Provider_Extract_Inventory(Billing Providers).csv", "Billing Providers")
#render-sheet("Provider_Extract_Inventory(Checklist).csv", "Checklist")
#render-sheet("Provider_Extract_Inventory(Correspondence Address).csv", "Correspondence Address")
#render-sheet("Provider_Extract_Inventory(COS).csv", "COS")
#render-sheet("Provider_Extract_Inventory(Employee Detail).csv", "Employee Detail")
#render-sheet("Provider_Extract_Inventory(Employee Spreadsheet).csv", "Employee Spreadsheet")
#render-sheet("Provider_Extract_Inventory(Fee Payment).csv", "Fee Payment")
#render-sheet("Provider_Extract_Inventory(Identifier).csv", "Identifier")
#render-sheet("Provider_Extract_Inventory(Indicator).csv", "Indicator")
#render-sheet("Provider_Extract_Inventory(License).csv", "License")
#render-sheet("Provider_Extract_Inventory(Location Address).csv", "Location Address")
#render-sheet("Provider_Extract_Inventory(Location).csv", "Location")
#render-sheet("Provider_Extract_Inventory(Mod Request History).csv", "Mod Request History")
#render-sheet("Provider_Extract_Inventory(Owner).csv", "Owner")
#render-sheet("Provider_Extract_Inventory(Pay-To Address).csv", "Pay-To Address")
#render-sheet("Provider_Extract_Inventory(Population Served (APEP)).csv", "Population Served (APEP)")
#render-sheet("Provider_Extract_Inventory(PT-SP).csv", "PT-SP")
#render-sheet("Provider_Extract_Inventory(Revalidation).csv", "Revalidation")
#render-sheet("Provider_Extract_Inventory(Taxonomy).csv", "Taxonomy")
#render-sheet("Provider_Extract_Inventory(TIN Affiliation).csv", "TIN Affiliation")
#render-sheet("Provider_Extract_Inventory(TIN Indicator).csv", "TIN Indicator")
#render-sheet("Provider_Extract_Inventory(Upload).csv", "Upload")
#render-sheet("Provider_Extract_Inventory(User Domain).csv", "User Domain")
