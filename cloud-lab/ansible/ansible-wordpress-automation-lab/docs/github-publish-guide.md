# Guide de publication sur GitHub

Ce guide explique comment publier ce projet comme repository GitHub portfolio.

## 1. Créer le repository sur GitHub

Sur GitHub :

1. Cliquer sur **New repository**.
2. Nom recommandé : `ansible-automation-portfolio` ou `ansible-wordpress-automation-lab`.
3. Description recommandée :
   `Ansible automation portfolio: inventories, ad hoc commands, playbooks, Jinja2 templates, roles and WordPress deployment on AWS EC2.`
4. Choisir **Public** pour le portfolio.
5. Ne pas cocher “Add a README”, car le projet en contient déjà un.
6. Cliquer sur **Create repository**.

## 2. Initialiser Git localement

Depuis le dossier du projet :

```bash
cd ansible-automation-lab
git init
git add .
git commit -m "Initial Ansible automation portfolio project"
```

## 3. Ajouter le remote GitHub

Remplacer `<USERNAME>` par ton utilisateur GitHub :

```bash
git branch -M main
git remote add origin https://github.com/<USERNAME>/ansible-automation-portfolio.git
git push -u origin main
```

## 4. Vérifier avant publication

Avant de pousser sur GitHub :

```bash
git status
find . -name "*.pem" -o -name "*vault*" -o -name "*.key"
```

Assure-toi qu’aucune clé privée ou secret réel n’est dans le dépôt.

## 5. À ajouter après certification

Quand la certification sera confirmée :

- ajouter un badge ou une ligne dans le README ;
- ajouter le lien du certificat si partageable ;
- publier le post LinkedIn préparé dans `docs/linkedin-post-draft.md`.
