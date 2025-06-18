terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.50.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.pm_api_url
  username = var.pm_user
  password = var.pm_password
  insecure = true  # ou false, se tiver cert valido
}

resource "proxmox_vm_qemu" "vm_cloudinit" {
  name        = "vm-terraform-test"
  desc        = "VM criada via Terraform com cloud-init"
  target_node = var.pm_node
  clone       = var.template_name
  pool        = "terraform"

  cores       = 2
  memory      = 2048
  sockets     = 1
  disk {
    size    = "10G"
    storage = var.pm_storage
    type    = "scsi"
  }

  network {
    model  = "virtio"
    bridge = var.network_bridge
  }

  ssh_keys = file("~/.ssh/id_rsa.pub")  # chave local
  ciuser   = "root"
  cipassword = ""  # pode deixar em branco se usar só SSH

  cloudinit_cdrom_storage = var.pm_storage
  os_type = "cloud-init"

  ipconfig0 = "ip=dhcp"

  onboot = true
}
