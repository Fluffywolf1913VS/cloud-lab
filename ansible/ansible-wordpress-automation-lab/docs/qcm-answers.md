# QCM answers

1. Toutes les réponses ci-dessus  
2. Ansible est un outil open source, sans agent, et ne nécessite pas de ressources extérieures pour son utilisation.  
3. `ansible-playbook my-playbook.yaml`  
4. À la racine de votre projet Ansible.  
5. `ansible all -i inventaire.ini -m ping`  
6. `ansible cible1 -i inventaire.ini -m setup`  
7. `ansible cible1 -i inventaire.ini -m setup -a 'filter=ansible_*_mb'`  
8. `ansible cible2 -i inventaire.ini -m apt -a 'name=nginx state=latest'`  
9. The correct command should be `ansible cible2 -i inventaire.ini -m apt -a 'name=nginx state=absent' -b`. If forced to choose from the listed answers, none is perfect; the closest module logic is the option using `name=nginx state=absent`, but it incorrectly includes duplicate `-m setup -m apt`.  
10. `/etc/ansible/hosts`  
11. `ansible-inventory -i inventaire.ini --list`  
12. `ansible-inventory -i inventaire.ini -y --list > inventaire.yaml`  
13. `ansible-inventory -i inventaire.ini --graph`  
14. En utilisant des alias, par exemple `serveurweb1.datascientest.fr`.  
15. `ansible_connection`  
16. `ansible_port`  
17. `ansible_user`  
18. `ansible_ssh_pass`
