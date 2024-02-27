# Домашнее задание к занятию «Хранение в K8s. Часть 1»

### Задание 1 

**Что нужно сделать**

Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.
4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.
5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-netology-volume
  labels:
    app: deploy-vol
spec:
  replicas: 1
  selector:
    matchLabels:
      app: deploy-vol
  template:
    metadata:
      labels:
        app: deploy-vol
    spec:
      containers:
      - name: busybox
        image: busybox
        command: ['sh', '-c', 'while true; do echo "log -- $(date)" >> /logs/logs.txt; sleep 5; done']
        volumeMounts:
          - name: bu-mu
            mountPath: /logs
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
        volumeMounts:
          - name: bu-mu
            mountPath: /logs

      volumes:
      - name: bu-mu
        emptyDir: {}	
```

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/73e3c68f-e9cf-4b1a-a9a7-5bf633cdd334)


![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/cee17bba-9c68-4fbe-ab8e-9079be296785)

------

### Задание 2

**Что нужно сделать**

Создать DaemonSet приложения, которое может прочитать логи ноды.

1. Создать DaemonSet приложения, состоящего из multitool.
2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.
3. Продемонстрировать возможность чтения файла изнутри пода.
4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.

```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: daemonset-netology-read-log
  labels:
    app: node-logs
spec:
  selector:
    matchLabels:
      app: node-logs
  template:
    metadata:
      labels:
        app: node-logs
    spec:
      containers:
      - name: multitool
        image: wbitt/network-multitool
        volumeMounts:
        - name: var-log
          mountPath: /var/log
      volumes:
      - name: var-log
        hostPath:
          path: /var/log
          type: ""
```


![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/c7195f28-4c8f-450f-8611-cd78ec42e4a4)



------



