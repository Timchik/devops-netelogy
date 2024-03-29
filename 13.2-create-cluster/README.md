# Домашнее задание к занятию «Установка Kubernetes»

### Цель задания

Установить кластер K8s.


### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция по установке kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/).
2. [Документация kubespray](https://kubespray.io/).

-----

### Задание 1. Установить кластер k8s с 1 master node

1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.
2. В качестве CRI — containerd.
3. Запуск etcd производить на мастере.
4. Способ установки выбрать самостоятельно.

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/c1896d2f-85a4-4a92-beef-9a22be5c9738)


![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/bf777624-c283-459a-8f87-67cb001d364b)


```
  sudo apt-get install -y apt-transport-https ca-certificates curl gpg
  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | \
  sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo apt-get update
  sudo apt-get install -y kubelet kubeadm kubectl
  sudo apt-mark hold kubelet kubeadm kubectl
  sudo apt install containerd -y

  kubeadm init --apiserver-advertise-address=10.0.0.17 --pod-network-cidr 10.244.0.0/16 --apiserver-cert-extra-sans=178.154.220.222
  export KUBECONFIG=/etc/kubernetes/admin.conf
```