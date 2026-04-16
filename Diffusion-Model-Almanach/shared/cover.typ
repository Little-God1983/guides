// Cover page template — shared between base and advanced editions
#let cover(edition: "Base") = {
  set page(margin: 0pt)

  rect(
    width: 100%,
    height: 100%,
    fill: gradient.linear(rgb("#1a1a2e"), rgb("#16213e"), rgb("#0f3460")),
  )[
    #align(center + horizon)[
      #block(spacing: 2em)[
        #text(font: "Arial", size: 48pt, weight: "bold", fill: white)[
          Diffusion Model\
          Almanac
        ]
        #v(1em)
        #text(font: "Arial", size: 18pt, fill: rgb("#e94560"))[
          A Guide to Image & Video Generation Models
        ]
        #v(0.5em)
        #text(font: "Arial", size: 14pt, fill: rgb("#aaaaaa"))[
          #edition Edition
        ]
        #v(3em)
        #text(font: "Arial", size: 12pt, fill: rgb("#888888"))[
          Models on CivitAI — Explained
        ]
      ]
    ]
  ]
}
