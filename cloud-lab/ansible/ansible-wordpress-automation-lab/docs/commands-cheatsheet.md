# Ansible Commands Cheatsheet

## Inventory

```bash
ansible-inventory -i inventories/lab/inventory.ini --graph
ansible-inventory -i inventories/lab/inventory.ini -y --list > inventories/lab/inventory.yml
```

## Ad hoc commands

```bash
ansible all -i inventories/lab/inventory.yml -m ping
ansible all -i inventories/lab/inventory.yml -m setup -a "filter=ansible_memory_mb"
ansible all -i inventories/lab/inventory.yml -m copy -a "src=test.txt dest=/home/ubuntu/test.txt"
ansible all -i inventories/lab/inventory.yml -m command -a "df -h"
ansible all -i inventories/lab/inventory.yml -m shell -a "ss -tulpn | grep ':80'"
```

## Playbooks

```bash
ansible-playbook -i inventories/lab/inventory.yml labs/02-playbooks/datascientest-playbook.yml
ansible-playbook -i inventories/lab/inventory.yml labs/02-playbooks/master.yml
ansible-playbook -i inventories/lab/inventory.yml labs/02-playbooks/tags-demo.yml --list-tags
ansible-playbook -i inventories/lab/inventory.yml labs/02-playbooks/tags-demo.yml --tags web
ansible-playbook -i inventories/lab/inventory.yml labs/02-playbooks/tags-demo.yml --skip-tags web
```

## Roles

```bash
ansible-galaxy init wordpress
ansible-playbook -i inventories/lab/inventory.yml labs/04-roles/install_wordpress.yml
```

## Vault

```bash
ansible-vault encrypt group_vars/production.yml
ansible-playbook -i inventories/lab/inventory.yml labs/04-roles/install_wordpress.yml --ask-vault-pass
```
