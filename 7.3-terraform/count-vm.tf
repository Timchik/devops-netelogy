data "yandex_compute_image" "ubuntu-2004-lts" {
  family = "ubuntu-2004-lts"
}
resource "yandex_compute_instance" "example" {
  name        = "count-vm-${count.index}"
  platform_id = "standard-v1"
  
  count = 1

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = 5
    }   
  }


 dynamic "secondary_disk" {
  for_each = range(3)
  content {
     disk_id = yandex_compute_disk.default[secondary_disk.value].id
    }
  }


  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }
  
  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true

}