## INSTANCES


## INFRA-instances
resource "yandex_compute_instance" "graylog-instance-1" {
  name        = "graylog-instance-1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.cloud-subnetwork.id
    ip_address = "10.20.30.20"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}

resource "yandex_compute_instance" "gitlab-runner-instance-1" {
  name        = "gitlab-runner-instance-1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.cloud-subnetwork.id
    ip_address = "10.20.30.21"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}

resource "yandex_compute_instance" "zabbix-instance-1" {
  name        = "zabbix-instance-1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.cloud-subnetwork.id
    ip_address = "10.20.30.22"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}