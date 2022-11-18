1)  Создадим unit для node_exporter

![image](https://user-images.githubusercontent.com/42189764/202733635-3078e365-b2ab-40ad-98fb-0443f01d0add.png)

Дополнительно можно добавить файл с переменными 
EnvironmentFile=/etc/env_node_exporter

![image](https://user-images.githubusercontent.com/42189764/202733431-f7dac34c-82f5-4f82-acad-a65f5e01a747.png)

проверим рабоспособность

![image](https://user-images.githubusercontent.com/42189764/202733273-d6ba39a4-0854-4278-ac91-6b8bf30ec2e0.png)

2) Ознакомьтесь с опциями node_exporter и выводом /metrics по-умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети.

Выбрал бы 
CPU:
node_cpu_seconds_total{cpu="0",mode="idle"}               
node_cpu_seconds_total{cpu="0",mode="iowait"}
node_cpu_seconds_total{cpu="0",mode="user"} 
node_cpu_seconds_total{cpu="0",mode="system"} 

Memory:
node_memory_MemFree_bytes 

Disk:
node_disk_io_time_seconds_total{device="sda"} 
node_disk_write_time_seconds_total{device="sda"} 
node_disk_read_time_seconds_total{device="sda"}

Network:
node_network_receive_bytes_total{device="eth0"} 
node_network_receive_drop_total{device="eth0"}
node_network_transmit_bytes_total{device="eth0"}
node_network_transmit_drop_total{device="eth0"}

3) Установите в свою виртуальную машину Netdata. Воспользуйтесь готовыми пакетами для установки (sudo apt install -y netdata).

После успешной установки:

в конфигурационном файле /etc/netdata/netdata.conf в секции [web] замените значение с localhost на bind to = 0.0.0.0,
добавьте в Vagrantfile проброс порта Netdata на свой локальный компьютер и сделайте vagrant reload:
config.vm.network "forwarded_port", guest: 19999, host: 19999
После успешной перезагрузки в браузере на своем ПК (не в виртуальной машине) вы должны суметь зайти на localhost:19999. Ознакомьтесь с метриками, которые по умолчанию собираются Netdata и с комментариями, которые даны к этим метрикам.
![image](https://user-images.githubusercontent.com/42189764/202257507-79e97b8b-4f23-4e3c-8025-3905860b5303.png)


4) Можно ли по выводу dmesg понять, осознает ли ОС, что загружена не на настоящем оборудовании, а на системе виртуализации?
Да, даже понимает на какой системе для виртуализации работает 
![image](https://user-images.githubusercontent.com/42189764/202258342-09f5be02-4a8f-4820-8227-19ae6ee2354b.png)

5) Как настроен sysctl fs.nr_open на системе по-умолчанию? Определите, что означает этот параметр. Какой другой существующий лимит не позволит достичь такого числа (ulimit --help)?

По умолчанию настроена на 1048576 

Означает максимальное колличество открытых дескрипторов

Максимально для системы можно просмотреть 

cat /proc/sys/fs/file-max

![image](https://user-images.githubusercontent.com/42189764/202259998-5ea2e270-32b9-4c96-b675-2da38a7c6a12.png)

Лимит который не может быть увеличен

![image](https://user-images.githubusercontent.com/42189764/202260802-bfa31d87-1656-41b3-adab-a228e00c5cc2.png)

6) Запустите любой долгоживущий процесс (не ls, который отработает мгновенно, а, например, sleep 1h) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через nsenter. Для простоты работайте в данном задании под root (sudo -i). Под обычным пользователем требуются дополнительные опции (--map-root-user) и т.д.

![image](https://user-images.githubusercontent.com/42189764/202262489-5dc5995c-fb73-4308-a7c5-b99c0744c1bf.png)

![image](https://user-images.githubusercontent.com/42189764/202262555-cbf214d5-cb58-4de9-8259-90cd8b1d3159.png)

7) Найдите информацию о том, что такое :(){ :|:& };:. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (это важно, поведение в других ОС не проверялось). Некоторое время все будет "плохо", после чего (минуты) – ОС должна стабилизироваться. Вызов dmesg расскажет, какой механизм помог автоматической стабилизации.
Как настроен этот механизм по-умолчанию, и как изменить число процессов, которое можно создать в сессии?

:() создадим функцию:

{:|: &}является :телом функции. Он вызывает функцию :рекурсивно и отправляет (направляет) ее вывод другому вызову :. И &означает, что созданный процесс должен работать в фоновом режиме.

Разделитель ;команд.

 :запускает функцию в первый раз.

В итоге создаем рекурсивную функцию которая вызывает сама себя

А восстановило судя по всему ограничение на колличество запущенных процессов

![image](https://user-images.githubusercontent.com/42189764/202264093-97496293-8cb3-4e79-b718-2817679f4e68.png)


По умолчанию сработало ограничение на 3554 процесса запущенных от одного пользователя
![image](https://user-images.githubusercontent.com/42189764/202740274-da69c159-a5f7-47b0-a269-61b62ac523c2.png)

можно изменить ulimit -u 100 
Задаст максмиальное колличество запущенных процессов одного пользователя 100

![image](https://user-images.githubusercontent.com/42189764/202740594-2564286b-f0fb-4b10-8e10-3f2575ec527c.png)

