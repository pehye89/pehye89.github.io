---
title: CS Seminar 02
date: 2024-09-26
categories: [CS, C]
tags: [CS, function, stack overflow, stack, heap]
description: 함수 (함수를 만드는 이유, call stack, stack overflow)
---

### 1. 함수를 정의하고 선언하기
프로그램 : data, function that manipulates data

- 함수를 정의할 때, 데이터가 있어야 가능하기 때문에데이터랑 연관이 없는 함수는 무의미하다.

함수를 왜 만들어야할까?

1. 재사용을 할 필요가 있을 때
  - 재사용을 하려면 일반적인 형태를 띄고 있는 것(=범용적인)이 좋다.
2. 유지보수 측면에서 수정을 할 때 용이하다.  

예시 : 만약 A.cpp에서 B라는 함수를 불러오기 위해서는 B가 어떤 형태인지를 알아야한다.

- 여기서 defin과 declaration의 차이가 또 중요해지는데, 만약 컴파일러가 소스코드를 한 번만 흝는다면, define보다 declaration이 먼저 나오게되면 문제가 발생할 것이다.

### 2.변수의 존재기간과 접근범위 : 지역변수

(function) call stack의 개념

- 메모리랑 연관되어있다.
- 만약 executable 이 실행이 된다면, 소스코드가 메모리에 탑재가 된다.

메모리 : stack, heap

- stack : 지역변수
- heap : 동적할당

Stack Overflow

1. 너무 많은 함수를 stack에 할당했을 때
2. 너무 큰 용량의 함수, 즉 지역변수를 너무 크게 할당했을 때
   - 이 경우에 일부러 heap에 동적할당을 함으로써 stack overflow를 방지하는 것이다.
  
Heap 

- x86 머신에서 최대로 사용할 수 있는 메모리양은 약 4GB ($2^{32}$)
- pointer가 32bit -> 주소가 32bit 라는 의미 -> 그렇기 때문에 최대가 32bit인 것이다. 

### 3. 변수의 존재기간과 접근범위 : 전역변수, static 변수

전역변수를 선언하기 위한 키워드 - static, 함수 밖에 선언

- static은 대부분 A가 없어져도 남아있으며, 해당 함수를 몇번 사용했는지를 count할 때 주로 사용한다.
  
### 4. 재귀함수에 대한 이해

- 위와 같은 이유들로 재귀함수의 사용을 최소화해야한다.
- 마치 피보나치 수열을 재귀적으로 표현하면 간단해도, 풀어서 설명하는 것이 가능하듯이 피하는 것이 좋다

---

윤성우의 열혈 C 프로그래밍 일부 : Chapter 09

추후 더 공부하며 추가할 예정
