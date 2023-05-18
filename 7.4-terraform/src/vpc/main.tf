resource "yandex_vpc_network" "develop" {
  name = var.env_name

}
resource "yandex_vpc_subnet" "subnet" {
  name           = var.env_name
  zone           = var.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.cidr] 
  
}
terraform {
  backend "s3" {
  endpoint = "storage.yandexcloud.net"
  bucket = "tfstate-tf04"
  key = "terraform.tfstate"
  region = "ru-central1-a"
  dynamodb_table = "tflock-develop" 
  dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g05nf3ef3hios4enr7/etnlc75pcbn1c0f714h5"
  skip_region_validation = true
  skip_credentials_validation = true
}
}