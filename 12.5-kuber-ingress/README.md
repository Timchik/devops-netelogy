# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool. 
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

------
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: netology-deployment-back
  labels:
    app: netology-back
spec:
  replicas: 1
  selector:
    matchLabels:
      app: netology-back
  template:
    metadata:
      labels:
        app: netology-back
    spec:
      containers:
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
apiVersion: apps/v1
kind: Deployment
metadata:
  name: netology-deployment-front
  labels:
    app: netology-front
spec:
  replicas: 3
  selector:
    matchLabels:
      app: netology-front
  template:
    metadata:
      labels:
        app: netology-front
    spec:
      containers:
      - name: nginx
        image: nginx:1.25.3
        ports:
        - containerPort: 80
```

```
apiVersion: v1
kind: Service
metadata:
  name: netology-svc-back
spec:
  selector:
    app: netology-back
  ports:
    - name: multitool-http
      protocol: TCP
      port: 8080
      targetPort: 8080
```


```
apiVersion: v1
kind: Service
metadata:
  name: netology-svc-front
spec:
  selector:
    app: netology-front
  ports:
    - name: nginx
      protocol: TCP
      port: 80
      targetPort: 80
```

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/fae96b34-ad69-4174-a73b-8e4d98845991)

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/3155dca4-3928-4de8-8836-b238633b3ed9)


### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
4. Предоставить манифесты и скриншоты или вывод команды п.2.

------

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/c54583c1-21a5-4854-bf63-fe988d3480bc)

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: netologty-ingress
spec:
  rules:
    - host: netology-123.ru
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: netology-svc-front
                port:
                  number: 80
          - path: /api
            pathType: Prefix
            backend:
              service:
                name: netology-svc-back
                port:
                  number: 8080
```

