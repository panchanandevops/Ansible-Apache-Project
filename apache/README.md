# Apache Role

This Ansible role installs and configures the Apache HTTP Server (httpd or apache2) on Ubuntu and Red Hat systems.

## Requirements

- Ansible 2.9 or higher
- Python 3.x (for running Ansible)
- For Red Hat-based systems (EL platforms), the `dnf` or `yum` package manager must be available.
- For Ubuntu systems, the `apt` package manager must be available.
- If you are using EC2 instances, you may need the `boto` Python package to manage instances.

## Role Variables

This role uses several configurable variables. Below are the default variables, which can be overridden in your playbooks or inventory files.

### Default Variables (`defaults/main.yml`)

```yaml
apache_package: apache2        # Package name for Ubuntu (httpd for Red Hat-based systems)
apache_service: apache2       # Service name for Ubuntu (httpd for Red Hat-based systems)
```