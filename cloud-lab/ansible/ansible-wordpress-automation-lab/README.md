# Ansible Automation Portfolio — AWS, Linux, Nginx, MySQL & WordPress

Projet portfolio construit à partir d’un lab Ansible complet réalisé sur AWS EC2. Il montre comment automatiser l’administration Linux, le déploiement de services web, la gestion d’inventaires, les playbooks, les templates Jinja2 et les rôles Ansible.

> Objectif : présenter un projet GitHub propre et réutilisable pour accompagner une certification Liora / DevOps / Cloud / Cybersecurity et un futur post LinkedIn.

---

## Ce que ce projet démontre

- Connexion SSH depuis un nœud de contrôle Ansible vers plusieurs instances Linux.
- Inventaires statiques en formats INI et YAML.
- Groupes d’hôtes : `dev`, `test`, `prod`, `serveurweb`, `serveurdatabase`, `production`.
- Variables avec `group_vars` et `host_vars`.
- Commandes ad hoc : `ping`, `copy`, `setup`, `command`, `shell`, `apt`.
- Playbooks multi-tâches et multi-hôtes.
- Déploiement Apache + PostgreSQL.
- Conditions avec `when` selon les facts Ansible.
- Boucles avec `loop` sur listes et dictionnaires.
- Tags Ansible : `web`, `db`, `always`, `never`.
- Templates Jinja2 pour générer des fichiers dynamiques.
- Importation de playbooks avec `import_playbook`.
- Rôles Ansible structurés avec `ansible-galaxy init`.
- Déploiement WordPress avec Nginx, MySQL, PHP-FPM et templates Jinja2.
- Bonnes pratiques de sécurité : `.gitignore`, pas de clé SSH, pas de secrets réels.

---

## Architecture du lab

```text
Mac local
   |
   | SSH
   v
Ansible control node / AWS EC2
   |
   | SSH private network
   |
   +-- client-dev / serveurweb
   +-- client-test / production WordPress
   +-- client-prod / serveurdatabase
```

Exemple d’adressage privé utilisé dans le lab :

```text
client-dev   / serveurweb      -> 172.31.5.71
client-test  / production      -> 172.31.5.136
client-prod  / serveurdatabase -> 172.31.7.113
```

Ces IP sont fournies comme exemples de lab AWS. Elles doivent être adaptées à votre environnement.

---

## Structure du dépôt

```text
.
├── ansible.cfg
├── inventories/
│   └── lab/
│       ├── inventory.ini
│       ├── inventory.yml
│       ├── group_vars/
│       └── host_vars/
├── labs/
│   ├── 01-ad-hoc/
│   ├── 02-playbooks/
│   ├── 03-jinja2/
│   ├── 04-roles/
│   └── 05-wordpress-playbooks/
├── roles/
│   └── wordpress/
├── docs/
└── .github/workflows/
```

---

## Démarrage rapide

Depuis un nœud de contrôle Ansible :

```bash
git clone <URL_DU_REPO>
cd ansible-automation-lab
```

Créer les fichiers de variables à partir des exemples :

```bash
cp inventories/lab/group_vars/all.yml.example inventories/lab/group_vars/all.yml
cp inventories/lab/group_vars/production.yml.example inventories/lab/group_vars/production.yml
```

Modifier l’inventaire et les variables :

```bash
nano inventories/lab/inventory.yml
nano inventories/lab/group_vars/all.yml
nano inventories/lab/group_vars/production.yml
```

Tester la connectivité :

```bash
ansible all -i inventories/lab/inventory.yml -m ping
```

Lancer le rôle WordPress :

```bash
ansible-playbook -i inventories/lab/inventory.yml labs/04-roles/install_wordpress.yml
```

---

## Exemples de commandes validées pendant le lab

Tester tous les hôtes :

```bash
ansible all -i inventaire.yaml -m ping
```

Récupérer les facts mémoire :

```bash
ansible all -i inventaire.yaml -m setup -a "filter=ansible_memory_mb"
```

Installer Nginx avec `apt` :

```bash
ansible client-test -i inventaire.yaml -m apt -a "name=nginx state=latest" -b
```

Exécuter un playbook avec un tag :

```bash
ansible-playbook -i inventaire.yaml tags-demo.yaml --tags web
```

Importer plusieurs playbooks :

```bash
ansible-playbook -i inventaire.yaml master.yaml
```

---

## Rôle WordPress

Le rôle `roles/wordpress` automatise :

- installation de Nginx ;
- installation de MySQL ;
- installation de PHP-FPM et extensions PHP ;
- création de la base WordPress ;
- création de l’utilisateur MySQL ;
- téléchargement et extraction de WordPress ;
- génération de `wp-config.php` avec Jinja2 ;
- configuration Nginx avec un virtual host ;
- redémarrage de Nginx via handler.

Playbook d’appel :

```yaml
- name: Déployer WordPress avec un rôle Ansible
  hosts: production
  become: true

  roles:
    - wordpress
```

---

## Sécurité

Ne jamais publier :

- clés `.pem` ;
- fichiers Vault password ;
- mots de passe réels ;
- tokens cloud ;
- identifiants personnels.

Le dépôt contient un `.gitignore` pour éviter d’ajouter des secrets par erreur.

Pour les secrets, utiliser Ansible Vault :

```bash
ansible-vault encrypt inventories/lab/group_vars/production.yml
ansible-playbook -i inventories/lab/inventory.yml labs/04-roles/install_wordpress.yml --ask-vault-pass
```

---

## Compétences mises en valeur

Ce projet met en avant des compétences utiles pour des postes Cloud, DevOps, Sysadmin ou SOC :

- automatisation d’infrastructure ;
- administration Linux ;
- gestion SSH ;
- troubleshooting réseau et services ;
- déploiement web ;
- séparation configuration / code ;
- structuration de code Ansible en rôles ;
- bonnes pratiques GitHub et sécurité.

---

## Prochaines améliorations possibles

- Ajouter Ansible Vault pour les mots de passe MySQL.
- Ajouter Molecule pour tester les rôles.
- Ajouter un workflow CI plus complet avec `ansible-lint`.
- Ajouter des captures d’écran du dashboard WordPress.
- Ajouter un schéma d’architecture dans `docs/`.

