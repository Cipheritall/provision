resource "proxmox_lxc" "ubuntu_container" {
    target_node = "sun"
    hostname = "observabilitao"
    ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
    password = "002210"
    vmid = "1010000"
    
    // Resource limits
    memory = 2048
    swap = 2024
    cores = 4
    
    // Root disk
    rootfs {
        storage = "local-lvm"
        size = "10G"
    }
    // Additional storage
    mountpoint {
        key = "data"
        slot = 0
        mp = "/mnt/data"
        size = "50G"
        storage = "hhd4to"
    }

    mountpoint {
        key = "logs"
        slot = 1
        mp = "/mnt/logs"
        size = "10G"
        storage = "hhd4to"
    }
    // Network configuration
    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "dhcp"
    }

    // add ssh keys
    ssh_public_keys = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2OAn/CdbuFZGfhZXJzG9dJ3UVDBfL4iCWWW/Ky2ezmoG4bh62aLQfcLOC3D3ea5jad6ph43g09PK7//G+TkSYcHDUM0LbyCCK/gjXrpl3YRJHNLp043hy9q7ZwLOJf7iBHAKol91Z1by7B92inGJRsmhIQOlLYNBrePMGbHGdBxYsI/1akJU7vUrR6OFHsxEEL+f/JhUsrynsruz8sOKkFtk+HVkXsODSz7Y2PagwX0AQndKsbA72yJfgxddhB3Vb6W8NEpIx+ZBOG/i3hnalQNBbPMeGTDZ3PpOtmJXIReX4WlAi9sWcKbDMVpz1P3Y2nmAHEhLzmExGIoiq9bj0U9k5qwN5WSympObXzLLsQEWJvCrBiAMNzGi7GxWAUNZ+EruVCCDuay/4q4A62MtHSWv8LyKJOBdKyRJt5D/3T1nHHmAZybZSmbgKnzjdD0yktfCZmZELvN7mqXGxmYyI386MXzmFeB6ly1YmZYW+pN0HGpiWuRNMDLgUL+/rylk= rick@ubuntu-24
    EOT

    // Basic container settings
    unprivileged = true
    start = true
    onboot = true
}

output "container_credentials" {
    description = "Default login credentials"
    value = {
        root_password = "00221"
    }
}
