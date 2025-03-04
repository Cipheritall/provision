# Repository: Proxmox-Terraform-Ansible

## Overview
A GitHub project to provision and manage Proxmox VMs using Terraform and Ansible.

## Project Structure
```
proxmox_tf_ansible/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── terraform.tfvars.example
├── ansible/
│   ├── inventory.ini
│   ├── playbook.yml
│   ├── roles/
│   │   ├── common/
│   │   │   ├── tasks/main.yml
│   │   │   ├── handlers/main.yml
│   │   │   ├── templates/
│   ├── group_vars/
│   ├── host_vars/
├── README.md
```

## Usage
1. **Terraform**: Deploy Proxmox resources
   ```sh
   cd terraform
   terraform init
   terraform apply
   ```

2. **Ansible**: Configure provisioned VMs
   ```sh
   cd ansible
   ansible-playbook -i inventory.ini playbook.yml
   ```

## Requirements
- Proxmox API access
- Terraform installed
- Ansible installed

## Future Enhancements
- Add dynamic inventory for Ansible
- Implement Proxmox HA configurations
- Secure credentials handling
