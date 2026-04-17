#import "../shared/styles.typ": *

= The Age of Diffusion Models

First mass-adopted public checkpoint that changed everything was Stable Diffusion 1.5, released in late 2022. It was open-source, free to use, and capable of generating high-quality images from text prompts. This democratized access to powerful image generation technology, leading to an explosion of creativity and innovation in the field.



= What Are Diffusion Models?

Imagine taking a photograph and slowly adding static noise to it — like turning up the snow on an old TV — until the image is nothing but random grain. Now imagine *reversing* that process: starting from pure noise and gradually removing it until a coherent image appears.

That is the core idea behind diffusion models.

#figure(
  image("../images/ch-1/Diffusion-Process2.png", width: 100%),
  caption: [The denoising process in action: starting from pure noise (step 1), the model iteratively refines the image until a coherent result emerges (step 40).],
)

A diffusion model is a type of AI that has learned to *denoise* — to take random noise and shape it, step by step, into an image that matches a text description you give it. Type "a castle on a cliff at sunset" and the model sculpts that scene out of static.

== Why Should You Care?

Because this technology has made image generation accessible to everyone. You don't need to be an artist. You don't need expensive software. You need a model, a text prompt, and a computer — sometimes just your phone.

Platforms like *CivitAI* host thousands of these models, each fine-tuned for different styles, subjects, and purposes. Some excel at photorealism. Others produce anime. Some can edit existing images from a simple instruction like "make her hair red."

The landscape is vast, and it moves fast. New models appear weekly. This almanac is your map.

== The Basic Pipeline

Every diffusion model follows roughly the same process:

+ *You write a prompt* — a text description of what you want.
+ *A text encoder* translates your words into numbers the model understands.
+ *The model denoises* — starting from random noise, it iteratively refines the image over many steps.
+ *A decoder* converts the model's internal representation into a final image you can see.

Different model families (SD 1.5, SDXL, Flux, etc.) each implement this pipeline differently — with different architectures, different text encoders, and different capabilities. We'll cover each of them in detail.

#info-box(title: "Key Takeaway")[
  A diffusion model turns noise into images guided by your text. The differences between models come down to *how well* they do this, *what styles* they've learned, and *how you talk to them*.
]
