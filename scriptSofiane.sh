#!/bin/bash

sudo apt-get install Virtualbox -qt
sudo apt-get install Vagrant

echo "Initialisation du Vagrantfile..."

# On vérifie qu'il n'y a pas déjà un Vagrantfile dans ce dossier
if [ ! -f Vagrantfile ]; then
    vagrant init 1> /dev/null
    echo "Le fichier Vagrantfile a été généré !"
else
    echo "Un Vagrantfile existe déjà dans ce dossier !"
    exit 1
fi

#on propose le choix de la box
echo "Choix de la box:"
echo "1. xenial64"
echo "2. trusty64"
read -p "Quel vagrant voulez-vous utiliser ?" monChoix
if [ $monChoix = "1" ]
then
	echo "OK"
	destinationBox="s/base/ubuntu/xenial64/g"
	sed -i "s/base/ubuntu\/xenial64/g" ./Vagrantfile


elif [ $monChoix = "2" ] 
then 
          echo "OK"
          sed -i "s/base/ubuntu\/trusty64/g" ./Vagrantfile
fi

echo "Quels dossiers voulez-vous utiliser pour synchroniser vagrant?"
read -p "sur l'hôte linux: " choixLinux
read -p "sur la vm vagrant: " choixVagrant
 # dans cette syntaxe on utilise la '=' comme délimiteur pour sed pour éviter de devoir '\' les '/' contenue dans mes variables

mkdir $choixLinux

sed -i "s=# config.vm.synced_folder \"../data\", \"/vagrant_data\"=config.vm.synced_folder \"$choixLinux\",\"$choixVagrant\"=g" ./Vagrantfile

vagrant up
vagrant ssh
vagrant global-status
