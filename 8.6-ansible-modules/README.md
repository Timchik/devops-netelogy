```
- name: Write a file
  hosts: localhost
  tasks:
  - name: Call my_own_module
    my_own_module:
      path: ./qwe.txt
      content: rty
```

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/7349889a-e408-467d-9266-eb093f41a39b)

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/a33a23a3-6567-4b1f-914b-6ee93edbbda2)

Плейбук идемпотентен

![image](https://github.com/YagudinTimur/devops-netelogy/assets/42189764/5dffd081-eb4a-4311-a158-121967da4abd)

Создал и установил коллекцию 
запустил плейбук
