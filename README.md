# HAP ICD Master - Typst

Typst port of the Health Analytics Program (HAP) Interface Control Documents (ICDs).

## Structure

Each ICD is organized as its own folder containing 5 files:

```
icd_00X_[source_name]/
├── 00_data_source_title_page.typ   # Title page
├── 01_interface_overview.typ       # Interface overview & data transfer details
├── 02_file_details.typ             # Detailed data description
├── 03_security_privacy.typ         # Security & privacy constraints
├── 04_file_layout.typ              # File format specification
└── 05_data_dictionary.typ          # Column-level data dictionary
```

## Data Sources

| ICD | Source |
|-----|--------|
| ICD #001 | Actuarial Risk Scores |
| ICD #002 | CMS ResDAC |
| ICD #003 | EUTF |
| ICD #004 | HILOC |
| ICD #005 | HPMMIS |
| ICD #006 | HOKU |
| ICD #007 | KOLEA |
| ICD #008 | MCO Reporting |
| ICD #009 | WIP Medicare Advantage |
| ICD #010 | MCO Quality |
| ICD #011 | CMS MMA |
| ICD #012 | T-MSIS |

## Adding a New ICD

1. Copy the `icd_xxx_template` folder and rename it (e.g. `icd_013_new_source`)
2. Rename `main_000.typ` to match (e.g. `main_013.typ`)
3. Replace all `[BRACKET]` placeholders across the files
4. Drop in the Attributes CSV and update the index variables in `05_data_dictionary.typ`
5. Add `#include "icd_013_new_source/main_013.typ"` to `main.typ`

## VS Code Extensions

| Extension | Purpose |
| --------- | ------- |
| [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) | Typst language support, live preview, syntax highlighting |
| [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) | Color-coded CSV viewing and editing |
| [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph) | Visual git history and branch management |

## Dependencies

### Typst

Official website: [typst.app](https://typst.app)

**Windows (winget):**

```bash
winget install --id Typst.Typst
```

**Windows (Chocolatey):**

```powershell
choco install typst
```

**Windows (PowerShell — manual install):**

```powershell
Invoke-WebRequest -Uri https://github.com/typst/typst/releases/latest/download/typst-x86_64-pc-windows-msvc.zip -OutFile typst.zip
Expand-Archive typst.zip -DestinationPath $env:LOCALAPPDATA\typst
$env:PATH += ";$env:LOCALAPPDATA\typst"
```

**macOS (Homebrew):**

```bash
brew install typst
```

**Linux:**

```bash
curl -fsSL https://typst.community/typst-install/install.sh | sh
```

Or download directly from the [Typst releases page](https://github.com/typst/typst/releases).

Verify the installation:

```bash
typst --version
```

## Compiling

Compile the full document from the root:

```bash
typst compile main.typ
```

## CSV Encoding

CSVs exported from Excel are often saved in **Windows-1252** encoding. Typst requires **UTF-8** and will throw an error if it encounters a Windows-1252 file.

If you see an error like `failed to decode file` or unexpected characters in the output after adding a new CSV, re-encode the file using PowerShell before compiling:

```powershell
$file = "your-file.csv"
$content = Get-Content $file -Encoding ([System.Text.Encoding]::GetEncoding(1252))
Set-Content $file -Value $content -Encoding UTF8
```

To re-encode all CSVs in a folder at once:

```powershell
Get-ChildItem "icd_00X_folder" -Filter "*.csv" | ForEach-Object {
  $content = Get-Content $_.FullName -Encoding ([System.Text.Encoding]::GetEncoding(1252))
  Set-Content $_.FullName -Value $content -Encoding UTF8
}
```

Run this from the repo root, replacing `icd_00X_folder` with the relevant ICD folder name. This is a one-time step — once re-encoded the file does not need to be converted again.
