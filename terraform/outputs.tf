output "vm_ip" {
  value = proxmox_vm_qemu.vmtest.default_ipv4_address
}