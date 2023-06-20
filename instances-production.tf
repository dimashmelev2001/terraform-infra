## INSTANCES


## PRODUCTION-instances
resource "yandex_compute_instance" "production-instance-1" {
  name        = "production-instance-1"
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
    ip_address = "10.20.30.30"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}

resource "yandex_compute_instance" "production-instance-2" {
  name        = "production-instance-2"
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
    ip_address = "10.20.30.31"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}

resource "yandex_compute_instance" "production-instance-3" {
  name        = "production-instance-3"
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
    ip_address = "10.20.30.32"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}