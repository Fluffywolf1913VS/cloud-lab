# Setup guide

## Prerequisites

- Ubuntu control node
- Ansible installed
- SSH private key available on the control node
- Ubuntu target nodes reachable over SSH
- Port 80 opened in the target node Security Group when using AWS

## Connectivity test

```bash
ansible all -i inventories/lab/inventory.yml -m ping
```

## Inventory graph

```bash
ansible-inventory -i inventories/lab/inventory.yml --graph
```

## WordPress deployment

```bash
ansible-playbook -i inventories/lab/inventory.yml labs/04-roles/install_wordpress.yml
```

## Browser access

Open:

```text
http://PUBLIC_IP_OF_WORDPRESS_TARGET
```
