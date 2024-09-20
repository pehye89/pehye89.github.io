---
title: High Definition Video Generation with Diffusion Models
date: 2024-07-20 
author: eunhye
categories: [Papers, Video Generation]
tags: [video_generation, diffusion, imagen]
math: true
---

Extending the text-to-image diffusion models of [Imagen (Saharia et al., 2022b)](https://arxiv.org/pdf/2205.11487) to the time domain

- We transferred multiple methods from the image domain to video, such as **v-parameterization** ([Salimans & Ho, 2022](https://arxiv.org/pdf/2202.00512)), **conditioning augmentation** ([Ho et al., 2022a](https://arxiv.org/pdf/2204.03458)), and **classifier-free guidance** ([Ho & Salimans, 2021](https://arxiv.org/pdf/2207.12598)), and found that these are also useful in the video setting.
- Video modeling is computationally demanding, and we found that **progressive distillation** ([Salimans & Ho, 2022](https://arxiv.org/pdf/2202.00512); [Meng et al., 2022](https://arxiv.org/pdf/2210.03142)) is a valuable technique for speeding up video diffusion models at sampling time.

---

- capable of generating :
    - high definition videos with high frame fidelity
    - strong temporal consistency,
    - deep language understanding
- demonstrate
    1. simplicity and effectiveness of **cascaded diffusion video** models for high definition video generation
    2. qualitative controllability in Imagen Video, such as 3D object understanding, generation of text animations, and generation of videos in various artistic styles
- confirm findings
    1. effectiveness of frozen encoder text conditioning and classifier-free guidance
- new findings
    1. effectiveness of the v-prediction parameterization for sample quality
    - effectiveness of progressive distillation of guided diffusion models for the text-conditioned video generation setting
- cascade of video diffusion models
    - effective method for scaling diffusion models to high resolution outputs
        - class-conditional ImageNet ([Ho et al., 2022a](https://arxiv.org/pdf/2204.03458))
        - text-to-image generation ([Ramesh et al., 2022](https://arxiv.org/pdf/2204.06125); [Saharia et al., 2022b](https://arxiv.org/pdf/2205.11487))
- consists of 7 sub-models which perform text-conditional video generation, spatial super-resolution, and temporal super-resolution
    - high definition 1280×768 (width × height) videos at 24 frames per second, for 128 frames (≈ 5.3 seconds)—approximately 126 million pixels

### Diffusion Models

- built from diffusion models ([Sohl-Dickstein et al., 2015](https://arxiv.org/pdf/1503.03585); [Song & Ermon, 2019](https://arxiv.org/pdf/1907.05600); [Ho et al., 2020](https://arxiv.org/pdf/2006.11239)) specified in continuous time ([Tzen & Raginsky, 2019](https://arxiv.org/pdf/1905.09883); [Song et al., 2021](https://arxiv.org/abs/2011.13456); [Kingma et al., 2021](https://arxiv.org/pdf/2107.00630))
- continuous time version of the cosine noise schedule (Nichol & Dhariwal, 2021)
- We will drop the dependence on $λ_t$ to simplify notation. In practice, we parameterize our models in terms of the **v-parameterization** (Salimans & Ho, 2022), rather than predicting $\epsilon$ or $x$ directly
    - useful for numerical stability throughout the diffusion process to enable progressive distillation for our models
    - avoids color shifting artifacts that are known to affect high resolution diffusion models
    - in the video setting it avoids temporal color shifting that sometimes appears with $\epsilon$-prediction models
    - benefit of faster convergence of sample quality metrics
        - $\epsilon$-prediction converges relatively slowly in terms of sample quality metrics and suffers from color shift and color inconsistency across frames in the generated videos
        - ![[Pasted image 20240709111104.png]]
- **conditional diffusion models** for spatial and temporal super-resolution in our pipeline of diffusion models
    - in these cases, $c$ includes both the text and the previous stage low resolution video as well as a signal $λ_t\prime$ that describes the strength of conditioning augmentation added to $c$.
    - critical to condition all the super-resolution models with the text embedding [Saharia et al., 2022b](https://arxiv.org/pdf/2205.11487)
- **discrete time ancestral sampler** with sampling variances derived from lower and upper bounds on reverse process entropy
- **deterministic DDIM sampler** (Song et al., 2020) can be used for sampling
    - numerical integration rule for the probability flow ODE
    - describes how a sample from a standard normal distribution can be deterministically transformed into a sample from the video data distribution using the denoising model
    - useful for **progressive distillation** for fast sampling

### Cascaded Diffusion Models

- generate an image or video at a low resolution, then sequentially increase the resolution of the image or video through a series of super-resolution diffusion models
- can model very high dimensional problems while still keeping each sub-model relatively simple
- conditioning on text embeddings from a large frozen language model in conjunction with cascaded diffusion models, one can generate high quality 1024 × 1024 images from text descriptions
![[Pasted image 20240709111933.png]]
- 1 frozen text encoder T5-XXL (Simillar to that of [Saharia et al., 2022b](https://arxiv.org/pdf/2205.11487)), 1 base video diffusion model, 3 SSR (spatial super-resolution), and 3 TSR (temporal super-resolution) models – for a total of 7 video diffusion models, with a total of 11.6B diffusion model parameters
    - T5-XXL (Simillar to that of [Saharia et al., 2022b](https://arxiv.org/pdf/2205.11487)) critical for alignment between generated video and the text prompt
    - SSR (spatial super-resolution) models increase spatial resolution for all input frames
    - TSR (temporal super-resolution) models increase temporal resolution by filling in intermediate frames between input frames
- All models generate an entire block of frames simultaneously
    - SSR models do not suffer from obvious artifacts that would occur from naively running super-resolution on independent frames
- One benefit of cascaded models is that each diffusion model can be trained independently, allowing one to train all 7 models in parallel
- intend to explore hybrid pipelines of multiple model classes further in future work.
