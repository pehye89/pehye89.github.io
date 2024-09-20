---
title: LAVIE - High-Quality Video Generation with Cascaded Latent Diffusion Models
date: 2024-07-24 
author: eunhye
categories: [Papers, Video Generation]
tags: [video_generation, diffusion, lavie, ldm]
math: true
---

## Introduction

integrated video generation framework that operates on cascaded video latent diffusion models that consists of : 

- base T2V model
- temporal interpolation model
- video super-resolution model

3B Parameters

Key Insights

1. incorporation of simple temporal self-attentions + rotary positional encoding = captures temporal correlation
2. validate that the process of joint image-video finetuning plays a pivotal role in producing high quality videos
    - directly finetuning on video dataset severely hampers the concept-mixing ability of the model, leading to catastrophic forgetting and the gradual vanishing of the learned prior knowledge

Contribute a diverse video dataset names Vimeo25M : video-text pairs

## Methods

- framework consisting of Video Latent Diffusion Models conditioned on text descriptions

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/aa9b608d-9512-469e-a648-957abd96633b/Untitled.png)

1. Base T2V model : responsible for generating short, low resolution key frames
2. Temporal Interpolation model : interpolates the short videos and increase frame rate
3. Video Super Resolution model : synthesizes high definition results from low resolution videos → imagen 이랑 비슷함

- each of these models is individually trained with text inputs serving as conditioning information.
- capable of generating video consisting of 61 frames with spatial resolution of 1280$\times$2046 pixels

### Base T2V Model

- original LDM is designed as a 2D U-Net and can only process image data
- two modifications
    1. for each 2D conv layer, inflate the pretrained kernel to incorporate an additional temporal dimension → pseudo-3D convolutional later
        - this inflation process converts any input tensor with the size B × C × H × W to B × C × 1 × H × W by introducing extra temporal axis
    2. extent the original transformer block to a spatiotemporal transformer by including a temporal attention layer after each spatial layer
        - incorporate the concept of Rotary Positional Encoding from the late LLM to integrate temporal attention layer
        
        ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/d7662621-5588-4a37-98b3-6e5a3b6228af/Untitled.png)
        
- unlike previous methods that introduce additional temporal transformer to model time, LaVie directly applies it to the transformer block itself
- generates videos with 16 frames at a resolution of 320$\times$512

**Primary Objective of the Base Model** 

- generate high quality key frames while also preserving diversity and capturing the compositional nature of videos
- apply joint finetuning approach using both image and video data to avoid catastrophic forgetting

### Temporal Interpolation Model

- enhance the smoothness of the videos and synthesize richer temporal details
- training diffusion U-Net for it to quadruple the frame rate of the base video
    - 16 → 61 frames
- In other words, every frame in the output is newly synthesized, providing a distinct approach compared to techniques where the input frames remain unchanged during interpolation
- diffusion U-Net is conditioned on the text prompt, which serves as additional guidance for the temporal interpolation process,

### Video Super Resolution Model

- LDM upsampler similar to the base model

## Results

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/9eaf03b5-5a67-468f-ad03-7c3a59e9201f/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/0d38f4c4-c97a-4275-8a3c-9ce7b8d4d403/Untitled.png)

## Limitations

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/2f960b3e-b970-4cf1-aa9a-2c3054531fb8/Untitled.png)

1. Multi-subject generation
2. Failure of hands generation
