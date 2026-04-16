#import "../shared/styles.typ": *

= The Model Landscape

This is the heart of the almanac. Below you'll find every major model family available on CivitAI, what it does well, and where it fits in the bigger picture.

Models are grouped by *family* — a lineage of architectures that share compatibility. A LoRA trained for one model in a family often works across that family. Across families, almost nothing is cross-compatible.

== The Stable Diffusion Lineage

The original open-source diffusion model family, created by Stability AI. This is where it all started.

=== SD 1.5

The workhorse that launched a community. Released in 2022, SD 1.5 is still the most heavily fine-tuned model in existence. Thousands of checkpoints and LoRAs exist for it on CivitAI.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [512 × 512 native],
    [*Speed*], [Fast — runs on 4 GB+ VRAM],
    [*Prompting*], [Booru-style tags work best],
    [*Strengths*], [Massive ecosystem, lightweight, anime/art styles],
    [*Weaknesses*], [Low native resolution, hands/anatomy issues, aging architecture],
  ),
  caption: [SD 1.5 at a glance],
)

SD 1.5 is showing its age, but its ecosystem is unmatched. If you find a very specific LoRA for a niche style or character — chances are it was trained on SD 1.5.

=== SD 2.1

Stability AI's follow-up that was supposed to replace 1.5. It didn't. SD 2.1 changed the text encoder, which broke compatibility with all existing SD 1.5 LoRAs and embeddings. The community largely rejected it.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [512 × 512 / 768 × 768],
    [*Speed*], [Moderate],
    [*Prompting*], [Natural language — but less intuitive than later models],
    [*Strengths*], [Better at landscapes and architecture than 1.5],
    [*Weaknesses*], [Tiny ecosystem, incompatible with SD 1.5 resources],
  ),
  caption: [SD 2.1 at a glance],
)

You will rarely encounter SD 2.1 in the wild today. It exists mostly as a historical footnote.

=== SDXL

The real successor to SD 1.5. SDXL doubled the resolution, improved prompt understanding, and became the community standard for a full generation of models.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [1024 × 1024 native],
    [*Speed*], [Moderate — needs 6 GB+ VRAM],
    [*Prompting*], [Booru-style tags still work, natural language improving],
    [*Strengths*], [Great detail, strong ecosystem, good all-rounder],
    [*Weaknesses*], [Heavier than 1.5, still struggles with text in images],
  ),
  caption: [SDXL at a glance],
)

SDXL is the sweet spot for many users: good quality, reasonable hardware requirements, and a healthy library of LoRAs and fine-tunes.

=== SD 3.5 Large

Stability AI's latest architecture. A significant leap in prompt understanding and image coherence, but the ecosystem is still young.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [1024 × 1024+],
    [*Speed*], [Slower — needs 8 GB+ VRAM],
    [*Prompting*], [Natural language],
    [*Strengths*], [Better text rendering, improved anatomy, modern architecture],
    [*Weaknesses*], [Small ecosystem, fewer community fine-tunes],
  ),
  caption: [SD 3.5 Large at a glance],
)

SD 3.5 is promising but hasn't replaced SDXL in community adoption yet. Keep an eye on it.

== The Community Forks

These models are built *on top of* Stable Diffusion architectures but fine-tuned by independent teams for specific purposes.

=== Pony Diffusion

Built on SDXL, Pony is a community-driven fine-tune optimized for character art and NSFW content. It has developed its own sub-ecosystem of LoRAs and styles on CivitAI.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Base*], [SDXL architecture],
    [*Resolution*], [1024 × 1024],
    [*Prompting*], [Booru-style tags — heavily tag-driven],
    [*Best for*], [Character art, anime, NSFW],
    [*Ecosystem*], [Large — many dedicated LoRAs on CivitAI],
  ),
  caption: [Pony Diffusion at a glance],
)

=== Illustrious

Another SDXL-based fine-tune focused on illustration and anime art. Competes directly with Pony for the anime/character niche.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Base*], [SDXL architecture],
    [*Resolution*], [1024 × 1024],
    [*Prompting*], [Booru-style tags],
    [*Best for*], [Illustration, anime, NSFW],
    [*Ecosystem*], [Growing — active community],
  ),
  caption: [Illustrious at a glance],
)

=== Noob AI

A newer community fine-tune that has gained rapid traction for NSFW and character content. Based on the Illustrious lineage.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Base*], [SDXL / Illustrious lineage],
    [*Resolution*], [1024 × 1024],
    [*Prompting*], [Booru-style tags],
    [*Best for*], [NSFW, character art, anime],
    [*Ecosystem*], [Young but growing fast],
  ),
  caption: [Noob AI at a glance],
)

