# 03 — Jinja2 templating

Jinja2 delimiters used in Ansible:

```text
{{ variable }}    prints a variable
{% statement %}   control flow
{# comment #}     comment not rendered
```

Run the Apache template playbook:

```bash
ansible-playbook -i ../../inventories/lab/inventory.yml ../02-playbooks/apache2.yml
```
