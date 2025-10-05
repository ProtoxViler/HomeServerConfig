#!/bin/bash


# Demande les passwords user et root pour les commandes sudo
clear
echo -------------------------------
echo ATTENTION: Merci d\'entrer votre mot de passe user et root ici pour continuer à faire les installations.
echo
echo Ce script n\'enregistrera pas votre mot de passe, il l\'utilisera uniquement pour les commandes sudo.
echo -------------------------------

read -p "Votre password user: " user_password
read -p "Votre password root: " root_password

clear



# Fonction pour les choix du menu
SudoAndUpdate() {
    echo "Passage de l'user " $USER " en sudoers"
    echo $root_password | su -l && sudo -S usermod -aG sudo $USER
    echo # Jump le mot de passe
    echo $user_password | sudo -S apt update && sudo -S apt upgrade -y
    echo 
    echo CHECKUP :
    groups $USER | grep -q '\bsudo\b' && echo "$USER est maintenant dans le groupe sudo." || echo "Échec de l'ajout de $USER au groupe sudo."
    echo Les paquets ont été mis à jour.
    echo
}

EssentialsConfig() {
    echo "Installation de Tree, Htop, Wget, Curl, git"
    echo $user_password | sudo -S apt install -y tree htop wget curl git gh
    echo
    echo CHECKUP :
    echo Les paquets essentiels ont été installés.
}

StarshipConfig() {
    echo "Installation de Starship"
    echo $user_password | sudo -S apt install -y curl
    curl -sS https://starship.rs/install.sh | sh
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
    source ~/.bashrc
    echo
    curl -sS https://raw.githubusercontent.com/ProtoxViler/HomeServerConfig/refs/heads/main/OsConfig/Starship/starship.toml | tee ~/.config/starship.toml
    echo CHECKUP :
    starship --version && echo "Starship a été installé avec succès." || echo "Échec de l'installation de Starship."
    echo
}



# Boucle pour choisir plusieurs options si besoin 
while true; do


  echo Configuration automatique de l\'OS
  echo -------------------------------
  echo
  echo "1. Sudo & Update                 #Disponible"
  echo "2. SSH                           #Non Disponible"
  echo "3. XRDP                          #Non Disponible"
  echo "4. Samba                         #Non Disponible"
  echo "5. Cloudflare                    #Non Disponible"
  echo -- Bonus --
  echo "6. Essentiel (Tree, Htop, Wget, Curl, git)"
  echo 7. Starship
  echo
  echo "9. Tout installer                #Non Disponible"
  echo "10. Véifier les installations    #Non Disponible"
  echo
  echo 0. Quitter
  echo

  read -p "Choix: " choice
  clear

  case $choice in
      1) SudoAndUpdate ;;
      2) SSHConfig ;;
      3) XRDPConfig ;;
      4) SambaConfig ;;
      5) CloudflareConfig ;;
      6) EssentialsConfig ;;
      7) StarshipConfig ;;
      9) SudoAndUpdate; SSHConfig; XRDPConfig; SambaConfig; CloudflareConfig; StarshipConfig; EssentialsConfig ;;
     10) CheckInstallations ;;
      0) echo "Quitter..."; break ;;
      *) echo "Choix invalide." ;;
  esac
done







