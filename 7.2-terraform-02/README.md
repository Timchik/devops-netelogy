### Домашнее задание к занятию "Основы Terraform. Yandex Cloud"

1.
   Ошибка связана с тем что нет файла блокировки зависимостей. 
   т.е что бы terraform apply могли запускать по очереди
   Также при terraform apply была ошибка, что нужно использовать либо 2 либо 4 ядра процессора

![image](https://user-images.githubusercontent.com/42189764/231212894-e2eb7302-baef-4529-9dc5-49a87b3b416e.png)


![image](https://user-images.githubusercontent.com/42189764/231213208-5e269b08-fdf3-43fc-baa4-65c303e4003a.png)


   preemptible = true - то что ВМ прерываемая
   core_fraction=5 - гарантированая доля vcpu

2.
   Новые переменные
    
![image](https://user-images.githubusercontent.com/42189764/231224877-b7603fec-f04c-4f60-b079-d00a5fb7aa84.png)

    
    terraform plan 

    
![image](https://user-images.githubusercontent.com/42189764/231225067-ea6d3408-0a6b-47eb-a3da-294d125252bf.png)

4.
    
    
![image](https://user-images.githubusercontent.com/42189764/231235306-ec4ed3b2-75cb-437f-b770-d2a5fd41a4d7.png)


5.

![image](https://user-images.githubusercontent.com/42189764/231530362-6af39e59-4755-4f42-91d1-c4232dbd5b21.png)


![image](https://user-images.githubusercontent.com/42189764/231530417-b6bfe966-f516-4914-b070-7371409c52b9.png)

6.
   
![image](https://user-images.githubusercontent.com/42189764/231532960-e4751104-85d6-4e64-b897-f124d22e0e5b.png)

![image](https://user-images.githubusercontent.com/42189764/231533058-f4719821-3419-4fa4-88bf-bdd1c9df8029.png)
        

![image](https://user-images.githubusercontent.com/42189764/231533134-ec456d27-ecb2-48b2-957b-e9c5aad9bf50.png)
