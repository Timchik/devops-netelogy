# Домашнее задание к занятию "4.2. Использование Python для решения типовых DevOps задач"

------

## Задание 1

Есть скрипт:
```
#!/usr/bin/env python3
a = 1
b = '2'
c = a + b
```
Какое значение будет присвоено переменной c?
Как получить для переменной c значение 12?
Как получить для переменной c значение 3?

1) с - будет ошибка так как попытка сложить целочисленное и строку
2) Что бы получить с = 12, надо переменную "а"  преобразовать в строку
3) Что бы получить с = 3, надо переменную "b" преобразовать в целочисленное 
----

## Задание 2

Мы устроились на работу в компанию, где раньше уже был DevOps Engineer. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории, относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся.

Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?
```bash
#!/usr/bin/env python3

import os

bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
        break
```

### Ваш скрипт:
```bash
#!/usr/bin/env python3

import os

bash_command = ["cd /home/timur/netology/devops-netelogy/", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('изменено') != -1:
        prepare_result = result.replace('\tизменено:   ', '')
        print(prepare_result)
```

```
[timur@fedora Python]$ ./2.py 
   4.1_Bash/README.md
   4.2_Python/README.md
[timur@fedora Python]$ ./2.py 
   4.2_Python/README.md
```

---

## Задание 3

Доработать скрипт выше так, чтобы он не только мог проверять локальный репозиторий в текущей директории, но и умел воспринимать путь к репозиторию, который мы передаём как входной параметр. Мы точно знаем, что начальство коварное и будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.

### Ваш скрипт:
```bash
#!/usr/bin/env python3

import os


a = input("Введите путь до каталога ")
bash_command = ["cd " + a, "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('изменено') != -1:
        prepare_result = result.replace('\tизменено:   ', '')
        print(prepare_result)
        
```

---
## Задание 4

Наша команда разрабатывает несколько веб-сервисов, доступных по http. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис.

Проблема в том, что отдел, занимающийся нашей инфраструктурой очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков.

Мы хотим написать скрипт, который:

опрашивает веб-сервисы,
получает их IP,
выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>.
Также, должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена - оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: drive.google.com, mail.google.com, google.com.

### Ваш скрипт:
```bash
#!/usr/bin/env python3

import os
import socket
import time

srv = [ 'lost.ru', 'ardinvest.net', 'python.org']
check_list = [ ]
old_check = [ ]

for host in srv:
    check = socket.gethostbyname(host)
    check_list.append(check)
    old_check = check_list
while True:
    if check_list == old_check:
        check_list = []
        for host in srv:
            check = socket.gethostbyname(host)
            check_list.append(check)
            time.sleep(2) 
    else:      
        print ('ERROR ', old_check, srv, "IP missmatch", check_list, srv)
        break
```
![image](https://user-images.githubusercontent.com/42189764/210388097-b072a797-f565-4a7b-a60f-3ee2b31f2d3d.png)
---

Проверку осуществил тем что в процессе работы скрипта, внес изменения в файл hosts