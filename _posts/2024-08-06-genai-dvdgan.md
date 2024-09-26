---
title: \[DVD-GAN] Adversarial Video Generation on Complex Datasets
date: 2024-08-06
categories: [Papers, Video Generation]
tags: [video_generation, gan]
math: true
---

Published : 2019/09
Paper : [Adversarial Video Generation on Complex Datasets](https://arxiv.org/abs/1907.06571v2)

---

#### Discriminator

1. Spatial $D_S$
    - single frame construct
    - sum of per frame scores
    - similar to $D_I$ of MoCoGAN → but different in that it looks at full resolution videos 
2. Temporal $D_T$
    - provides generator with learning signal to generate movements
    - input : downsampled spatial video

---

- natural image 생성에서 strong leveraging of scale를 통해 high fidelity samples을 생성해냈던 것처럼 영상에도 적용
- scales to longer and higher resolution videos by leveraging a computationally efficient decomposition of its discriminator.
- new SOTA form Fréchet Inception Distance for prediction of Kinetics-600 dataset, etc.

&nbsp

- scalable generative model of natural video which produces high-quality samples at resolutions up to 256 × 256 and lengths up to 48 frames.
- build upon BigGAN architechture + scalable, video-specific generator and discriminator architectures

&nbsp

![Untitled](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/0bbc5b41-2d24-42d3-a6e3-f7fd68f4526b/Untitled.png?table=block&id=1bbc7846-dd5f-4308-8007-3417a7366231&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=AZ8g9l_CgAE02WQbOL9J8gZvxtZDVqh2WW1aerG72Uk&downloadName=Untitled.png)

&nbsp

### Dual Discriminators

tackles this scale problem by using two discriminators: 

### Spatial Discriminator DS
- critiques single frame content and structure by randomly sampling $k$ full-resolution frames and judging them individually
- final score is the sum of the per-frame scores
- similar to that of **MoCoGAN** : DVD-GAN’s DS is similar to the per-frame discriminator DI in MoCoGAN (Tulyakov et al., 2018). However MoCoGAN’s analog of DT looks at full resolution videos, whereas DS is the only source of learning signal for high-resolution details in DVD-GAN. For this reason, DS is essential when $\phi$ is not the identity, unlike in MoCoGAN where the additional per-frame discriminator is less crucial.

#### Temporal Discriminator DT
- provide G with the learning signal to generate movement

&nbsp

To make the model scalable, we apply a spatial down sampling function $\phi(.)$ to the whole video and feed its output to DT

- results in an architecture where the discriminators do not process the entire video’s worth of pixels, since DS processes only  $k × H × W$ pixels and DT only $T \times \frac{H}{2} \times \frac{W}{2}$.
- For a 48 frame video at 128 × 128 resolution, this reduces the number of pixels to process per video from 786432 to 327680 : a 58% reduction.