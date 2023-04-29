resource "yandex_compute_disk" "default" {
  name     = "disk-${count.index}"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size = 1
  count = 3
}







