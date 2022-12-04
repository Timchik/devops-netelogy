1) В Linux команды ip a, ip link, ifconfig

![image](https://user-images.githubusercontent.com/42189764/205477122-6c962632-34f7-4551-84ea-b1754df91fc7.png)

В Windows  ipconfig

![image](https://user-images.githubusercontent.com/42189764/205477158-f601b7bd-1bf3-4e72-a5b0-f3b9d3618d07.png)

2) Протокол lldp, пакет для линукс lldpd. Команда lldpctl show
3) Технология используется VLAN 
    пакет для линукса также VLAN
    конфиги прописываются по адрессу /etc/network/interfaces

    ![image](https://user-images.githubusercontent.com/42189764/205506695-8872386e-dfc4-47da-985f-4e6d5d097da8.png)

4) В Linux существуют Team и Bonding. Балансировка нагрузки осуществляется в следующих режимах

0 - balance-rr - (round-robin)

1 - active-backup

2 - balance-xor

3 - broadcast

4 - 802.3ad - (dynamic link aggregation)

5 - balance-tlb - (adaptive transmit load balancing)

6 - balance-alb - (adaptive load balancing)


# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto bond0 eth0 eth1
# настроим параметры бонд-интерфейса
iface bond0 inet static
# адрес, маска, шлюз. (можно еще что-нибудь по вкусу)
        address 10.0.0.11
        netmask 255.255.255.0
        gateway 10.0.0.254
        # определяем подчиненные (объединяемые) интерфейсы
        bond-slaves eth0 eth1
        # задаем тип бондинга
        bond-mode balance-alb
        # интервал проверки линии в миллисекундах
bond-miimon 100
        # Задержка перед установкой соединения в миллисекундах
bond-downdelay 200
# Задержка перед обрывом соединения в миллисекундах
        bond-updelay 200
        
        
5) В сети с маской /29 8 IP адресов. Доступны для устройств - 6. Один адрес используется для сети и еще один для широковещательного запроса.
в сети 10.10.10.0/24 - доступно 32 подсети с маской /29
 10.10.10.0/29
 10.10.10.8/29
 10.10.10.16/29

6) 100.64.0.0/26

7) 
Ubuntu
ip neighbour show - показать ARP таблицу
ip neighbour del [ip address] dev [interface] - удалить из ARP таблицы конкретный адрес
ip neighbour flush all - очищает таблицу ARP
arp -a - показать ARP таблицу
arp -d * - очистить таблицу ARP
arp -d [ip address] - удалить из ARP таблицы конкретный адрес

Windows
arp -a - показать ARP таблицу
arp -d * - очистить таблицу ARP
arp -d [ip address] - удалить из ARP таблицы конкретный адрес
Также в линуксе работают команды  arp


