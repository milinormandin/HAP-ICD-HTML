#let project(title: "", author: "", date: "", body) = {
  // 1. Document Metadata & Page Setup
  set document(author: author, title: title)
  set text(font: "Times New Roman", size: 11pt)

  // 2. All pages — kapa strips pinned to physical page edges via background
  set page(
    paper: "us-letter",
    numbering: "1",
    number-align: center,
    margin: (x: 1in, top: 1.25in, bottom: 1.25in),
    background: {
      place(top + left,
        image("GRAPHICS (TRANSPARENT)/kapa strips - Copy.png", width: 8.5in)
      )
      place(bottom + left,
        image("GRAPHICS (TRANSPARENT)/kapa strips - Copy.png", width: 8.5in)
      )
    },
  )

  // 3. Title Page
  align(center + horizon)[
    #image("GRAPHICS (TRANSPARENT)/new-seal-hawaii (1).png", height: 6cm, fit: "contain")
    #v(1.5em)
    #text(2.5em, weight: "bold", title)
    #v(1.5em)
    #text(1.3em, author)
    #v(1.2em)
    #text(1.1em, date)
  ]

  pagebreak()

  // 4. Table of Contents
  align(center)[
    #text(1.5em, weight: "bold")[Table of Contents]
  ]

  v(1em)

  outline(
    title: none,
    indent: auto,
    depth: 3
  )

  pagebreak()

  // 5. Main Body Formatting
  set heading(numbering: "1.1.1.1")
  set par(justify: true, leading: 0.65em)
  show heading: it => {
    v(1em)
    it
    v(0.5em)
  }

  // Display the actual content
  body
}
