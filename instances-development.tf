## INSTANCES


## PRODUCTION-instances
resource "yandex_compute_instance" "development-instance-1" {
  name        = "development-instance-1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.cloud-subnetwork.id
    ip_address = "10.20.30.11"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}

resource "yandex_compute_instance" "development-instance-2" {
  name        = "development-instance-2"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.cloud-subnetwork.id
    ip_address = "10.20.30.12"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}

resource "yandex_compute_instance" "development-instance-3" {
  name        = "development-instance-3"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.cloud-subnetwork.id
    ip_address = "10.20.30.13"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}