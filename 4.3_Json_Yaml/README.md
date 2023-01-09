# Домашнее задание к занятию "4.3. Языки разметки JSON и YAML"
------

## Задание 1

Json
```
    { "info" : "Sample JSON output from our service\t",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : 7175 
            },
            { "name" : "second",
            "type" : "proxy",
            "ip : "71.78.22.43"
            }
        ]
    }
```

не хватало запятой и  в строке  "ip : "71.78.22.43"   не хватало кавычек

----

## Задание 2

В прошлый рабочий день мы создавали скрипт, позволяющий опрашивать веб-сервисы и получать их IP. К уже реализованному функционалу нам нужно добавить возможность записи JSON и YAML файлов, описывающих наши сервисы. Формат записи JSON по одному сервису: { "имя сервиса" : "его IP"}. Формат записи YAML по одному сервису: - имя сервиса: его IP. Если в момент исполнения скрипта меняется IP у сервиса - он должен так же поменяться в yml и json файле.

Скрипт

```bash
#!/usr/bin/env python3

import os
import socket
import time
import yaml
import json

srv = [ 'lost.ru', 'ardinvest.net', 'python.org']
check_list = [ ]
old_check = [ ]
dump_list = [ ]
for host in srv:
    check = socket.gethostbyname(host)
    check_list.append(check)
    old_check = check_list
while True:
    if check_list == old_check:
        check_list = []
        dump_list = [ ]
        for host in srv:
            check = socket.gethostbyname(host)              
            check_list.append(check)
            dump_list.append({ host : check })
        with open('export.yaml', 'w') as export_yaml:        
            yaml.dump(dump_list, export_yaml)   
            time.sleep(5)
        with open('export.json', 'w') as export_json:        
            json.dump(dump_list, export_json)   
            time.sleep(5)  
    else:      
        print ('ERROR ', old_check, srv, "IP missmatch", check_list, srv)
        break
```

Вывод в Json

![image](https://user-images.githubusercontent.com/42189764/211066483-6085d7e2-3da1-4b12-9545-2b00002fb670.png)


Вывод в YAML

![image](https://user-images.githubusercontent.com/42189764/211066728-97087600-4ec2-4c64-bdec-3e889a844d6f.png)
