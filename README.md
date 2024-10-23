# Ansible-Apache-Project

ssh -i .ssh/terraform_rsa ubuntu@34.227.142.246 

ssh -i .ssh/terraform_rsa ec2-user@3.86.35.96

ansible-playbook -i inventory.ini playbook.yaml

Here’s a comprehensive README file for your Ansible-Apache-Project. The goal is to make it clear, detailed, and professional while maintaining simplicity.

---

# 🚀 Ansible-Apache Project: Automating Apache HTTP Server Setup on AWS EC2

This project automates the deployment and configuration of the **Apache HTTP Server (httpd)** across AWS EC2 instances using **Ansible**. It supports both **Ubuntu** and **Amazon Linux** distributions. Additionally, Terraform is used to provision the EC2 instances.

## 📝 Project Structure

```bash
Ansible-Apache-Project
├── apache                          # Ansible role for Apache HTTPD configuration
│   ├── defaults
│   │   └── main.yml                # Default variables for the role
│   ├── files                       # Files to be deployed (empty in this case)
│   ├── handlers
│   │   └── main.yml                # Handlers to restart Apache service
│   ├── meta
│   │   └── main.yml                # Role metadata and supported platforms
│   ├── tasks
│   │   └── main.yml                # Main tasks for installing and configuring Apache
│   ├── templates                   # Jinja2 templates (empty in this case)
│   ├── tests
│   │   ├── inventory               # Test inventory for localhost testing
│   │   └── test.yml                # Test playbook for role testing
│   └── vars
│       └── main.yml                # Custom variables for package and service names
├── install_httpd.yaml              # Legacy playbook (deprecated, no longer used)
├── inventory.ini                   # Inventory file with EC2 instance details
├── playbook.yaml                   # Main playbook to execute the Apache role
├── README.md                       # This README file
└── terraform-ec2-setup             # Terraform setup for AWS EC2 provisioning
    ├── main.tf                     # Terraform configuration file for EC2 instances
    ├── terraform.tfstate           # Terraform state file (usually in .gitignore)
    └── variables.tf                # Terraform variables
```

## 🎯 Features

- **Ansible Playbooks & Roles:** Automates the installation and configuration of the Apache HTTP Server on both Ubuntu and Amazon Linux.
- **Cross-Platform Support:** The role is designed to work on both **Ubuntu** and **Amazon Linux** operating systems.
- **Terraform Automation:** EC2 instances are provisioned on AWS using Terraform.
- **Customizable Variables:** Apache package and service names can be customized via Ansible variables.
- **Modular Design:** The project follows Ansible best practices with a role-based structure.

## 🔧 Pre-Requisites

1. **Ansible** installed on your local machine (Ansible version >= 2.9).
2. **Terraform** installed (v1.3 or later).
3. **AWS Account** with IAM permissions to create EC2 instances.

## 🚀 Setup and Usage

### Step 1: Clone the Repository

```bash
git clone https://github.com/panchanandevops/ansible-apache-project.git
cd ansible-apache-project
```

### Step 2: Provision EC2 Instances Using Terraform

1. Navigate to the Terraform directory:

   ```bash
   cd terraform-ec2-setup
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Apply the Terraform configuration to provision EC2 instances:

   ```bash
   terraform apply
   ```

   - This will create two EC2 instances: one with **Ubuntu** and one with **Amazon Linux**.
   - SSH key pair for access is generated at `/.ssh/terraform_rsa`.

4. Ensure your private key file (`terraform_rsa`) has the correct permissions:

   ```bash
   chmod 600 ./.ssh/terraform_rsa
   ```


### Step 3: Configure Apache HTTP Server Using Ansible

1. Navigate back to the project root:

   ```bash
   cd ..
   ```

2. Update the `inventory.ini` file with your EC2 instance details (already done by Terraform output).

3. Run the Ansible playbook to install and configure Apache HTTP Server:

   ```bash
   ansible-playbook -i inventory.ini playbook.yaml
   ```

4. Apache will be installed and configured on both the Ubuntu and Amazon Linux instances.

### Step 4: Access the Apache HTTP Server

- Once the playbook completes successfully, you can access the Apache server via the public IPs of your EC2 instances:

   ```bash
   http://<ubuntu_instance_public_ip>
   http://<amazon_linux_instance_public_ip>
   ```

## 📁 Project Details

### Inventory File (`inventory.ini`)

The inventory file contains details about the EC2 instances:

```ini
[ubuntu]
ubuntu_instance ansible_host=<ubuntu_ip> ansible_user=ubuntu ansible_ssh_private_key_file=./terraform-ec2-setup/.ssh/terraform_rsa ansible_python_interpreter=/usr/bin/python3

[amazon_linux]
amazon_linux_instance ansible_host=<amazon_linux_ip> ansible_user=ec2-user ansible_ssh_private_key_file=./terraform-ec2-setup/.ssh/terraform_rsa ansible_python_interpreter=/usr/bin/python3
```

### Playbook (`playbook.yaml`)

This is the main playbook that applies the Apache role to the EC2 instances:

```yaml
---
- name: Configure Apache HTTP Server on EC2 instances
  hosts: all
  become: true
  roles:
    - apache
```

### Apache Role (`apache`)

The **Apache role** consists of tasks to install and configure the Apache HTTP Server. Key files include:

- `tasks/main.yml`: The main tasks for installing and starting Apache.
- `vars/main.yml`: Variables for the Apache package and service names.
- `handlers/main.yml`: Defines the handler for restarting the Apache service.

Happy automating with Ansible! 🎉