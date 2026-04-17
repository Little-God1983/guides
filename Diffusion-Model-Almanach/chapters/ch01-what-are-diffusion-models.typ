#import "../shared/styles.typ": *

= Preface

This guide is for anyone who wants to know more about diffusion models. The landscape of AI image generation is vast and rapidly evolving, and it can be overwhelming to navigate. This almanac breaks down the key concepts, technologies, and models in a clear and accessible way.

It's not a prompt guide or what software to use. I have got many other tutorial for that on my youtube or patreon. This is a high-level overview of what the different models are, and how they compare.

The goal is to give you a solid understanding of the different base models, so you can make informed choices about which ones to use, and how to use them effectively.

The vocabulary is kept simple on purpose. I want this to be accessible to everyone, regardless of technical background. If you want to dive deeper into the technical details, there are plenty of resources available.

#figure(
  image("../images/ch-1/civitai-overview.png", width: 100%),
  caption: [Overview of the CivitAI platform, showcasing the variety of models available.],
)

= The Age Of Diffusion Models

The first mass-adopted public checkpoint that changed everything was Stable Diffusion 1.5, released in late 2022. It was open-source, uncensored, free to use, and capable of generating images from text prompts. This democratized access to powerful image generation technology, leading to an explosion of creativity and innovation in the field.

= What Are Diffusion Models?

Imagine taking a photograph and slowly adding static noise to it — like turning up the snow on an old TV — until the image is nothing but random grain. Now imagine *reversing* that process: starting from pure noise and gradually removing it until a coherent image appears.

That is the core idea behind diffusion models.

#figure(
  image("../images/ch-1/Diffusion-Process2.png", width: 100%),
  caption: [The denoising process in action: starting from pure noise (step 1), the model iteratively refines the image until a coherent result emerges (step 40).],
)

A diffusion model is a type of AI that has learned to *denoise* — to take random noise and shape it, step by step, into an image that matches a text description you give it. Type "a castle on a cliff at sunset" and the model sculpts that scene out of static.

This technology has made image generation accessible to everyone. You don't need to be an artist. You don't need expensive software. You need a model, a text prompt, and a decent computer — sometimes just your phone if you are using a cloud-based service.

Platforms like *CivitAI* or *Hugging Face* host thousands of these models, each fine-tuned for different styles, subjects, and purposes. Some excel at photorealism. Others produce anime. Some can edit existing images from a simple instruction like "make her hair red."

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
