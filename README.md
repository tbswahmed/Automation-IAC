# Vmware-Vm Automation for CUMULUS Project

## Overview
This project focuses on fully automating the creation and customization of Virtual Machines (VMs) (Linux and Windows) on the VMware platform, providing users with extensive customization options. Below is a detailed guide on how to automate the process for Linux VMs using Terraform, Cloud-Init, and Vault.

## Getting Started
Here’s a detailed view of the repository structure:

- `ansible/`
  - `linux-vmware-vm.yml`
  - `terraform.tfvars.j2`
- `collections/`
  - `requirements.yml`
- `README.md`
- `terraform/`
  - `data.tf`
  - `main.tf`
  - `output.tf`
  - `templates/`
    - `metadata.yaml`
    - `userdata.yaml`
  - `terraform.tfvars`
  - `variables.tf`
  - `versions.tf`

### Directory Descriptions

- **`ansible/`**: Contains Ansible configuration files for provisioning and managing infrastructure.
  - **`linux-vmware-vm.yml`**: An Ansible playbook to configure Linux virtual machines in a VMware environment.
  - **`terraform.tfvars.j2`**: A Jinja2 template file for generating `terraform.tfvars` with dynamic variables.

- **`collections/`**: Contains additional Ansible dependencies.
  - **`requirements.yml`**: Specifies external Ansible collections required for this setup.

- **`terraform/`**: Contains Terraform configuration files used for defining infrastructure as code (IaC).
  - **`data.tf`**: Defines any data sources Terraform may need.
  - **`main.tf`**: The primary Terraform configuration file where main infrastructure resources are defined.
  - **`output.tf`**: Specifies outputs to display once the Terraform run completes.
  - **`templates/`**: Stores cloud-init configuration files.
    - **`metadata.yaml`** and **`userdata.yaml`**: Templates for instance metadata and user data (for cloud-init).
  - **`terraform.tfvars`**: Holds variable values specific to this environment.
  - **`variables.tf`**: Defines variables for the Terraform configuration.
  - **`versions.tf`**: Specifies required provider and Terraform versions for compatibility.


## 3. Cloud-Init Configuration
The customization of VMs is handled via Cloud-Init, which runs scripts during the VM's boot process to configure the system.

Cloud-Config Files: Two main files are used for VM customization:
metadata.yaml: Defines system settings such as network configuration, timezone, and more.
userdata.yaml: Configures user details, including username, password, groups, and SSH access.
## 4. Securing Credentials with Vault
Vault is used to secure and retrieve the credentials required for connecting to the VMware infrastructure.

Terraform uses the Vault provider to request and securely access the connection credentials stored in the Vault server.
## 5. VM Provisioning Overview
Once Terraform is configured, it automates the following VM setup tasks:

Attaching additional disks to the VM on demand.
Configuring network settings.
Attaching disks post-VM creation.
Adding a user with sudo privileges, setting up a password, and enabling SSH access.

Useful Links
vSphere Provider Documentation : https://registry.terraform.io/providers/hashicorp/vsphere/2.9.1/docs/resources/virtual_machine
Cloud-Init Documentation : https://cloudinit.readthedocs.io/en/latest/
User and Group Management : https://cloudinit.readthedocs.io/en/0.7.8/topics/examples.html#including-users-and-groups
Network Configuration : https://cloudinit.readthedocs.io/en/latest/reference/network-config-format-v1.html 

## Collaborate with your team

- [ ] [Invite team members and collaborators](https://docs.gitlab.com/ee/user/project/members/)
- [ ] [Create a new merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)
- [ ] [Automatically close issues from merge requests](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)
- [ ] [Enable merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)
- [ ] [Set auto-merge](https://docs.gitlab.com/ee/user/project/merge_requests/merge_when_pipeline_succeeds.html)
## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
