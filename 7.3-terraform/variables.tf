###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9pxW4CoYhYXv0t1HyBTYbn6BsbzDDV/iLGcjZEQKbUqAa2dWzV+q7h69D5UrIbfSBmZff4IcMt1FGgeE7JraUdxrSUDTBD2mSN2OZZRvNkAdS10TwOsqZlr3cYx37AsKmfwTwviRXIIPubzPZtknYdNLpRWnWdZ2KRimgd2c4aR1BaonMpdNhGTW4y8xT8OMvf1cMS6zBTmd4POkWjKkRvxrrJcXyYLjdeXN3AOgL3YVhTiKxVGobT3G5w3IQpytNPHlIpMISHB6m61xj1C4Lf/8mkE/g3vEuFSygwNTv+BvwjMmHF825Yuj5SekCu6zV151GRxnqiSl11vNj8MsvYlbHSJbA2G8GeZdBoNTlwUQcoUJom3+yCN633uxDFa6W4VIuR6ZX7pguMAq+gUpWWezEhm67danRLruenQCU5E1rR3Ef/pFUhPMSadUS8/2cYshdP7g1L5NshvbAn9W6aUATg3Pk1exaflT7WhlQN9lDssw0RO4SqDmeiiM0Yuc="
}