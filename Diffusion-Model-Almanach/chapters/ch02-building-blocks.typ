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

#pagebreak()
=== Uncensored Is Not the Same as Untrained
#figure(
  image("../images/ch-2/censored.jpg", width: 90%),
  caption: [A Common Misunderstanding],
)

A common complaint I get on my videos goes like this:

#figure(
  image("../images/ch-2/clickbait.png", width: 90%),
  caption: [The kind of comment that inspired this section.],
)

This is a misunderstanding of what "uncensored" actually means. Two very different things are getting mixed up:

#figure(
  table(
    columns: (1fr, 1fr),
    inset: 10pt,
    align: (left, left),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[Uncensored],
    text(fill: white, weight: "bold")[Trained on a Subject],

    [The weights are open. There is no safety filter blocking outputs. Nothing refuses your prompt.],
    [The model was actually *shown* images of that subject during training, so it knows what it looks like.],

    [A property of *how the model is distributed*.],
    [A property of *what the model has learned*.],

    [Removing a filter is a one-line change.],
    [Teaching a concept requires retraining on thousands of images.],
  ),
  caption: [Uncensored means nothing is stopping you. Trained means the model actually knows how.],
)

The base *SDXL* is a clean example. The weights are open, there is no inference-time classifier, nothing refuses your prompt. You can type whatever you want. But Stability AI deliberately filtered NSFW content out of the SDXL training dataset, so the model *never saw* what it's being asked to draw. Ask SDXL base for anything nude and you get deformed, anatomically-wrong results — not because something is blocking you, but because the model genuinely doesn't know. This is exactly why the entire SDXL NSFW community moved to fine-tunes like *Pony*, *Illustrious*, and *Noob AI* — they take the open SDXL architecture and teach it what it was never shown.

=== Degrees of Censorship

Not every base model is equally "empty" when it comes to filtered content. There is a spectrum:

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    inset: 10pt,
    align: (left, left, left),
    fill: (_, row) => if row == 0 { rgb("#0f3460") } else if calc.odd(row) { rgb("#f5f5f5") } else { white },
    text(fill: white, weight: "bold")[Level],
    text(fill: white, weight: "bold")[What's happening],
    text(fill: white, weight: "bold")[Example],

    [*Lightly filtered*], [Training data was cleaned of explicit content but the model still recognizes bodies, poses, anatomy. Fine-tunes can fill in the gaps easily.], [SD 1.5 (base), SDXL (base)],
    [*Heavily filtered*], [Training data was aggressively filtered *and* the model was guided during training to avoid certain concepts. Fine-tuning still works but requires much more data and skill.], [FLUX Dev],
    [*Refuses at inference*], [The model itself is trained to produce unusable output when it detects a filtered concept — sometimes reinforced by a separate safety classifier.], [Most closed-source APIs; some open models ship with optional safety checkers you can turn off],
  ),
  caption: [The same "uncensored" label can mean very different things in practice.],
)

FLUX Dev sits firmly in the heavily-filtered middle tier. Its weights are open and no classifier is blocking you, but Black Forest Labs didn't just filter the dataset — they actively steered the model away from NSFW during training. That makes Flux NSFW fine-tunes much harder to produce than SDXL ones, and it's why the Flux NSFW ecosystem lags behind Pony or Illustrious.

Fine-tunes fix this problem with varying degrees of difficulty. A lightly-filtered base is easy to un-filter. A heavily-filtered one takes serious work. But in *all* cases, the underlying point holds: the problem is what the model *knows*, not whether the weights are locked.

#info-box(title: "The short version")[
  *Uncensored* = nothing is blocking the output. *Trained* = the model knows how to make it. A base model can be fully uncensored in the open-source sense and still produce terrible NSFW because it was trained to avoid it. That is exactly why NSFW-focused community checkpoints exist — and why some base models are much easier to fine-tune than others.
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

#figure(
  image("../images/ch-2/VAE.png", width: 100%),
  caption: [A VAE compresses data (image, audio, or video) into a compact *latent* representation and decompresses it back again. Diffusion models work entirely in that latent space — the VAE is what lets them turn their output into something you can actually see.],
)

It plays two roles in the pipeline:

- *Decoding* — when the model has finished denoising, the VAE decompresses the final latent representation back into a real image you can view. This is the step every single generation goes through.
- *Encoding* — when you feed the model an existing image (for image-to-image, inpainting, or LoRA training), the VAE compresses it *into* latent space so the model can work with it.

