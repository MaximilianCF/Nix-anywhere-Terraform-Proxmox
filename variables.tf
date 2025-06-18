variable "pm_api_url" {
  type        = string
  description = "Endpoint da API do Proxmox"
}

variable "pm_user" {
  type        = string
  description = "Usuário para acessar o Proxmox"
}

variable "pm_password" {
  type        = string
  description = "Senha para acessar o Proxmox"
  sensitive   = true
}

variable "pm_node" {
  type        = string
  description = "Nome do node Proxmox"
}

variable "template_name" {
  type        = string
  description = "Nome do template cloud-init no Proxmox"
}

variable "pm_storage" {
  type        = string
  description = "Nome do storage onde salvar os discos"
}

variable "network_bridge" {
  type        = string
  description = "Bridge de rede do Proxmox"
}
