resource "proxmox_vm_qemu" "openHands" {
  name        = "debian-vm"
  target_node = "pve"
  vmid        = 200
  memory      = 4096
  cores       = 2
  cpu         = "host"
  disk {
    size       = "40G"
    type       = "virtio"
    storage    = "local-lvm"
  }
  network {
    model      = "virtio"
    bridge     = "vmbr0"
  }
  boot        = "cdn"
  bootdisk    = "virtio0"
  iso         = "local:iso/debian-live-12.9.0-amd64-kde.iso"
}