Because the VAE is the last thing that touches your image before you see it, it has a big influence on the final look — specifically:

- *Color accuracy* — washed-out, faded, or tinted colors are usually a VAE problem
- *Detail sharpness* — blurry or soft details can often be fixed with a different VAE
- *Artifacts* — strange discolored patches, banding, or a weird "plasticky" surface

Most modern checkpoints — SDXL, Flux, ZImage, Qwen, etc. — ship with a well-tuned VAE baked in, and you won't need to think about it at all. Where VAE swapping still matters is the *older SD 1.5 ecosystem*: many community checkpoints from that era have inherited broken or low-quality VAEs, and dropping in a dedicated VAE file (the classic one is `vae-ft-mse-840000`) is a one-click fix for washed-out colors and mushy details.

#tip-box(title: "Do I need to worry about VAE?")[
  For almost every modern model: *no*. Pick a checkpoint use the default VAE and generate. If you are using an older SD 1.5 checkpoint and your outputs look dull, desaturated, or blurry — *then* it's worth downloading a replacement VAE and pointing your UI at it.
]

=== Embeddings / Textual Inversions

An embedding is a *new word* taught to the model. Not a new concept, not a new ability — just a new word that *points to* a combination of things the model already knows how to draw.

Under the hood, an embedding is a small vector of numbers (typically a few KB in size) that lives alongside the model's existing vocabulary. When you use the embedding's trigger word in your prompt, the model interprets it as that learned vector instead of looking it up in its normal dictionary. That vector acts as a shortcut to a specific concept, style, or set of visual traits.

This is fundamentally different from a LoRA:

- *A LoRA* modifies the model's *generation network* — it actually changes how the model draws things.
- *An embedding* only modifies the model's *vocabulary* — it gives you a new keyword, but the drawing itself is still done by the unchanged model.

That difference explains both the strengths and the limits of embeddings:

- *Tiny* — a few KB compared to 10–200 MB for a LoRA.
- *Stack cleanly* — you can use many in the same prompt without them fighting each other.
- *Limited reach* — they can only compose from things the model already knows. They cannot teach the model a genuinely new concept or style the way a LoRA can.

The most common use today is *quality negative embeddings*. Files like `EasyNegative`, `BadHands`, or `bad-artist` bundle up dozens of "bad output" concepts into a single keyword you drop into your negative prompt — saving you from typing out long negative prompts every time.

#warning-box(title: "Embeddings are tied to the text encoder")[
  An embedding trained on SD 1.5 will not work on SDXL, Flux, or any other family — they have different text encoders, so the vectors don't mean the same thing. As with LoRAs: check the base model family before downloading.
]

#tip-box(title: "When to reach for an embedding")[
  Embeddings have largely been overtaken by LoRAs for *adding* things (styles, characters, concepts). But for *negative prompts* — packing a bunch of quality filters into one keyword — a good negative embedding is still hard to beat. Start with `EasyNegative` on SD 1.5 and see the difference immediately.
]

=== Hypernetworks

A hypernetwork is the *ancestor of the LoRA*. Before LoRAs became the standard in early 2023, hypernetworks were the main way to fine-tune a Stable Diffusion model's style or subject without retraining the entire checkpoint.

Technically, a hypernetwork is a small extra neural network that inserts itself into the main model's attention layers and nudges the output in a specific direction. It solves the same problem as a LoRA — *modify the model's behavior cheaply* — but using a different mathematical approach.

LoRAs won out for three practical reasons:

- *Easier to train* — LoRAs require fewer training tricks and less GPU memory to produce a good result.
- *Better quality* — LoRAs capture fine detail and style more faithfully than hypernetworks did.
- *Better composability* — stacking multiple LoRAs works more cleanly than stacking multiple hypernetworks, which often fought with each other.

The result: the community moved on. Almost every new SDXL, Pony, Illustrious, Flux, or Qwen fine-tune released today is a LoRA, not a hypernetwork. CivitAI still hosts thousands of hypernetworks in its archive — but almost all of them are for SD 1.5, and most are now superseded by better LoRA versions of the same concept.

#info-box(title: "Do I need to care about hypernetworks?")[
  In 2026: *almost certainly not*. If you come across a hypernetwork on CivitAI, check whether there is a LoRA version of the same style or character — there usually is, and it will work better. Hypernetworks are worth knowing about mainly so you recognize the category when you see it, not because you'll be using them.
]
