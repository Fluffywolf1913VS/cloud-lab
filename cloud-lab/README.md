# Cloud Lab — AWS, DevOps, Infrastructure & Security

This repository is my personal cloud infrastructure lab. It documents my hands-on learning path across AWS, Linux, Ansible, automation, virtualization, Proxmox, and cloud security.

The goal is to build a practical portfolio showing real commands, real troubleshooting, and deployable infrastructure projects.

---

## Current Sprint: Cloud Infrastructure

This sprint covers cloud fundamentals, AWS Cloud Practitioner preparation, Proxmox, cloud security, and infrastructure automation.

### Active modules

- **Cloud Fundamentals** — data centers, virtualization, containers, major cloud providers.
- **Cloud Security** — encryption, risk management, cloud contracts, security controls.
- **AWS Cloud Practitioner** — AWS core services, IAM, pricing, support, cloud concepts.
- **Proxmox** — architecture, VM lifecycle, storage, networking, users, maintenance.
- **Ansible Automation** — inventories, ad hoc commands, playbooks, roles, Jinja2 templates, and WordPress deployment.

---

## Featured Project

### Ansible WordPress Automation Lab

Location:

```text
ansible/ansible-wordpress-automation-lab/
```

End-to-end Ansible project covering:

- static inventories in INI and YAML;
- host groups and group variables;
- ad hoc commands;
- Apache and PostgreSQL playbooks;
- facts, conditions, loops, and tags;
- Jinja2 templating;
- Ansible roles;
- WordPress deployment on AWS EC2 with Nginx, MySQL, and PHP-FPM;
- troubleshooting AWS SSH, HTTP access, and security groups.

---

## Repository Structure

```text
cloud-lab/
├── ansible/
│   └── ansible-wordpress-automation-lab/
├── aws-cloud-practitioner/
├── cloud-fundamentals/
├── cloud-security/
├── proxmox/
├── projects/
└── docs/
```

---

## Roadmap

### AWS Cloud Practitioner

- AWS global infrastructure
- IAM basics
- EC2, S3, VPC, RDS overview
- Pricing, support, shared responsibility model
- Exam notes and flashcards

### Cloud Fundamentals

- Data center basics
- Virtualization vs containers
- AWS vs Azure vs GCP
- OpenStack and OVH notes

### Cloud Security

- Encryption basics
- Cloud risk management
- Shared responsibility model
- Security checklist for cloud deployments

### Proxmox

- Architecture
- VM management
- Storage and networking
- User and permission management
- Security and maintenance checklist

---

## Security Notice

This repository must never contain:

- `.pem` private keys;
- real cloud credentials;
- real passwords;
- Vault password files;
- production secrets.

All examples are for lab and portfolio purposes only.

---

## Author

Laurent Mandine

Aspiring SOC Analyst and Cloud Security learner, building hands-on projects across cybersecurity, cloud infrastructure, and automation.
