# Домашнее задание к занятию "2. Применение принципов IaaC в работе с виртуальными машинами"

# Задача 1

Возможность один раз описать инфраструктуру и увеличивать ее по нажатию одной кнопки, уменьшение колличества ошибок при развертывании новой инфраструктуры

Основопологающий принцип IaaC обеспечение идемпотентности

# Задача 2

Ansble написан на python, поэтому для линукс систем является нативным, используется метод работы push и не требует дополинительных агентов
использует ssh  для настройки поэтому если в компании строгие acl, то не нужно дополнительно открывать порты
Низкий порог входа 

Более надежный метод я считаю push так как не нужны агенты

# Задача 3


```
[root@fedora ~]# vboxmanage --version
7.0.6r155176
[root@fedora ~]#

```


```
[root@fedora ~]# vagrant --version
Vagrant 2.2.19
[root@fedora ~]#

```

```
[root@fedora ~]# ansible --version
ansible [core 2.14.1]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.11/site-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.11.1 (main, Jan  6 2023, 00:00:00) [GCC 12.2.1 20221121 (Red Hat 12.2.1-4)] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
[root@fedora ~]#

```