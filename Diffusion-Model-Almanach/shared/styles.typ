// Shared styles for both editions

#let almanac-styles(body) = {
  set document(author: "DiffusionNexus")
  set text(font: "Arial", size: 11pt, lang: "en")
  set par(justify: true, leading: 0.8em)
  set heading(numbering: "1.1")

  // Heading styles
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(2em)
    text(size: 24pt, weight: "bold", fill: rgb("#0f3460"))[#it]
    v(1em)
  }

  show heading.where(level: 2): it => {
    v(1.5em)
    text(size: 16pt, weight: "bold", fill: rgb("#16213e"))[#it]
    v(0.5em)
  }

  show heading.where(level: 3): it => {
    v(1em)
    text(size: 13pt, weight: "bold", fill: rgb("#e94560"))[#it]
    v(0.3em)
  }

  // Page setup (after cover)
  set page(
    paper: "a4",
    margin: (top: 3cm, bottom: 3cm, left: 2.5cm, right: 2.5cm),
    header: context {
      if counter(page).get().first() > 1 {
        align(right)[
          #text(size: 9pt, fill: gray)[Diffusion Model Almanac]
        ]
        line(length: 100%, stroke: 0.5pt + gray)
      }
    },
    footer: context {
      align(center)[
        #text(size: 9pt, fill: gray)[#counter(page).display()]
      ]
    },
  )

  body
}

// Callout boxes
#let info-box(title: "Info", body) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: rgb("#e8f4f8"),
    stroke: 1pt + rgb("#0f3460"),
  )[
    #text(weight: "bold", fill: rgb("#0f3460"))[#title] \
    #body
  ]
}

#let tip-box(title: "Tip", body) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: rgb("#f0f8e8"),
    stroke: 1pt + rgb("#2d6a30"),
  )[
    #text(weight: "bold", fill: rgb("#2d6a30"))[#title] \
    #body
  ]
}

#let warning-box(title: "Warning", body) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: rgb("#fff3e0"),
    stroke: 1pt + rgb("#e65100"),
  )[
    #text(weight: "bold", fill: rgb("#e65100"))[#title] \
    #body
  ]
}

// Comparison table helper
#let vs-table(headers, ..rows) = {
  table(
    columns: headers.len(),
    inset: 10pt,
    align: left,
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    ..headers.map(h => text(weight: "bold", fill: white)[#h]),
    ..rows.pos().flatten().map(c => [#c]),
  )
}
