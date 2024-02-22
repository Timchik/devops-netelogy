# Домашнее задание к занятию «Запуск приложений в K8S»


### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
2. После запуска увеличить количество реплик работающего приложения до 2.
3. Продемонстрировать количество подов до и после масштабирования.
4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/9f1d40bb-64a2-4eb0-bb40-cf1f36993f13)

Ошибка в занятом порте 80

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-netology
spec:
  replicas: 1
  selector:
    matchLabels:
      app: deployment-netology
  template:
    metadata:
      labels:
        app: deployment-netology
    spec:
      containers:
        - name: nginx
          image: nginx
          ports:
            - containerPort: 80
        - name: multitool
          image: wbitt/network-multitool
          env:
          - name: HTTP_PORT
            value: "1080"
          - name: HTTPS_PORT
            value: "10443"

```

### Изменим количество реплик до двух:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-netology
spec:
  replicas: 2
  selector:
    matchLabels:
      app: deployment-netology
  template:
    metadata:
      labels:
        app: deployment-netology
    spec:
      containers:
        - name: nginx
          image: nginx
          ports:
            - containerPort: 80
        - name: multitool
          image: wbitt/network-multitool
          env:
          - name: HTTP_PORT
            value: "1080"
          - name: HTTPS_PORT
            value: "10443"

```

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/818bfe28-de6a-40f7-a6b5-44065a68a263)


Создадим service 

```
apiVersion: v1
kind: Service
metadata:
  name: service-netology
spec:
  selector:
    app: deployment-netology
  ports:
    - name: nginx
      protocol: TCP
      port: 80
      targetPort: 80
    - name: multitool-http
      protocol: TCP
      port: 1080
      targetPort: 1080
    - name: multitool-https
      protocol: TCP
      port: 10443
      targetPort: 10443
  type: LoadBalancer
  externalIPs:
    - 192.168.49.2

```

Создадим Pod

```
apiVersion: v1
kind: Pod
metadata:
  name: multitool-netology
  labels:
    app: multitool-netology
spec:
  containers:
  - name: multitool-netology
    image: wbitt/network-multitool
    env:
      - name: HTTP_PORT
        value: "2080"
      - name: HTTPS_PORT
        value: "20443"
    ports:
    - containerPort: 2080
    - containerPort: 20443
```

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/9e69f016-53f9-4cce-aa83-f8a0fdb7bd2a)


------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
3. Создать и запустить Service. Убедиться, что Init запустился.
4. Продемонстрировать состояние пода до и после запуска сервиса.

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/85c66778-4480-475c-a3c5-3f3da2d4c51a)


```
apiVersion: v1
kind: Service
metadata:
  name: service-init
spec:
  selector:
    app: deploy-init
  ports:
    - name: nginx
      protocol: TCP
      port: 80
      targetPort: 80

```


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deploy-init
  labels:
    app: deploy-init
spec:
  replicas: 1
  selector:
    matchLabels:
      app: deploy-init
  template:
    metadata:
      labels:
        app: deploy-init
    spec:
      initContainers:
      - name: busybox
        image: busybox
        command: ['sh', '-c', 'until nslookup service-init.default.svc.cluster.local; do echo waiting for service-init; sleep 2; done;']

      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80

```