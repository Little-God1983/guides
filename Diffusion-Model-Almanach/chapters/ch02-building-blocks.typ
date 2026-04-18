#import "../shared/styles.typ": *

= The Building Blocks

When you browse CivitAI, you'll see models tagged as "Checkpoint", "LoRA", "TextualInversion", and more. These are not interchangeable — they are different *types* of files that serve different roles. Understanding what each one does is essential before you download anything.

#figure(
  image("../images/ch-2/types-civitai.png", width: 100%),
  caption: [Model Types On CivitAI],
)

== Checkpoints

A checkpoint is the *full model*. It contains everything the AI needs to generate images from scratch: the denoising network, the learned weights, the entire knowledge of what "a cat" or "a sunset" looks like.

Checkpoints are large — typically *2 GB to 30 GB* depending on the model family. When someone says "I'm using SDXL" or "I switched to Flux," they're talking about a checkpoint.

#info-box(title: "Think of it this way")[
  A checkpoint is the brain. Without it, nothing runs. Everything else is an accessory that modifies what the brain knows.
]

=== Base Models vs. Community Checkpoints

This is the single most important distinction to understand when browsing CivitAI. The word "checkpoint" covers *two very different things*:

#figure(
  table(
    columns: (1fr, 1fr),
    inset: 10pt,
    align: (left, left),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[Base Model],
    text(fill: white, weight: "bold")[Community Checkpoint],

    [Released by the *original developer* (Stability AI, Black Forest Labs, Alibaba, etc.)],
    [Created by *someone in the community* — an individual, a group, or a studio],

    [Trained from scratch on massive, general-purpose datasets],
    [*Fine-tuned* on top of a base model using a smaller, curated dataset],

    [Designed to be *a neutral starting point* — broad, balanced, unspecialized],
    [Designed with *a specific goal* — a style, a subject, a quality bias],

    [Examples: SD 1.5, SDXL, FLUX Dev, ZImage Turbo],
    [Examples: Juggernaut XL, Cyberrealistic Pony, DreamShaper, epiCRealism],

    [Usually *one official release* per version],
    [*Thousands* on CivitAI, constantly updated and remixed],

    [Especially for older models like SD 1.5 and SDXL. You rarely use it directly — the raw output is "OK" but unrefined],
    [What most people actually generate with — it's where the *aesthetic* comes from],
  ),
  caption: [Base models are the foundation. Community checkpoints are what you usually download and use.],
)

#figure(image("../images/ch-2/BaseModel-Reference.png"), caption: [You can find which base model it was trained on in the model card],)

Here is the key insight: *every community checkpoint is built on a base model*. A checkpoint called "Juggernaut XL" isn't a new architecture — it is SDXL that someone fine-tuned for photorealism. A checkpoint called "DreamShaper" is SD 1.5 fine-tuned for painterly fantasy art. The *family* (SDXL, SD 1.5, Flux, etc.) is inherited from the base model. The *flavor* comes from the community fine-tune.

#tip-box(title: "Why this matters for compatibility")[
  A LoRA trained on SDXL will work with *any* SDXL community checkpoint — Juggernaut, RealVis, DreamShaper XL, whatever. They all share the same underlying architecture. But that same LoRA will break on an SD 1.5 or Flux checkpoint, even though all three are "checkpoints". Always check the *base model family* — not the checkpoint name.
]

=== File Formats

Checkpoints come in two formats you'll encounter:
- *.safetensors* — the modern, safe standard. Always prefer this.
- *.ckpt* — the legacy format. Can contain executable code. Avoid unless you trust the source.

== LoRA (Low-Rank Adaptation)

A LoRA is a small, targeted modification that sits *on top of* a checkpoint. It doesn't work alone — it needs a compatible base checkpoint to attach to.

LoRAs are how the community fine-tunes models without retraining the entire thing. They are small (typically *30 MB to 200 MB*) and focused:

- A LoRA trained on a specific person's look
- A LoRA that adds a particular art style
- A LoRA that teaches the model a specific pose or composition

You activate a LoRA in your prompt (the exact syntax depends on your UI) and control its *strength* — how much influence it has over the final image. Too low and you won't see the effect. Too high and it overpowers everything and could lead to visual distubances.

#warning-box(title: "Compatibility matters")[
  A LoRA trained for SD 1.5 will *not* work with SDXL or Flux. Always check which base model a LoRA was trained on. For Some Image models combining multiple LoRA's works great but some models like ZImage Turbo break apart fast when using more than one or two.
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

The VAE is the component that *translates between the model's internal world and the pixels on your screen*. This matters because diffusion models don't actually work with pixels — they work in a compressed mathematical space called *latent space*. The VAE is the bridge between those two worlds.

It plays two roles in the pipeline:

- *Decoding* — when the model has finished denoising, the VAE decompresses the final latent representation back into a real image you can view. This is the step every single generation goes through.
- *Encoding* — when you feed the model an existing image (for image-to-image, inpainting, or LoRA training), the VAE compresses it *into* latent space so the model can work with it.

Because the VAE is the last thing that touches your image before you see it, it has a big influence on the final look — specifically:

- *Color accuracy* — washed-out, faded, or tinted colors are usually a VAE problem
- *Detail sharpness* — blurry or soft details can often be fixed with a different VAE
- *Artifacts* — strange discolored patches, banding, or a weird "plasticky" surface

Most modern checkpoints — SDXL, Flux, ZImage, Qwen, etc. — ship with a well-tuned VAE baked in, and you won't need to think about it at all. Where VAE swapping still matters is the *older SD 1.5 ecosystem*: many community checkpoints from that era have inherited broken or low-quality VAEs, and dropping in a dedicated VAE file (the classic one is `vae-ft-mse-840000`) is a one-click fix for washed-out colors and mushy details.

#tip-box(title: "Do I need to worry about VAE?")[
  For almost every modern model: *no*. Pick a checkpoint and generate. If you are using an older SD 1.5 checkpoint and your outputs look dull, desaturated, or blurry — *then* it's worth downloading a replacement VAE and pointing your UI at it.
]

=== Embeddings / Textual Inversions

These are tiny files (a few KB) that teach the model a new keyword. For example, an embedding might let you type `ugly_hands` in your negative prompt to specifically avoid deformed hands. They are simple, lightweight, and stack easily.

=== Hypernetworks

An older technique for model modification, mostly replaced by LoRAs. You may still find them on CivitAI but they are rarely used with modern model families.

#warning-box(title: "Dying out")[
  While Hypernetworks and Texutal Inversions were a thing when all began. Hypernetworks arent used anymore in SDXL and later models and Texutal Inversion is also more a thing of the past.
]
