#!/bin/bash

# execute le script avec sudo directement plutot que de demander le mot de passe.


SudoAndUpdate() {
    target_user="${SUDO_USER:-$USER}"
    echo "Ajout de l'utilisateur $target_user au groupe sudo (exécution en root requise)"
    if [ "$(id -u)" -ne 0 ]; then
        echo "Lancez le script avec sudo ou en root pour effectuer cette opération."
        return 1
    fi

    usermod -aG sudo "$target_user"
    apt update && apt upgrade -y

    echo CHECKUP :
    groups "$target_user" | grep -q '\bsudo\b' && echo "$target_user est maintenant dans le groupe sudo." || echo "Échec de l'ajout de $target_user au groupe sudo."
    echo Les paquets ont été mis à jour.\n
}

EssentialsConfig() {
    echo "Installation de Tree, Htop, Wget, Curl, git"
    echo $user_password | sudo -S apt install -y tree htop wget curl git gh\n
    echo CHECKUP :
    echo Les paquets essentiels ont été installés.
}

StarshipConfig() {
    echo "Installation de Starship"
    echo $user_password | sudo -S apt install -y curl
    curl -sS https://starship.rs/install.sh | sh
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
    source ~/.bashrc\n
    curl -sS https://raw.githubusercontent.com/ProtoxViler/HomeServerConfig/refs/heads/main/OsConfig/Starship/starship.toml | tee ~/.config/starship.toml
    echo CHECKUP :
    starship --version && echo "Starship a été installé avec succès." || echo "Échec de l'installation de Starship."\n
}


CheckInstallations() {
    echo "Vérification des installations"
    echo
    echo "Vérification de sudo:"
    if sudo -v; then
        echo "sudo est installé et fonctionne correctement."
    else
        echo "sudo n'est pas installé ou ne fonctionne pas correctement."
    fi

    echo
    echo "Vérification de Tree:"
    if command -v tree &> /dev/null; then
        echo "Tree est installé."
    else
        echo "Tree n'est pas installé."
    fi

    echo
    echo "Vérification de Htop:"
    if command -v htop &> /dev/null; then
        echo "Htop est installé."
    else
        echo "Htop n'est pas installé."
    fi

    echo
    echo "Vérification de Wget:"
    if command -v wget &> /dev/null; then
        echo "Wget est installé."
    else
        echo "Wget n'est pas installé."
    fi

    echo
    echo "Vérification de Curl:"
    if command -v curl &> /dev/null; then
        echo "Curl est installé."
    else
        echo "Curl n'est pas installé."
    fi

    echo
    echo "Vérification de Git:"
    if command -v git &> /dev/null; then
        echo "Git est installé."
    else
        echo "Git n'est pas installé."
    fi

    echo
    echo "Vérification de Starship:"
    if command -v starship &> /dev/null; then
        echo "Starship est installé."
    else
        echo "Starship n'est pas installé."
    fi

    echo
    echo "Vérification terminée."
}


# Boucle pour choisir plusieurs options si besoin 
while true; do

  echo Configuration automatique de l\'OS
  echo -------------------------------\n
  echo "1. Sudo & Update                 #Disponible"
  echo "2. SSH                           #Non Disponible"
  echo "3. XRDP                          #Non Disponible"
  echo "4. Samba                         #Non Disponible"
  echo "5. Cloudflare                    #Non Disponible"
  echo -- Bonus --
  echo "6. Essentiel (Tree, Htop, Wget, Curl, git)"
  echo 7. Starship\n
  echo "9. Tout installer                #Non Disponible"
  echo "10. Véifier les installations    #Non Disponible"\n
  echo 0. Quitter\n

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







