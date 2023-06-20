variable "token" {
  type        = string
  description = "YandexCloud token"
}

variable "cloud_id" {
  type        = string
  description = "Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Folder ID"
}

variable "image_id" {
  type        = string
  description = "Image ID"
  default     = "fd89n8278rhueakslujo"
}

variable "ssh_path" {
  type        = string
  description = "Path to ssh-key"
  default     = "/id_ecdsa.pub"
}