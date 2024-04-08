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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCY7SYteJbN7Sg1ulemNt1+OwVyp0qzaoeG8FOB1JwLbyqdocU6Aqcd7xge/r3T0KJybQRudeK5ysDU5rCi8p7aTHYHA5K0Fo2aw1RXC0O4sXpDRowAaqFbR7e8Dw5enan4x2tlHR3gcVbQuIo0SfqguY3v1auh89oDoisOvbn4RGwBRFnaGLo7TDosVXfQ1u3Sl0lEhARYCsXwWA4qyE2NcdWsQGDj9bncxpkC+4FVPqwyemOFhsId+12N8DxWycNxylP3k+oRPDFPLYBymrgaVdNPZDiWDrpbE+4+7foJgwxNtrr4NqFb9+P5U/oaoCPYy733BbBnrJECfqsMHe3D"
}

variable "nat-instance-image-id" {
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "nat-instance-ip" {
  default = "192.168.10.254"
}

variable "ubuntu-20-04-lts" {
  default = "fd8b6qcrqbaqtnuumbph"
}

