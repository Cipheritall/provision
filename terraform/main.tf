resource "proxmox_vm_qemu" "openHands" {
  name        = "openHands-vm-${formatdate("YYYYMMDDhhmm", timestamp())}"
  target_node = "sun"
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

  bootdisk = "virtio0"
  boot     = "order=ide2;virtio0"  # Ensure the VM boots from the ISO first

  disk {
    size     = "10G"
    type     = "scsi"
    storage  = "hdd4to"
    file    = "iso/debian-live-12.9.0-amd64-kde.iso"
  }

  sshkeys = <<EOT
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDToWVX12P1WF5vGWdXAWtZ9GPXVoNZMo1jQylMnS3XSStpUwz2HVVPni2klvJP/6+1KJ538TqBLTT4s06IvL+Yjgr0uJIIYx7CAmgEKDl9o3dxIIVywqgg82+ejng3kXl9vSgi7Blk3LJp2rttqNE/xTeomi2ilqppub4t20AiZfk/A21+iqo7FuQov2OgWj9u3x9xVxtkQ9S5AMO51HlsLoGmWeXcKlPViVSB47FMzJl/WUUvyfOTPfMUA3LngZB8XkcI/U+TPb0U9OXcatU1TPGLxWc1vFKb+GngSV2PZ+IoZ4Tn3nv5cQM1Xov+TpB2z7lCrEvD+I8TX9yhe3lPeEOCG/gmO572cTjXeiSIvWdJFX2bYEmTIiVOcu4IbzQAcQR8NmEzYV4oUNYbrY8nmqAOjV8Wa3hnfg/ZhjskL1vp5InmiPEARXrNlkhUvCqkzPI8fNkvJ3fj1qzkx6gxFQEGJzhsW38yPcxHFVYukG2rdKiICsLxPEHrUw76Oa8= run@GitRunners
EOT
}
output "container_credentials" {
    description = "Default login credentials"
    value = {
        root_password = "00221"
    }
}
