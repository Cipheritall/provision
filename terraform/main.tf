resource "proxmox_vm_qemu" "vm" {
  name        = "debian-vm"
  target_node = "pve"
  clone       = "debian-template"

  cpu    = "host"
  cores  = 2
  memory = 4096

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    storage = "local-lvm"
    type    = "scsi"
    size    = "20G"
  }

  os_type       = "cloud-init"
  ssh_user      = "root"
  ssh_private_key = file("~/.ssh/id_rsa")
  cloudinit_cdrom_storage = "local-lvm"
}
