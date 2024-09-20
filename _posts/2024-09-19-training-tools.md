---
title: 잡다한 모델 학습 tools
author: eunhye
date: 2024-09-19
categories: [Records, on Model Training]
tags: [wandb, nohub, tqdm]
---

### 1. nohub
```
nohup python {train_model.py} > {training_log.txt} 2>&1 &
```
- no hang up의 약자
- ```>``` 또는 ```>>```와 같은 리다이렉션을 이용해서 다른 파일에 출력
- ```&``` 를 프로그램 실행시에 명령어 맨 끝에 붙여주면 해당 프로그램이 백그라운드로 실행
```
ps -ef | grep python
kill -9 {PID}
```
- 위 명령어를 통해서 백그라운드로 돌고 있는 것을 확인
- 이 명령어로 ```nvidia-smi```으로 확인이 안되는 프로세스도 확인해서 kill할 수 있다. 

### 2. tqdm
Progress bar 이중으로 활용하기
- ```position``` 활용
- ```leave=False``` : 반복문 완료시 진행률 출력을 남기지 않음
```
for sub in tqdm(dir_path, desc="Total progress : ", position=0):
	for f in tqdm(os.listdir(dir_path), desc=f"{sub} : ", leave = False, position=1):
    	print(f)
```

### 3. wandb 

머신러닝 Experiment tracking tool
주로 모델의 학습 과정을 실시간으로 시각화하여 볼 수 있는 기능을 사용했다. 

- 머신러닝 모델 실험을 추적하기 위한 Dashboard 제공
- Data를 loging하여 W&B로 시각화하고 query하는 데 사용
- 실험을 document로 정리하여 collaborators와 공유


![](https://velog.velcdn.com/images/pehye89/post/5cdf73be-e699-4115-b117-a835fc6c3e24/image.png)


---
참고
- [[ubuntu] 프로세스 확인 명령어 PS](https://soundprovider.tistory.com/entry/ubuntu-%ED%94%84%EB%A1%9C%EC%84%B8%EC%8A%A4-%ED%99%95%EC%9D%B8-%EB%AA%85%EB%A0%B9%EC%96%B4-PS)
- [쉽게 설명한 nohup 과 &(백그라운드) 명령어 사용법](https://joonyon.tistory.com/entry/%EC%89%BD%EA%B2%8C-%EC%84%A4%EB%AA%85%ED%95%9C-nohup-%EA%B3%BC-%EB%B0%B1%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C-%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%82%AC%EC%9A%A9%EB%B2%95)
- [WandB란? - 강력한 MLOps Tool](https://pebpung.github.io/wandb/2021/10/06/WandB-1.html)
- [파이썬(Python) tqdm 사용법 알아보기](https://zephyrus1111.tistory.com/305)
