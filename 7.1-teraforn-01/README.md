# Домашнее задание к занятию "Введение в Terraform"

**/.terraform/*
.terraform*

*.tfstate
*.tfstate.*
personal.auto.tfvars


3.  JO9gMJA3GApKSL10
4.  Нужно добавить было имя image и исправить имя с "1nginx" на "nginx"
    
    ```

    resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {


    ```

5.  ![image](https://user-images.githubusercontent.com/42189764/229206578-a56f784e-7019-4e35-81fd-5518a66892d2.png)

6. Команда опасна тем, что применяет весь код без потдверждения
7. ![image](https://user-images.githubusercontent.com/42189764/229209990-853822bd-70cb-4895-b8b7-b4740f81246e.png)
8. По умолчанию terraform не удаляет образы, но если добавить флаг force_remove=true то при команде terafform destroy удалит 
   force_remove (Boolean) If true, then the image is removed forcibly when the resource is destroyed.