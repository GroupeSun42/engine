# 
ce repository contient deux fichier:
- un script bash nommée ScriptSofiane.sh
- un Readme nommée ScriptSofiane.sh

Pour lancer le script, on utilise: bash scriptSofiane.sh
le Script.sh n'est utilisable que sur un temrninal
le debut du script lance l'installation de virtual box et de vagrant
avec une verification qu'il nexiste pas deja un fichier Vagrantfile 
un choix de box vagrant est proposé entre 1. Xenial64 ou  2. trusty64
un choix du dossier avec les chemin absolut du sync folders que l'utilisateur souhaite utiliser ( il peut choisir autre chose que "/var/www/html" comme 
	par exemple "/var/www")
La fin lance la vagrant et la connecter en SSH avec : vagrant up et vagrant ssh
vagrant global-status quand à lui sert à afficher toutes les Vagrant en cours d’utilisation sur le système
