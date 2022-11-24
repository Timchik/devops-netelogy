1) Прочитал
2) Могут ли файлы, являющиеся жесткой ссылкой на один объект, иметь разные права доступа и владельца? Почему?

Так как hardlink это ссылка на тот же самый файл и имеет тот же inode то права будут одни и теже.

3) Новая ВМ

![image](https://user-images.githubusercontent.com/42189764/203837888-5ce14ec5-5b12-448f-9a58-cf15fb53e7c7.png)

4) Используя fdisk, разбейте первый диск на 2 раздела: 2 Гб, оставшееся пространство. 

![image](https://user-images.githubusercontent.com/42189764/203858045-dde90b45-2dd6-4d48-92e0-4de3c3343500.png)

5) Используя sfdisk, перенесите данную таблицу разделов на второй диск.

![image](https://user-images.githubusercontent.com/42189764/203858102-2c424b6b-9550-4078-9230-88572378c943.png)

6) Соберите mdadm RAID1 на паре разделов 2 Гб.

![image](https://user-images.githubusercontent.com/42189764/203858284-b6c15f6d-c5e8-4b2e-803b-a0e97b2aefed.png)

7) Соберите mdadm RAID0 на второй паре маленьких разделов.

![image](https://user-images.githubusercontent.com/42189764/203858354-7ef6a944-c70d-41ba-bba2-8cd8869270f8.png)

8) Создайте 2 независимых PV на получившихся md-устройствах.

![image](https://user-images.githubusercontent.com/42189764/203858472-9ae04346-ee93-4470-b206-8e94bd4a04f0.png)

9) Создайте общую volume-group на этих двух PV.

![image](https://user-images.githubusercontent.com/42189764/203858577-22971ec1-6b7c-4fa4-a958-6c57d0371c2d.png)

10) Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.

![image](https://user-images.githubusercontent.com/42189764/203858674-e2dfc50d-e229-4dc7-ad5e-25ad37c4f891.png)

11) Создайте mkfs.ext4 ФС на получившемся LV.

![image](https://user-images.githubusercontent.com/42189764/203858804-39923674-db2f-4a29-b7a5-956bfdb2eee0.png)

12) Смонтируйте этот раздел в любую директорию, например, /tmp/new


![image](https://user-images.githubusercontent.com/42189764/203858872-e751d9bb-cc8a-4d46-b986-3b587d75c6ba.png)

13) Поместите туда тестовый файл, например wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz

![image](https://user-images.githubusercontent.com/42189764/203858950-1f37f1a5-2005-4326-a5f0-3d2452102c0e.png)

14) Прикрепите вывод lsblk.

![image](https://user-images.githubusercontent.com/42189764/203859003-ae8c9ddb-c821-4006-bdc5-d86900305a98.png)

15) Протестируйте целостность файла:

![image](https://user-images.githubusercontent.com/42189764/203859081-b5ea00af-3fdf-4de8-8ccf-257819ec334c.png)

16) Используя pvmove, переместите содержимое PV с RAID0 на RAID1

![image](https://user-images.githubusercontent.com/42189764/203859220-dfa11524-d4e1-4b1a-a810-324199a49750.png)


17) Сделайте --fail на устройство в вашем RAID1 md.

![image](https://user-images.githubusercontent.com/42189764/203859330-4b3061e0-803a-4231-8327-87beae819e23.png)


18) Подтвердите выводом dmesg, что RAID1 работает в деградированном состоянии.

![image](https://user-images.githubusercontent.com/42189764/203859401-b72809f0-bd73-482d-8c67-c1410cff122f.png)

19) Протестируйте целостность файла, несмотря на "сбойный" диск он должен продолжать быть доступен:

![image](https://user-images.githubusercontent.com/42189764/203859504-6202b69b-9366-45f7-a268-7e316d737aa0.png)

20) Погасите тестовый хост, vagrant destroy

![image](https://user-images.githubusercontent.com/42189764/203859586-32ebb2da-f86e-4410-b702-e38a3ce0b710.png)
