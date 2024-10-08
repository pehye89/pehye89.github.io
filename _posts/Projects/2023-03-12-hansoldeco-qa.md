---
title: 도배 하자 질의 응답 처리 - 한솔데코 시즌2 AI 경진대회
date: 2023-03-12
categories: [Projects]
math: true
description: NLP(자연어 처리)기반의 QA (질문-응답) 시스템을 통해 도배하자와 관련된 신속하고 정확한 질의응답 처리 능력을 갖춘 AI 모델 개발
---

# **🎨 도배 하자 질의 응답 처리 : 한솔데코 시즌2 AI 경진대회**

<br>


## 🖌️ 공모전 소개

- AI를 활용해 시트, 마루, 벽면, 도배와 같은 건축의 핵심 자재들의 품질 관리와 하자 판단 과정을 더욱 정교하고 효율적으로 만들어, 이러한 자재들의 관리 및 운용의 질을 향상시키고자 함
- 실제 현장에서 발생할 수 있는 복잡한 상황에 대응하고, 고객의 문의에 신속하고 정확하게 답변할 수 있는 시스템을 구축
- NLP(자연어 처리)기반의 QA (질문-응답) 시스템을 통해 도배하자와 관련된 신속하고 정확한 질의응답 처리 능력을 갖춘 AI 모델 개발

<br>

## 🖌️ 데이터셋

![image](https://github.com/Euron-Project/hansoldeco-qa/assets/144101586/4938a177-c8fa-485d-a4a6-63cbe6de1dae)

<br>

## 🖌️ 데이터 수집 및 전처리

- 데이터 수집 : 공모전 주최측의 train, test 데이터 사용
- 데이터 전처리 :
    - for문을 활용해 질문과 답변이 1:1 대응이 되도록 데이터 포맷팅
    - 데이터셋의 질문과 답변을 모델의 입력으로 사용하기 위해 텍스트를 토큰화하고 숫자로 변환
- 데이터 증강 :
    
    train data 양을 늘려 모델의 정확도를 개선하기 위해 데이터 증강
    
    1차적으로 전체 데이터 증강(MLM) 후, 상대적으로 데이터 수가 적은 카테고리의 데이터만 한번 더 증강(shuffle)
    
    - MLM data augmentation : Masked Language Modeling 방식으로 학습 모델을 학습한 후에 새로운 문장의 일부에 마스킹을 적용하고 인퍼런스를 적용해 마스킹된 부분에 알맞는 새로운 토큰을 후보로 생성
    - shuffle : 단어의 순서를 임의로 바꾸어 데이터 증강

[데이터 증강 전/후]

![image](https://github.com/Euron-Project/hansoldeco-qa/assets/144101586/1af2772a-9430-4bcb-a2aa-8380c88059e9)

<br>

## 🖌️ 모델

- koGPT : gpt-3 기반 한국어 언어 생성모델
    - 대규모의 한국어 데이터를 바탕으로 구축되었다는 점에서 성능이 높을 것이라고 예상하여 사용
    - 리더보드 Private Score : 0.6356

- SOLAR 10.7B : 107억 파라미터를 가진 대규모 언어 모델
    - 거대언어모델(LLM)과 소형언어모델(SLM) 장점을 모두 갖추었다는 점에서 사용
    - 리더보드 Private Score : 0.7106

- gemma-2b : 구글 오픈소스 AI 모델
    - 대회 진행 당시 발표된 모델로, 호기심에 해봤는데 성능은 좋지 않았음. 7B모델이 아닌 2B모델을 사용했기에 성능이 좋지 않은 것으로 추정
    - 리더보드 Private Score : 0.6141
 
<br>

