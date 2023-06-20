## DNS-zone
resource "yandex_dns_zone" "dns_domain" {
  name   = "devops-project"
  zone   = "devops-project.site."
  public = true
}

## DNS A-recordset *.dev.devops-project.site
resource "yandex_dns_recordset" "devops_project_recordset" {
  zone_id = yandex_dns_zone.dns_domain.id
  name    = "*.devops-project.site."
  type    = "A"
  ttl     = 200
  data    = [yandex_vpc_address.cloud-external-addr-nat.external_ipv4_address[0].address]
}