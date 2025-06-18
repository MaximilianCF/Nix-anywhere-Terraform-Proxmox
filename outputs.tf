output "vm_ip" {
  value = proxmox_vm_qemu.vm_cloudinit.ssh_host
}
