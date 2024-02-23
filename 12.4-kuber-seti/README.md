# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.
3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/375dd0b3-39e1-40b1-bfc3-d7c88918bf7f)



![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/9378ebec-ddf3-416d-bc7c-d4e42526f946)


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-netology
spec:
  replicas: 3
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
            value: "8080"
          - name: HTTPS_PORT
            value: "10443"
          ports:
          - containerPort: 8080
          - containerPort: 10443

```

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
      port: 9001
      targetPort: 80
    - name: multitool-http
      protocol: TCP
      port: 9002
      targetPort: 8080
    - name: multitool-https
      protocol: TCP
      port: 10443
      targetPort: 10443
```

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





------

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.



![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/a8ea06a4-45fc-465f-9082-a803d71a0937)

```
apiVersion: v1
kind: Service
metadata:
  name: service-node-port
spec:
  selector:
    app: deployment-netology
  ports:
    - name: nginx
      protocol: TCP
      port: 9001
      targetPort: 80
      nodePort: 30036
  type: NodePort
  externalIPs:
    - 192.168.49.2
```