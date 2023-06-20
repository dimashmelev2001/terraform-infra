## Cloud PUBLIC-NAT subnetwork
#resource "yandex_vpc_subnet" "prod-public-subnet" {
#  folder_id      = var.folder_id
#  name           = "prod-public-subnet"
#  v4_cidr_blocks = ["10.20.50.0/24"]
#  zone           = "ru-central1-a"
#  network_id     = yandex_vpc_network.prod-network.id
#  route_table_id = yandex_vpc_route_table.production-rt.id
#}

## route table
resource "yandex_vpc_route_table" "cloud-rt" {
  name       = "cloud-route-table"
  network_id = yandex_vpc_network.cloud-network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "10.20.30.10"
  }
}

## static external IP for NAT-instance
resource "yandex_vpc_address" "cloud-external-addr-nat" {
  name = "cloud-nat-address"
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

# NAT-instance
resource "yandex_compute_instance" "cloud-nat-instance" {
  name        = "cloud-nat-instance"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8o8aph4t4pdisf1fio" # NAT-instance image from Marketplace
      size     = 10
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.cloud-subnetwork.id
    ip_address     = "10.20.30.10"
    nat            = true
    nat_ip_address = yandex_vpc_address.cloud-external-addr-nat.external_ipv4_address[0].address
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_path)}"
  }
}