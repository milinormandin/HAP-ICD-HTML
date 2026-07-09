#figure(
  table(
    //columns: (3.5cm, 3cm, 3cm, 1fr),
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    stroke: 1pt,
    fill: (x, y) => if y == 0 { rgb("#e8e8e8") } else { white },

    [*Data Source*], [*Load Type*], [*Frequency*], [*Notes*],

    [Actuarial Risk Scores], [Full Snapshot], [Annual], [One file per year; no incrementals.],

    [CMS ResDAC], [Full Snapshot (annual) / Ad hoc: Full or Incremental], [Annual], [Standard annual file; historical re-requests may be full or incremental.],

    [EUTF], [Full Snapshot], [Monthly / Quarterly], [CT/FS/MM/PF = monthly; ME/MC/PC/DC/PV = quarterly.],

    [HILOC], [Full Snapshot], [Weekly (Monday)], [Historical loads also full; no incrementals.],

    [HPMMIS], [Mixed: Replacement / Incremental / Snapshot], [Weekly / Monthly], [Control/Reference/History = Replacement; Recipient/Provider/INFOMGMT = Incremental; Claims/Encounters/EVV = Snapshot.],

    [HOKU], [Full Snapshot], [Weekly (Monday)], ["PE In Review Report" extract; historical available since 2021.],

    [KOLEA], [Incremental], [Daily / Weekly], [Eligibility deltas; historical refresh possible.],

    [MCO Reporting], [], [], [To be confirmed.],

    [Medicare Advantage (PENDING)], [], [], [To be confirmed.],

    [MCO Quality], [Full Snapshot], [Annual (July/August)], [HEDIS + non-HEDIS; each year is separate.],

    [CMS MMA], [Full Snapshot (monthly) / Incremental (daily)], [Monthly / Daily], [Monthly = all duals; daily = changes only. HAP currently receives monthly snapshot.],

    [T-MSIS], [Full Snapshot], [Monthly], [CMS extracts per program period.],
  ),
  caption: [Data Source Overview],
)