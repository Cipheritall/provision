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

  os_type                  = "cloud-init"
  cloudinit_cdrom_storage  = "local-lvm"
  sshkeys                  = <<EOT
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDToWVX12P1WF5vGWdXAWtZ9GPXVoNZMo1jQylMnS3XSStpUwz2HVVPni2klvJP/6+1KJ538TqBLTT4s06IvL+Yjgr0uJIIYx7CAmgEKDl9o3dxIIVywqgg82+ejng3kXl9vSgi7Blk3LJp2rttqNE/xTeomi2ilqppub4t20AiZfk/A21+iqo7FuQov2OgWj9u3x9xVxtkQ9S5AMO51HlsLoGmWeXcKlPViVSB47FMzJl/WUUvyfOTPfMUA3LngZB8XkcI/U+TPb0U9OXcatU1TPGLxWc1vFKb+GngSV2PZ+IoZ4Tn3nv5cQM1Xov+TpB2z7lCrEvD+I8TX9yhe3lPeEOCG/gmO572cTjXeiSIvWdJFX2bYEmTIiVOcu4IbzQAcQR8NmEzYV4oUNYbrY8nmqAOjV8Wa3hnfg/ZhjskL1vp5InmiPEARXrNlkhUvCqkzPI8fNkvJ3fj1qzkx6gxFQEGJzhsW38yPcxHFVYukG2rdKiICsLxPEHrUw76Oa8= run@GitRunners
EOT
}