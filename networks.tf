### NETWORKS SETTINGS

## Cloud PRODUCTION network
resource "yandex_vpc_network" "cloud-network" {
  name      = "cloud-network"
  folder_id = var.folder_id
}

## Cloud PRODUCTION subnetwork
resource "yandex_vpc_subnet" "cloud-subnetwork" {
  folder_id      = var.folder_id
  name           = "cloud-subnetwork"
  v4_cidr_blocks = ["10.20.30.0/24"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.cloud-network.id
  route_table_id = yandex_vpc_route_table.cloud-rt.id
}