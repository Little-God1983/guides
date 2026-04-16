#import "../shared/styles.typ": *

= How to Prompt

The same model can produce wildly different results depending on *how you talk to it*. There are two fundamentally different prompting languages in the diffusion world, and using the wrong one is the most common beginner mistake.

== The Two Worlds

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    inset: 10pt,
    align: (left, left, left),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[],
    text(fill: white, weight: "bold")[Booru-Style Tags],
    text(fill: white, weight: "bold")[Natural Language],
    [*Looks like*],
    [`1girl, long hair, red eyes, school uniform, standing, cherry blossoms, masterpiece, best quality`],
    [`A girl with long hair and red eyes standing under cherry blossoms, wearing a school uniform`],
    [*Used by*], [SD 1.5, SDXL, Pony, Illustrious, Noob AI], [Flux, ZImage Turbo, SD 3.5, HiDream, Qwen],
    [*Origin*], [Derived from anime image board tagging systems (Danbooru, Gelbooru)], [Plain English descriptions],
    [*Order matters?*], [Yes — earlier tags have stronger influence], [Less so — model parses the full sentence],
    [*Separator*], [Commas between tags], [Normal punctuation],
  ),
  caption: [The two prompting paradigms],
)

== Booru-Style Prompting (Tag-Based)

This style comes from anime image boards where images are tagged with structured metadata. Models trained on this data (SD 1.5, SDXL, Pony, Illustrious, Noob AI) respond best when you speak their language.

=== Structure of a Tag Prompt

A well-constructed tag prompt follows a rough hierarchy:

+ *Quality tags* — `masterpiece, best quality, high resolution`
+ *Subject* — `1girl, 1boy, solo, couple`
+ *Appearance* — `long hair, blue eyes, blonde hair, tall`
+ *Clothing* — `school uniform, red dress, armor`
+ *Action/Pose* — `standing, sitting, running, looking at viewer`
+ *Setting* — `outdoors, classroom, forest, night sky`
+ *Style* — `anime style, watercolor, oil painting`

=== Example

```
masterpiece, best quality, 1girl, long blonde hair,
blue eyes, white dress, standing in a field of flowers,
wind blowing hair, golden hour lighting, detailed background
```

=== What to Know

- *Tag order matters.* Put the most important elements first.
- *Quality tags are essential.* Without `masterpiece, best quality`, many models default to lower quality training data.
- *Negative prompts are critical.* Always include a negative prompt to steer away from bad outputs:
  ```
  worst quality, low quality, blurry, deformed hands,
  extra fingers, bad anatomy, watermark, text
  ```
- *Weight syntax.* Most UIs let you emphasize or de-emphasize tags: `(red hair:1.3)` increases influence, `(glasses:0.5)` reduces it.

== Natural Language Prompting

Newer models (Flux, ZImage Turbo, SD 3.5, HiDream) were trained on natural text descriptions, not tags. They understand sentences, context, and spatial relationships.

=== Structure of a Natural Language Prompt

Write as if you're describing the image to someone who will paint it:

+ *What* is in the scene
+ *What it looks like* in detail
+ *Where* it takes place
+ *What mood or style* you want

=== Example

```
A woman with long blonde hair and blue eyes stands in a
field of wildflowers at golden hour. She wears a flowing
white dress that catches the wind. The background shows
rolling hills under a warm sunset sky. Photorealistic,
detailed, cinematic lighting.
```

=== What to Know

- *Be descriptive, not telegraphic.* "A cat sleeping on a windowsill in afternoon light" works better than "cat, sleeping, window."
- *Negative prompts are less important* — but still useful for avoiding artifacts.
- *Spatial descriptions work.* "A red ball on the left, a blue ball on the right" — newer models actually understand this.
- *Style at the end.* Describe the subject first, then add style cues: "cinematic," "oil painting," "editorial photograph."

== The Cardinal Rule

#warning-box(title: "Match your prompt style to your model")[
  Using booru tags on Flux is like speaking French to someone who only knows Japanese. Using full sentences on Pony is like writing an essay when the teacher asked for bullet points. *Neither will fail completely* — but you'll get mediocre results and blame the model when the problem is the prompt.
]

== Quick Reference: Which Style for Which Model

#figure(
  table(
    columns: (1fr, auto, auto),
    inset: 10pt,
    align: (left, center, center),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[Model],
    text(fill: white, weight: "bold")[Booru Tags],
    text(fill: white, weight: "bold")[Natural Language],
    [SD 1.5], [Best], [Poor],
    [SD 2.1], [OK], [OK],
    [SDXL], [Best], [OK],
    [SD 3.5 Large], [Poor], [Best],
    [Pony], [Best], [Poor],
    [Illustrious], [Best], [Poor],
    [Noob AI], [Best], [Poor],
    [FLUX Dev / Schnell], [Poor], [Best],
    [Flux 2 Klein], [Poor], [Best],
    [HiDream], [Poor], [Best],
    [ZImage Turbo], [Poor], [Best],
    [Qwen (edit)], [N/A], [Best (instructions)],
    [Flux Kontext (edit)], [N/A], [Best (instructions)],
  ),
  caption: [Prompting style compatibility — choose the right language for your model],
)
