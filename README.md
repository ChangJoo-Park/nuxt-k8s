# nuxt-k8s

> My delightful Nuxt.js project

## Build Setup

``` bash
# install dependencies
$ npm run install

# serve with hot reload at localhost:3000
$ npm run dev

# build for production and launch server
$ npm run build
$ npm run start

# generate static project
$ npm run generate
```

For detailed explanation on how things work, checkout [Nuxt.js docs](https://nuxtjs.org).

## Minikube로 k8s 테스트

### DockerHub에 이미지를 올리지 않고 로컬에서 하려면

```bash
eval $(minikube docker-env) # minikube에서 할때
eval $(minikube docker-env -u) # 비활성화
```

### Docker 이미지 만들기

```bash
docker build -t app:0.1 .
```

### 도커 이미지로 실행해보기 (선택사항)

```bash
docker run --name app -p 3000:3000 app:0.1
```

### kubernetes 를 이용해서 Docker 이미지 실행하기

```bash
kubectl run app --image=app:0.1 --port=3000 --image-pull-policy=Never
```

### 배포 및 Kubernetes 상태 확인

```bash
kubectl get deployments # 배포상태 확인
kubectl get pods # Pods 확인
kubectl get events # 이벤트 확인
kubectl config view
```


### 외부에서 접근할 수 있도록 IP 노출하기

```bash
kubectl expose deployment app --type=LoadBalancer
```

### minikube로 실행하기

```bash
minikube service app
```

### 도커 이미지 업데이트

...코드 수정 후

```bash
docker build -t app:0.2
kubectl set image deployment/app app=app:0.2
```


### 기타

대시보드 보는 방법

```bash
minikube dashboard
```
