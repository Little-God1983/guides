#import "../shared/styles.typ": *

= What Are Diffusion Models?

Imagine taking a photograph and slowly adding static noise to it — like turning up the snow on an old TV — until the image is nothing but random grain. Now imagine *reversing* that process: starting from pure noise and gradually removing it until a coherent image appears.

That is the core idea behind diffusion models.

#figure(
  image("../images/ch-1/Diffusion-Process2.png", width: 100%),
  caption: [The denoising process in action: starting from pure noise (step 1), the model iteratively refines the image until a coherent result emerges (step 40).],
)

A diffusion model is a type of AI that has learned to *denoise* — to take random noise and shape it, step by step, into an image that matches a text description you give it. Type "a castle on a cliff at sunset" and the model sculpts that scene out of static.

This technology has made image generation accessible to everyone. You don't need to be an artist. You don't need expensive software. You need a model, a text prompt, and a decent computer — sometimes just your phone, if you are using a cloud-based service.

Platforms like *CivitAI* and *Hugging Face* host thousands of these models, each fine-tuned for different styles, subjects, and purposes. Some excel at photorealism. Others produce anime. Some can edit existing images from a simple instruction like "make her hair red."

The landscape is vast, and it moves fast. New models appear weekly. This almanac is your map.

== The Age of Diffusion Models

The first mass-adopted public checkpoint that changed everything was *Stable Diffusion 1.5*, released in late 2022. It was open-source, uncensored, free to use, and capable of generating images from text prompts. This democratized access to powerful image generation technology, leading to an explosion of creativity and innovation in the field.

What started as a single model has grown into a sprawling ecosystem in just a few years. *SDXL* arrived in 2023 with higher resolution and better overall quality. *Flux* landed in 2024, bringing dramatically improved prompt understanding and near-perfect text rendering. Newer entries like *ZImage Turbo*, *Qwen*, and *HiDream* continue to push the boundaries — some toward speed, some toward editing, some toward entirely new architectures.

The pace is relentless. A model that feels state-of-the-art today may become a historical footnote within six months. That is both the excitement and the challenge of this field — and it's exactly why this almanac exists.

== The Basic Pipeline

Every diffusion model follows roughly the same process:

+ *You write a prompt* — a text description of what you want.
+ *A text encoder* translates your words into numbers the model understands.
+ *The model denoises* — starting from random noise, it iteratively refines the image over many steps.
+ *A decoder* converts the model's internal representation into a final image you can see.

#v(1em)

#figure(
  {
    set text(size: 9pt)
    let pipe-box(body, color) = box(
      width: 72pt,
      height: 46pt,
      inset: 6pt,
      radius: 4pt,
      fill: color,
      stroke: 0.5pt + color.darken(30%),
    )[
      #set align(center + horizon)
      #text(fill: white, weight: "bold", body)
    ]
    let arrow = box(
      inset: (x: 4pt),
      baseline: -6pt,
      text(size: 18pt, weight: "bold", fill: rgb("#0f3460"))[→],
    )

    stack(
      dir: ltr,
      spacing: 0pt,
      pipe-box([Your\ Prompt], rgb("#e94560")),
      arrow,
      pipe-box([Text\ Encoder], rgb("#16213e")),
      arrow,
      pipe-box([Denoiser\ (U-Net / DiT)], rgb("#16213e")),
      arrow,
      pipe-box([Decoder\ (VAE)], rgb("#16213e")),
      arrow,
      pipe-box([Final\ Image], rgb("#2d6a30")),
    )
  },
  caption: [The diffusion pipeline: your words flow left-to-right, transforming into pixels.],
)

#v(1em)

To see this in practice, here is what the same flow looks like with a real example:

#figure(
  image("../images/ch-1/clipTextEncode.png", width: 90%),
  caption: [A concrete example of the pipeline: the prompt "A cute cat wearing a top hat" is encoded into a semantic embedding (a vector of numbers), which the diffusion model then uses to guide denoising from pure noise into the final image.],
)

Different model families (SD 1.5, SDXL, Flux, etc.) each implement this pipeline differently — with different architectures, different text encoders, and different capabilities. We'll cover each of them in detail.

#info-box(title: "Key Takeaway")[
  A diffusion model turns noise into images guided by your text. The differences between models come down to *how well* they do this, *what styles* they've learned, and *how you talk to them*.
]
