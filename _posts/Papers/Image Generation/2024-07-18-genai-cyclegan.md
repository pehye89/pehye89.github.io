---
title: \[CycleGAN] Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks
date: 2024-07-18
categories: [Papers, Image Generation]
tags: [image_generation, gan]
math: true
---

Published : 2017/03
Paper : [Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks](https://arxiv.org/abs/1703.10593)

---

We present an approach for learning to translate an image from a source domain X to a target domain Y in the absence of paired examples

![Untitled](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/c6838f8d-f871-48aa-857f-1ca9a89e38a0/Untitled.png?table=block&id=9326c586-c563-4105-8a5a-0a549e814beb&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=0-4W__X6ZiubZdjzmyZ2qKezmJAhI0FTNu03NKqgflc&downloadName=Untitled.png)

![Untitled](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/f3e44a67-6dbf-473e-a98d-5c0b71efa6dd/Untitled.png?table=block&id=303d5921-7dc6-48d5-a14a-08fe66c84933&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=hRj0NidhEsxM3WF5a98vbLzcaEUKRXw7hNBKCAzjk-U&downloadName=Untitled.png)

- Cycle Consistency : content는 바뀌지 않고 style만 바뀔 수 있게 되는 것
- 한번만 GAN이 돌면, mode collapse가 발생할 확률이 높지만, 한번 변환된 이미지를 다시 한번 더 원본으로 돌려놓음으로서(= Reconstruction) 그것을 방지할 수 있음
    
    ![Untitled](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/f1b815a5-80e8-48e2-8cc6-a9ac6b879c06/Untitled.png?table=block&id=71ab8056-7f51-4aa8-ae0a-c5be7565c71a&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=NwBRjNKhcwNyGSXo564JnaecrfeUphptTfyhSq4c0_I&downloadName=Untitled.png)
    
- 한계도 분명히 존재한다.
    - 형태를 바꾸지 못함. → cannot change the outline. can only make minimal changes
    - 당연하지만, 학습된 데이터에 없는 형식은 만들 수 없음

![Untitled](https://file.notion.so/f/f/cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02/c17b2263-9b8d-4825-8f94-e953d19ee9e2/Untitled.png?table=block&id=80c3f19c-9081-4c50-a002-76807eedbd66&spaceId=cd5446b3-d1e6-4b52-a9c7-209e3f3c6e02&expirationTimestamp=1727481600000&signature=3-mBKkkdyEbc9e5yu5Bh4HRgH0uzKD5wDRfOgFnHoiE&downloadName=Untitled.png)
