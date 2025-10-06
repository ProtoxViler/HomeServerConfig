#!/bin/bash

# UPDATE
echo -e "\nLOG : update des paquets"
sudo apt update && sudo apt upgrade

# APT INSTALL
echo -e "\nLOG : Installation des packets suivant via APT:"
echo "      tree, htop, Openssh-server, XRDP (Server), Samba (Server)"
sudo apt install tree htop openssh-server xrdp samba -y

echo -e "\nLOG : Installation de satrship"
sudo curl -sS https://starship.rs/install.sh | sh 


# AUTOCONFIG
echo -e "\nLOG : L'autoconfiguration de SSH n'est pas disponible car trop spécifique"



