# Security Policy

This repository is a lab and portfolio project.

## Secrets

Do not commit:

- private SSH keys such as `.pem` files;
- Vault password files;
- real database passwords;
- API tokens;
- AWS credentials;
- personal certificates or private documents.

Use Ansible Vault for sensitive variables.

## Reporting

If a secret is accidentally committed, rotate the credential immediately and remove it from Git history before making the repository public.
