resource "yandex_compute_instance" "nat-instance" {
  name     = "nat-instance"
  hostname = "nat-instance"
  zone     = var.default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.nat-instance-image-id
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-public.id
    ip_address = var.nat-instance-ip
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }
  
  scheduling_policy { preemptible = true }
}

resource "yandex_compute_instance" "public-vm" {
  name     = "public-vm"
  hostname = "public-vm"
  zone     = var.default_zone

  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = var.ubuntu-20-04-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-public.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }
  
  scheduling_policy { preemptible = true }
}

resource "yandex_compute_instance" "private-vm" {
  name     = "private-vm"
  hostname = "private-vm"
  zone     = var.default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.ubuntu-20-04-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-private.id
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }
  
  scheduling_policy { preemptible = true }
}