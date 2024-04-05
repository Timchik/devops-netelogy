# Домашнее задание к занятию «Как работает сеть в K8s»

### Цель задания

Настроить сетевую политику доступа к подам.

### Чеклист готовности к домашнему заданию

1. Кластер K8s с установленным сетевым плагином Calico.

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Документация Calico](https://www.tigera.io/project-calico/).
2. [Network Policy](https://kubernetes.io/docs/concepts/services-networking/network-policies/).
3. [About Network Policy](https://docs.projectcalico.org/about/about-network-policy).

-----

### Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа

1. Создать deployment'ы приложений frontend, backend и cache и соответсвующие сервисы.
2. В качестве образа использовать network-multitool.
3. Разместить поды в namespace App.
4. Создать политики, чтобы обеспечить доступ frontend -> backend -> cache. Другие виды подключений должны быть запрещены.
5. Продемонстрировать, что трафик разрешён и запрещён.


![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/f12e6973-1b84-49b0-a31f-4fc75c14fe69)


![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/f6927a44-20c4-4dcc-9689-9d8ec75fd79b)

Применим политику запрета всего

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/a83b173b-4c21-49c1-b5dc-3dbd80b27140)

Разрешим от бекэнда к фронту

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/290d7f23-0c43-4617-8c6e-a9517492c303)

Разрешим от бекэнда к кэшу

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/c0b7ddef-46ec-40c2-8129-94a3df254117)