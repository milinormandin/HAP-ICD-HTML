#import "template.typ": project

// 1. Apply the template and set Title Page details
#show: project.with(
  title: "Health Analytics Program (HAP)",
  author: "Data Stewardship Team",
  date: datetime.today().display("[month repr:long] [year]")
)

// 2. Include the introductory overview
//#include "00_data_source_overview.typ" (once all the 00X are done)

// 3. Include all 12 generated data sources
// By including the 'main_xxx.typ' file from each folder, 
// it automatically pulls in the 4 subfiles nested inside of them.
#include "logs.typ"
#pagebreak()
#include "icd_000_data_source_overview/main_000.typ"
#pagebreak()
#include "icd_001_actuarial_risk_scores/main_001.typ"
#pagebreak()
#include "icd_002_cms_resdac/main_002.typ"
#pagebreak()
#include "icd_003_eutf/main_003.typ"
#pagebreak()
#include "icd_004_hiloc/main_004.typ"
#pagebreak()
#include "icd_005_hpmmis/main_005.typ"
#pagebreak()
//#include "icd_006_hoku/main_006.typ" (Provider Extract Inventory is for the future HOKU feed, not yet in place)
//#pagebreak()
#include "icd_007_kolea/main_007.typ"
#pagebreak()
#include "icd_008_mco_reporting/main_008.typ"
 #pagebreak()
//#include "icd_009_wip_medicare_advantage/main_009.typ"
 //#pagebreak()
#include "icd_010_mco_quality/main_010.typ"
 #pagebreak()
#include "icd_011_cms_mma/main_011.typ"
 #pagebreak()
#include "icd_012_t_msis/main_012.typ"
#pagebreak()