#info-box(title: "The NSFW trio")[
  Pony, Illustrious, and Noob AI are the go-to choices for NSFW content. They share the SDXL base, use booru-style prompting, and have dedicated LoRA ecosystems. Choose based on the specific style you're after — try all three.
]

== The Flux Family

Developed by Black Forest Labs (founded by former Stability AI researchers), Flux represents a different architectural approach using transformer-based diffusion.

=== FLUX.1 Dev

The full-quality Flux model. Excellent prompt adherence, strong at text rendering, and produces highly coherent images.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [Up to 2 megapixels (flexible aspect ratio)],
    [*Speed*], [Slow — needs 12 GB+ VRAM (or quantized versions for less)],
    [*Prompting*], [Natural language — describe what you want in plain English],
    [*Strengths*], [Excellent prompt following, text in images, photorealism],
    [*Weaknesses*], [Heavy, slower generation, NSFW capability limited],
  ),
  caption: [FLUX.1 Dev at a glance],
)

=== FLUX.1 Schnell

The speed-optimized variant of Flux. Produces results in far fewer steps — often just 4 steps compared to 20–30 for Dev.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [Up to 2 megapixels],
    [*Speed*], [Fast — 4 steps for decent output],
    [*Prompting*], [Natural language],
    [*Strengths*], [Speed, quick iteration, prototyping],
    [*Weaknesses*], [Lower quality than Dev at complex scenes],
  ),
  caption: [FLUX.1 Schnell at a glance],
)

=== Flux 2 Klein

A smaller, more efficient variant in the Flux 2 generation. Designed to bring Flux quality to lower-end hardware.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [Flexible],
    [*Speed*], [Faster than Flux Dev — designed for efficiency],
    [*Prompting*], [Natural language],
    [*Strengths*], [Flux quality at lower VRAM, improved efficiency],
    [*Weaknesses*], [Newer — ecosystem still developing],
  ),
  caption: [Flux 2 Klein at a glance],
)

== The New Wave

These models come from outside the Stability AI / Flux lineage and represent the broadening of the open-source diffusion ecosystem.

=== HiDream

A newer model family gaining attention for high-quality image generation with strong prompt adherence.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [1024 × 1024+],
    [*Speed*], [Moderate],
    [*Prompting*], [Natural language],
    [*Strengths*], [High quality output, good coherence],
    [*Weaknesses*], [Very new — limited ecosystem],
  ),
  caption: [HiDream at a glance],
)

=== ZImage Turbo

A speed-focused model that has earned a reputation as one of the best *all-around* choices for general image generation. If you want one model that does most things well, this is a strong pick.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Resolution*], [Flexible],
    [*Speed*], [Very fast — turbo distillation for few-step generation],
    [*Prompting*], [Natural language],
    [*Strengths*], [Best overall quality-to-speed ratio, versatile, great default choice],
    [*Weaknesses*], [Less specialized than purpose-built fine-tunes],
  ),
  caption: [ZImage Turbo at a glance],
)

#tip-box(title: "Best Overall Pick")[
  If you're new and want one model that just *works* — start with ZImage Turbo. Fast, versatile, and high quality out of the box.
]

== Instruction / Image Edit Models

These are a fundamentally different type of model. Instead of generating images from scratch, they *modify existing images* based on text instructions.

=== Qwen (Image Edit)

Developed by Alibaba, Qwen's image capabilities include instruction-based editing — you give it an image and a command like "change the background to a beach" and it executes the edit.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Type*], [Instruction-based image editor],
    [*Input*], [Image + text instruction],
    [*Prompting*], [Natural language instructions ("make the sky purple")],
    [*Strengths*], [Intuitive editing, no masking required],
    [*Weaknesses*], [Less control than inpainting workflows],
  ),
  caption: [Qwen Image Edit at a glance],
)

=== Flux Kontext

Black Forest Labs' entry into instruction-based editing. Takes an image and a text command, and modifies the image accordingly.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: (right, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Type*], [Instruction-based image editor],
    [*Input*], [Image + text instruction],
    [*Prompting*], [Natural language instructions],
    [*Strengths*], [High quality edits, good at style transfer and modifications],
    [*Weaknesses*], [Resource heavy, newer tool],
  ),
  caption: [Flux Kontext at a glance],
)

#info-box(title: "Generation vs. Instruction — two different tools")[
  Generation models (SD, Flux, ZImage) create images *from nothing*. Instruction models (Qwen, Flux Kontext) *edit existing images* from text commands. They solve different problems. Many workflows use both: generate first, then refine with an instruction model.
]

== Family Compatibility at a Glance

