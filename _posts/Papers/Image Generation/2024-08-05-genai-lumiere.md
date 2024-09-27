---
title: \[Lumiere] A Space-Time Diffusion Model for Video Generation
date: 2024-08-05
categories: [Papers, Video Generation]
tags: [video_generation, diffusion, ldm]
math: true
---

Published : 2024/01
Paper : [A Space-Time Diffusion Model for Video Generation](https://arxiv.org/abs/2401.12945)

---

### Architecture
- realistic, diverse and coherent motion

![Lumiere Pipeline](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/c1a2b314-7ce6-471f-8650-c0c2091bbed9/Untitled.png?table=block&id=2d206b57-0398-4e04-965e-052358eb3d23&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=DbH1HUiuw_ndfTFddQCN3debBRr9BPMCj5wpkVE0ilw&downloadName=Untitled.png)

- space-time UNet architechture
    - entire temporal duration at once (single pass)
    - previous models : key frames → SSR which makes global temporal consistency different
        - base model generates on aggresively sub-smapled key frame which makes the result aliased and ambigious on fast videos
        - and this problem cannot be solved by TSR
        - domain gap exists → inference time is used also for interpolation ⇒ leads to errors
    - implies that TSR layer in the cascaded models are inefficient
    
    ![STUNet architecture](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/90070425-4ce4-406a-87a6-2b9c7da1495b/Untitled.png?table=block&id=14087e38-44c9-479f-913d-ed36c6dab490&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=ElVZ-7V6457FJ29lnmbevxhb6UePoZ3x398qe9TV3s0&downloadName=Untitled.png)
    
- both spatial and temporal down and upsampling
- leveraging T2I diffusion mdeol
    
    → directly generate full frame rate, low resolution video
    
    → multiple space-time scale
    
- computations in pixel space not latent space
    - this results to model needing spatial super resolution model to produce high res images
    - however, this design principle may also be applied to LDMs
- in this model, inflated SSR network can only operate on short segments of the videos due to memory constraints
    - for smooth transition, employ multidiffusion along the temporal axis

### limitations

- not designed for multi-shot video or videos with transition between shots
