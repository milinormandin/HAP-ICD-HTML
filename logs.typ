#heading(numbering: none)[Revision History]

#let logs = csv("merge-log.csv")

#table(
  columns: (auto, auto, auto, auto),
  table.header(
    [*Date*], [*Commit*], [*Message*], [*Author*]
  ),
  ..logs.slice(1).map(row => (
    row.at(0),
    raw(row.at(1).slice(0, 7)),  // short commit SHA
    row.at(2),
    row.at(3),
  )).flatten()
)