
# Active Directory Lab Setup Using VirtualBox

![Lab Banner](https://github.com/AmiliaSalva/ActiveDirectoryLab/assets/132176058/dcbbd122-9cf7-42af-9513-841eb780f96f)

## Overview

This project simulates a basic Active Directory (AD) environment using Oracle VirtualBox. It includes a Windows Server 2019 domain controller and a Windows 10 client VM. The goal is to explore key AD features like user management, DHCP, OU creation, routing, and automation through PowerShell.

## Key Objectives

![Objectives](https://github.com/AmiliaSalva/ActiveDirectoryLab/assets/132176058/77004a99-0187-4cf5-8bf4-0ecfc373c4ec)

- Install and configure Active Directory Domain Services (AD DS)
- Create a secure Domain Admin account
- Set up a DHCP server
- Build and manage Organizational Units (OUs)
- Configure Routing and Remote Access
- Enable dual NIC setup for isolated internal and external communication
- Use PowerShell to batch-add over 1000 users

## Tools

- Oracle VirtualBox
- Windows Server 2019 ISO
- Windows 10 ISO
- PowerShell

## VM Configuration

1. **Create Two VMs in VirtualBox**:
   - `DC`: Windows Server 2019, 2GB RAM, 50GB disk
   - `CLIENT`: Windows 10, similar configuration

2. **Attach ISOs** and install each OS.

3. **Configure NICs for DC**:
   - **NIC 1**: NAT for internet access
   - **NIC 2**: Internal network for lab communication

## Active Directory Installation

- Launch Server Manager → Add Roles and Features → Select AD DS → Complete setup.

![AD Setup](https://github.com/AmiliaSalva/ActiveDirectoryLab/assets/132176058/5877e1da-97c1-4d92-86ce-1c09d133d956)

## Domain Admin Account

- Open AD Users and Computers → New User → Assign a strong password.

![Admin User](https://github.com/AmiliaSalva/ActiveDirectoryLab/assets/132176058/67547c2b-797c-4ca2-b4d1-b1a71897ad13)

![Account Setup](https://github.com/AmiliaSalva/ActiveDirectoryLab/assets/132176058/4d16f5ae-3b6c-4ca8-be5a-ff8476ba66b4)

## DHCP Server Setup

- Add DHCP role from Server Manager.

## Create an OU

- In ADUC → New → Organizational Unit → Name it `_USERS`.

## Routing and Remote Access

- Enable Routing role and configure for internal use.

## Network Configuration

- Go to Network Settings → Adapter Settings → Assign Internet to NIC1.

## Batch Add Users with PowerShell

Use the script `BulkAddUserScript.ps1` and a `names.txt` list.

### Script Highlights

- Sets a default password for all users
- Reads names from file
- Converts password securely
- Creates an OU (`_USERS`)
- Adds users with username format: `jdoe` for John Doe

![Creating User](https://github.com/AmiliaSalva/ActiveDirectoryLab/assets/132176058/553bc266-6f88-4045-895b-77a72ed508bc)

## Final Verification

- Join Windows 10 client to the domain
- Log in using one of the created accounts to verify AD functionality

![Client Logon](https://github.com/AmiliaSalva/ActiveDirectoryLab/assets/132176058/a734965e-cfdf-40f3-9c54-a313a185213b)

## Conclusion

This lab provides foundational knowledge of AD setup, networking, and user automation. While simplified, it mirrors many concepts used in enterprise environments and is a great springboard for further exploration of GPOs, multi-site AD, or Azure AD integration.
