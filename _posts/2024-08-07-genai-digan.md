---
title: \[DIGAN] Generating Videos with Dynamics-aware Implicit Generative Adversarial Networks
date: 2024-08-07
categories: [Papers, Video Generation]
tags: [video_generation, gan]
math: true
---

Published : 2022/21
Paper : [Generating Videos with Dynamics-aware Implicit Generative Adversarial Networks](https://arxiv.org/abs/2202.10571)

---

previous works : represents videos as 3D grids of RGB values → neglects continuous dynamics

- INR : encodes a continuous signal into a parameterized neural network

![Untitled](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/9c16f23d-0dea-4206-ae5c-2c23a07c5407/Untitled.png?table=block&id=c22095ef-de89-43e9-8007-4ed800e07baf&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=qvCAY_XrvFVHUZMgATHIchrVYvFFdaJeZ-6uoj6wcNM&downloadName=Untitled.png)

1. INR-based generator
    - modify first layer to handle time coordinate
    - content Generator is same with INR-GAN
    - motion Generator is added
2. Discriminator that identifies unnatural motion without observing entire long frame sequences
    - 2D convolutional network

![Untitled](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/d40bd602-3fc5-47b5-9113-7b27540980fa/Untitled.png?table=block&id=8bb7ae9f-d05f-4d4f-b903-19a3a87b1660&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=rfu-XCBbSsq_GsTmbNmO8yNmFyuI6F06Eoald5INot0&downloadName=Untitled.png)