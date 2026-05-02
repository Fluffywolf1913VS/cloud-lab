# Troubleshooting notes

## SSH timeout

Symptoms:

```text
Connection timed out during banner exchange
```

Check:

```bash
nc -vz <private-ip> 22
ansible all -i inventory.yml -m ping -T 60
```

AWS checks:

- instance is running
- system checks passed
- correct private IP in inventory
- Security Group allows SSH from the control node

## HTTP connection refused

Check Nginx:

```bash
ansible all -i inventory.yml -m command -a "systemctl is-active nginx" -b
ansible all -i inventory.yml -m shell -a "ss -tulpn | grep ':80'" -b
ansible all -i inventory.yml -m command -a "curl -I localhost"
```

If local `curl` works but browser access fails, open inbound TCP/80 in the target Security Group.

## command vs shell

Use `command` for simple commands.

Use `shell` when you need:

- pipes: `|`
- redirection: `>`
- wildcards: `*`
- environment variables: `$HOME`
- command chaining: `&&`
