#import "../shared/styles.typ": *

= The Building Blocks

When you browse CivitAI, you'll see models tagged as "Checkpoint", "LoRA", "TextualInversion", and more. These are not interchangeable — they are different *types* of files that serve different roles. Understanding what each one does is essential before you download anything.

== Checkpoints

A checkpoint is the *full model*. It contains everything the AI needs to generate images from scratch: the denoising network, the learned weights, the entire knowledge of what "a cat" or "a sunset" looks like.

Checkpoints are large — typically *2 GB to 7 GB* depending on the model family. When someone says "I'm using SDXL" or "I switched to Flux," they're talking about a checkpoint.

#info-box(title: "Think of it this way")[
  A checkpoint is the brain. Without it, nothing runs. Everything else is an accessory that modifies what the brain knows.
]

Checkpoints come in two formats you'll encounter:
- *.safetensors* — the modern, safe standard. Always prefer this.
- *.ckpt* — the legacy format. Can contain executable code. Avoid unless you trust the source.

== LoRA (Low-Rank Adaptation)

A LoRA is a small, targeted modification that sits *on top of* a checkpoint. It doesn't work alone — it needs a compatible base checkpoint to attach to.

LoRAs are how the community fine-tunes models without retraining the entire thing. They are small (typically *10 MB to 200 MB*) and focused:

- A LoRA trained on a specific person's face
- A LoRA that adds a particular art style
- A LoRA that teaches the model a specific pose or composition

You activate a LoRA in your prompt (the exact syntax depends on your UI) and control its *strength* — how much influence it has over the final image. Too low and you won't see the effect. Too high and it overpowers everything.

#warning-box(title: "Compatibility matters")[
  A LoRA trained for SD 1.5 will *not* work with SDXL or Flux. Always check which base model a LoRA was trained on. CivitAI lists this on every model page.
]

== The Relationship

Think of it as layers:

#figure(
  table(
    columns: (auto, 1fr),
    inset: 10pt,
    align: (center, left),
    fill: (_, row) => if calc.odd(row) { rgb("#f5f5f5") } else { white },
    [*Layer*], [*What it does*],
    [Checkpoint], [The full model — generates images from text],
    [LoRA], [Small add-on — modifies style, subject, or concept],
    [VAE], [The decoder — affects color and sharpness of the final image],
    [Embeddings / Textual Inversions], [Teaches the model new *words* — a shortcut to a trained concept],
  ),
  caption: [How the pieces fit together],
)

You always start with a checkpoint. Then you optionally layer LoRAs, swap the VAE, or add embeddings to steer the output.

== Other File Types You'll See

=== VAE (Variational Autoencoder)

The VAE is the component that converts the model's internal math into actual pixel colors. Most checkpoints ship with a built-in VAE, but you can swap it out. A better VAE can fix washed-out colors or blurry details without changing anything else.

=== Embeddings / Textual Inversions

These are tiny files (a few KB) that teach the model a new keyword. For example, an embedding might let you type `ugly_hands` in your negative prompt to specifically avoid deformed hands. They are simple, lightweight, and stack easily.

=== Hypernetworks

An older technique for model modification, mostly replaced by LoRAs. You may still find them on CivitAI but they are rarely used with modern model families.

#tip-box(title: "Practical rule of thumb")[
  For your first setup, you need exactly *one checkpoint* and *zero or more LoRAs*. That's it. VAEs and embeddings are optimizations you can explore later.
]
