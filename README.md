
# Active Directory Lab Setup Using VirtualBox

![Lab Banner](https://github.com/AmiliaSalva/ActiveDirectoryLab/assets/132176058/dcbbd122-9cf7-42af-9513-841eb780f96f)

## Overview

This project simulates a basic Active Directory (AD) environment using Oracle VirtualBox. It includes a Windows Server 2019 domain controller and a Windows 10 client VM. The goal is to explore key AD features like user management, DHCP, OU creation, routing, and automation through PowerShell.

## Key Objectives

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

## Domain Admin Account

- Open AD Users and Computers → New User → Assign a strong password.

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

## Final Verification

- Join Windows 10 client to the domain
- Log in using one of the created accounts to verify AD functionality

## Conclusion

This lab provides foundational knowledge of AD setup, networking, and user automation. While simplified, it mirrors many concepts used in enterprise environments and is a great springboard for further exploration of GPOs, multi-site AD, or Azure AD integration.
