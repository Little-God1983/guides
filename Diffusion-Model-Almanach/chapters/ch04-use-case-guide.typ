#import "../shared/styles.typ": *

= Use Case Guide

You know the models. Now — which one do you actually pick? This chapter gives you straight answers.

== Quick Recommendation Table

#figure(
  table(
    columns: (1fr, 1fr, auto),
    inset: 10pt,
    align: (left, left, center),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[I want to...],
    text(fill: white, weight: "bold")[Use this],
    text(fill: white, weight: "bold")[Prompting],
    [Generate anything, fast and good], [*ZImage Turbo*], [Natural],
    [Create anime / character art], [Pony, Illustrious, or Noob AI], [Booru tags],
    [Generate photorealistic images], [FLUX Dev or ZImage Turbo], [Natural],
    [Quick iterations / prototyping], [FLUX Schnell or ZImage Turbo], [Natural],
    [Render text inside images], [FLUX Dev], [Natural],
    [Use tons of community LoRAs], [SD 1.5 or SDXL], [Booru tags],
    [Generate NSFW content], [Pony, Illustrious, or Noob AI], [Booru tags],
    [Edit an existing image with text], [Flux Kontext or Qwen], [Natural],
    [Run on low VRAM (4–6 GB)], [SD 1.5 or Flux 2 Klein], [Varies],
    [Try the latest architecture], [SD 3.5 Large or HiDream], [Natural],
  ),
  caption: [What to use for what],
)

== Best Overall: ZImage Turbo

If you want one model for general-purpose image generation, ZImage Turbo is the current recommendation. It handles a wide range of styles, produces high-quality output, and does it fast thanks to its turbo distillation.

It won't beat a specialized fine-tune in its niche — Pony will outperform it for anime characters, FLUX Dev will handle text rendering better — but it does *everything reasonably well*. That versatility makes it the best starting point.

== Best for NSFW: The Big Three

*Pony Diffusion*, *Illustrious*, and *Noob AI* dominate this space. All three are SDXL-based, use booru-style prompting, and have large libraries of character LoRAs on CivitAI.

Which one to pick comes down to taste:

#figure(
  table(
    columns: (auto, 1fr),
    inset: 10pt,
    align: (left, left),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[Model],
    text(fill: white, weight: "bold")[Flavor],
    [*Pony*], [Most established ecosystem. Largest LoRA library. Slightly stylized aesthetic.],
    [*Illustrious*], [Clean illustration style. Strong at detailed character art.],
    [*Noob AI*], [Newest of the three. Building on Illustrious' strengths. Growing fast.],
  ),
  caption: [The NSFW trio compared],
)

All three share SDXL-family LoRA compatibility, so many community resources work across them.

== Best for Editing Existing Images

If you already have an image and want to modify it — change the background, alter clothing, adjust colors — you want an *instruction model*:

- *Flux Kontext* — High-quality edits, good at style transfer
- *Qwen Image Edit* — Intuitive, handles natural language instructions well

These are not replacements for generation models. They are complementary tools. A typical workflow: generate with ZImage Turbo or Flux Dev, then refine with Flux Kontext.

== The "I Have Limited Hardware" Path

Not everyone has a top-tier GPU. Here's what to prioritize by VRAM:

#figure(
  table(
    columns: (auto, 1fr),
    inset: 10pt,
    align: (left, left),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[Your VRAM],
    text(fill: white, weight: "bold")[Best options],
    [*4 GB*], [SD 1.5 — the only reliable choice at this tier],
    [*6 GB*], [SD 1.5, SDXL (tight), Flux 2 Klein],
    [*8 GB*], [SDXL, Pony, Illustrious, Noob AI, ZImage Turbo],
    [*12 GB+*], [Everything — including FLUX Dev at full quality],
  ),
  caption: [Model recommendations by GPU VRAM],
)

#tip-box(title: "Don't let VRAM stop you")[
  Quantized model versions (smaller, compressed weights) can run heavier models on less VRAM with a small quality trade-off. Check CivitAI for "fp8" or "q4" versions of models that are too large for your card.
]
