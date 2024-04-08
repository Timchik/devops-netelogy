# Домашнее задание к занятию Troubleshooting

### Цель задания

Устранить неисправности при деплое приложения.

### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.
3. Исправить проблему, описать, что сделано.
4. Продемонстрировать, что проблема решена.

Нет необходимых неймспейсов

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/43a1033c-ce01-4bac-9b66-73aa6b65dd5f)


Теперь не резолвится БД

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/0b230257-37d3-4430-8c02-c5bec9caaf23)


Как видно из скриншота выше, поды находятся в разных неймспейсах
Исравим доменное имя на auth-db.svc.cluster.local

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/c20f1f17-7915-41aa-96e9-a79a0b399561)