This is the single most important table in this almanac. Before you download any LoRA or embedding, check this:

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 8pt,
    align: (left, center, left),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[Model],
    text(fill: white, weight: "bold")[Family],
    text(fill: white, weight: "bold")[LoRAs compatible with],
    [SD 1.5], [SD 1.x], [SD 1.5 only],
    [SD 2.1], [SD 2.x], [SD 2.x only],
    [SDXL], [SDXL], [SDXL, Pony, Illustrious, Noob AI],
    [SD 3.5 Large], [SD 3.x], [SD 3.x only],
    [Pony], [SDXL], [SDXL-family (often interchangeable)],
    [Illustrious], [SDXL], [SDXL-family],
    [Noob AI], [SDXL], [SDXL-family],
    [FLUX Dev], [Flux], [Flux LoRAs only],
    [FLUX Schnell], [Flux], [Flux LoRAs only],
    [Flux 2 Klein], [Flux 2], [Flux 2 ecosystem],
    [HiDream], [HiDream], [HiDream only],
    [ZImage Turbo], [ZImage], [ZImage ecosystem],
  ),
  caption: [Model family compatibility — never mix across families],
)

== Model Scorecard

How do the generation models stack up against each other? This table rates every model across key capabilities. Instruction/edit models (Qwen, Flux Kontext) are excluded — they solve a different problem.

#let s1 = [#text(fill: rgb("#e94560"))[★]#text(fill: rgb("#dddddd"))[★★★★]]
#let s2 = [#text(fill: rgb("#e94560"))[★★]#text(fill: rgb("#dddddd"))[★★★]]
#let s3 = [#text(fill: rgb("#e94560"))[★★★]#text(fill: rgb("#dddddd"))[★★]]
#let s4 = [#text(fill: rgb("#e94560"))[★★★★]#text(fill: rgb("#dddddd"))[★]]
#let s5 = [#text(fill: rgb("#e94560"))[★★★★★]]
#let na = [#text(fill: rgb("#bbbbbb"))[— — —]]

#set page(flipped: true)

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
    inset: 6pt,
    align: (left, center, center, center, center, center, center, center, center, center, center),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(size: 8pt, fill: white, weight: "bold")[Model],
    text(size: 8pt, fill: white, weight: "bold")[Prompt\ Following],
    text(size: 8pt, fill: white, weight: "bold")[Text in\ Images],
    text(size: 8pt, fill: white, weight: "bold")[Photo-\ realism],
    text(size: 8pt, fill: white, weight: "bold")[Art\ Styles],
    text(size: 8pt, fill: white, weight: "bold")[Human\ Anatomy],
    text(size: 8pt, fill: white, weight: "bold")[Anime /\ Character],
    text(size: 8pt, fill: white, weight: "bold")[Speed],
    text(size: 8pt, fill: white, weight: "bold")[NSFW],
    text(size: 8pt, fill: white, weight: "bold")[VRAM\ Friendly],
    text(size: 8pt, fill: white, weight: "bold")[Ecosystem],

    [*SD 1.5*],        s2, s1, s2, s3, s1, s3, s5, s3, s5, s5,
    [*SD 2.1*],        s3, s1, s3, s2, s2, s2, s4, s2, s4, s1,
    [*SDXL*],          s3, s2, s4, s4, s3, s4, s3, s3, s3, s5,
    [*SD 3.5 Large*],  s4, s4, s4, s5, s4, s3, s2, s2, s2, s2,
    [*Pony*],          s3, s1, s2, s4, s3, s5, s3, s5, s3, s5,
    [*Illustrious*],   s3, s1, s2, s4, s3, s5, s3, s5, s3, s4,
    [*Noob AI*],       s3, s1, s2, s4, s3, s5, s3, s5, s3, s3,
    [*FLUX Dev*],      s5, s5, s5, s4, s5, s3, s2, s2, s2, s4,
    [*FLUX Schnell*],  s4, s3, s4, s3, s4, s3, s5, s2, s2, s3,
    [*Flux 2 Klein*],  s4, s4, s4, s3, s4, s3, s4, s2, s4, s2,
    [*HiDream*],       s4, s3, s4, s3, s4, s3, s3, s2, s2, s1,
    [*ZImage Turbo*],  s5, s4, s5, s4, s5, s3, s5, s3, s4, s3,
  ),
  caption: [Model scorecard — generation models rated across key capabilities],
)

#set page(flipped: false)

#tip-box(title: "How to read this")[
  Five stars means best-in-class for that category. One star doesn't mean *bad* — it means the model wasn't designed for that purpose. A model with ★★★★★ in Anime and ★★ in Photorealism isn't flawed — it's specialized.
]
