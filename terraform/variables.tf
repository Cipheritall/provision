
variable "proxmox_api_url" {
    type = string
}
variable "proxmox_api_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
    description = "Proxmox API token secret"
}