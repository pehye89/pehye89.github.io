---
title: 🎈 About Diffusion Models
date: 2024-09-26
categories: [Studies, CV]
tags: [diffusion]
description: Diffusion 모델에 대한 전체적인 정리 및 공부
---

해당 영상을 참고하여 정리 : [Diffusion Model 수학이 포함된 tutorial](https://www.youtube.com/watch?v=uFoGaIVHfoE)

---

### Physical Intuition

- 만약 어떤 연기의 분자가 확산할 때, 해당 분자의 다음 위치는 가우시안 분포를 따른다.
- 또 forward과 backward diffusion 모두 가우시안 분포를 따르고 있으며, 작은 영역에서 서로 유사한 형태를 갖는다. 



### Diffusion Model

- Diffusion 모델은 이미지에 노이즈를 더해서 최종적으로 가우시안 맵과 유사한 노이즈맵을 만들어, 이 노이즈맵을 통해 이미지를 생성하는 과정이다.
- 이미지에서 노이즈를 생성하는 forward diffusion은 비교적 쉽다. 
