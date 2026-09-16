# WordPress role

This role deploys a WordPress stack using:

- Nginx
- MySQL
- PHP-FPM
- WordPress
- Jinja2 templates for `wp-config.php` and Nginx virtual host configuration

## Variables

See `defaults/main.yml`.

Use Ansible Vault for production secrets:

```bash
ansible-vault encrypt inventories/lab/group_vars/production.yml
```

## Example playbook

```yaml
- name: Deploy WordPress
  hosts: production
  become: true

  roles:
    - wordpress
```
