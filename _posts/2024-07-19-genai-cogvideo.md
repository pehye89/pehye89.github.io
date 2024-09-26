---
title: [CogVideo] Large-scale Pretraining for Text-to-Video Generation via Transformers
date: 2024-07-19
categories: [Papers, Video Generation]
tags: [video_generation]
math: true
---

Published : 2022/05
Paper : [Large-scale Pretraining for Text-to-Video Generation via Transformers](https://arxiv.org/abs/2205.15868)

---

&nbsp

> To align text and video : multi-frame-rate hierarchical training strategy

- largest and first open-source pretrained transformer model for t2v generation in general domain 
- multi-frame-rate hierarchical training to better align text-clip pairs → improves generation accuracy

&nbsp

### Challenges

- The potential huge computation cost makes the training from scratch unaffordable
- weak relevance to text-video dataset
- **video frames tend to gradually deviate from the text prompt**
    - possibly because of lack of annotated text-video data available compared to text-image data
    - duration of the video varies
        - Previous models split the video into many clips of a fixed number of frames for training, which destroys the alignment between the text and its temporal counterparts in the video. If a “drinking” video is split into four individual clips of “holding a glass”, “lifting”, “drinking” and “putting down” with the same text “drinking”, the model will be confused to learn the accurate meaning of drinking.

&nbsp

### Contributions

- CogVideo
    - 9B-parameter transformer
    - inherits pretrained T2I model CogView2
- multi-frame-rate hierarchial training strategy → to better align text and video clips
