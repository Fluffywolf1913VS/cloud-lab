# 01 — Ad hoc Ansible commands

Ad hoc commands are one-line commands used for quick checks or one-time actions.

Syntax:

```bash
ansible [pattern] -i [inventory] -m [module] -a "[module options]"
```

## Connectivity

```bash
ansible all -i ../../inventories/lab/inventory.yml -m ping
```

## Copy a file to all hosts

```bash
echo "Copied with Ansible" > datascientest.txt
ansible all -i ../../inventories/lab/inventory.yml -m copy -a "src=datascientest.txt dest=/home/ubuntu/datascientest.txt"
ansible all -i ../../inventories/lab/inventory.yml -m command -a "cat /home/ubuntu/datascientest.txt"
```

## Facts with setup

```bash
ansible all -i ../../inventories/lab/inventory.yml -m setup -a "filter=ansible_memory_mb"
ansible client-dev -i ../../inventories/lab/inventory.yml -m setup -a "filter=ansible_virtualization_type"
```

## Disk, uptime, memory and date

```bash
ansible all -a "df -h" -i ../../inventories/lab/inventory.yml
ansible client-dev -a "uptime" -i ../../inventories/lab/inventory.yml
ansible client-test -a "free -m" -i ../../inventories/lab/inventory.yml
ansible client-prod -a "date" -i ../../inventories/lab/inventory.yml
```

## Install and remove Nginx

```bash
ansible client-test -i ../../inventories/lab/inventory.yml -m apt -a "name=nginx state=latest update_cache=yes" -b
ansible client-test -i ../../inventories/lab/inventory.yml -m command -a "nginx -v"
ansible client-test -i ../../inventories/lab/inventory.yml -m apt -a "name=nginx state=absent" -b
```

Use `shell` instead of `command` when you need shell features like pipes, wildcards, variables or redirection.
