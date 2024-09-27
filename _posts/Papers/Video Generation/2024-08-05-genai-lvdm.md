---
title: (LVDM) Latent Video Diffusion Models for High-Fidelity Long Video Generation
date: 2024-08-05
categories: [Papers, Video Generation]
tags: [diffusion]
math: true
---

Published : 2022/11
Paper : [Latent Video Diffusion Models for High-Fidelity Long Video Generation](https://arxiv.org/abs/2211.13221)

---

### Summary

- focused on long video generation
- 3D autoencoder
    - encoder : spatial and temporal downsampling
- spatiotemporal factorized 3D UNet architecture
    - tried joint spatiotemporal attention → less effective
- conditional latent perturbation
    - for coherent long sequence
    - introducing noise to conditional latent variables at each generation step
- unconditional guidance
    - ensure general realism
    - when model generates conditionally, it may drift away from realistic or expected outputs as the sequence gets longer

### Introduction

#### Diffusion model 

- good result but high computational resources
- to address this, we introduce a lightweight video diffusion models by leveraging a low-dimensional 3D latent space, significantly outperforming previous pixel-space video diffusion models under a limited computational budget

Leverage diffusion models.

- However, directly extending diffusion models to video synthesis requires substantial computational resources
- so proposes LVDM, an efficient video diffusion model in the latent space of videos and we achieve SOTA results via simple LVDM model.
- In addition, to further generate long-range videos, we introduce a hierarchical LVDM framework that can extent videos far behind the training length.

However, generating long videos tends to suffer the performance degredation problem

- conditional latent perturbation and unconditional guidmace, whcih effectively slow

### Contributions

1. First compressing videos into tight latents
2. hierarchical framework that operates in the video latent space, enabling our models to generate longer videos beyond the training length further 
3. conditional latent perturbation and unconditional guidance for mitigating the performance degradation during long video generation. 
4. SOTA results on three benchmarks in both short and long video generation settings. Also probife appealing result for open-domain text-to-video generation, demonstrating the effective and generalization of out models

![Hierarchial LVDM Framework](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/a2ba6c84-7d27-4eeb-901e-8a6a16642fd4/Untitled.png?table=block&id=f0410712-a1cc-4ce6-9211-9c151893be7b&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=671npJ5dXDNfHa_CM3REIHJK5WhixwCYT2WX08jcItM&downloadName=Untitled.png)