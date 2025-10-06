# Configuration des services intégrés à l'OS

##### Pour tout PC linux compris, pas forcément le Home Server

##### (Pas de docker ou autres)

## Table des matières

- [**Serveur SSH**](https://github.com/ProtoxViler/HomeServerConfig/blob/main/OsConfig/SrvSSH.md) - _Contrôle à distance par terminal_
- [**Serveur XRDP**](https://github.com/ProtoxViler/HomeServerConfig/blob/main/OsConfig/SrvXRP.md) - _Contrôle à distance via RDP pour Linux_
- [**Serveur Samba**](https://github.com/ProtoxViler/HomeServerConfig/blob/main/OsConfig/SrvSamba.md) - _Fichiers_
- [**Cloudflare/Cloudflared**](https://github.com/ProtoxViler/HomeServerConfig/blob/main/OsConfig/Cloudflared.md) - _Zero trust, VPN, DNS, ..._

## ⚠️ Avant de faire tout manipulation

### Ajouter l'utilisateur au groupe sudo

1. Ouvrir un terminal
2. Se connecter en tant que root :

```bash
su -l
```

3. Entrer le mot de passe root
4. Ajouter l'utilisateur au groupe sudo :

```bash
usermod -aG sudo <username>
```

5. Vérifier l'appartenance aux groupes :

```bash
groups <username>
```

Nécessite surement un reboot sur VM, ou une reconnexion du compte.

### Vérifier les mises à jour

```bash
sudo apt update && sudo apt upgrade -y
```

Voir [plus bas](#fichier-automatique-shell) pour que tout soit automatisé.

## Autre config bonus

### Curl

```bash
sudo apt install curl -y
```

### Git & GitHub

```bash
sudo apt install git gh -y
```

### Tree

```bash
sudo apt install tree -y
```

### Htop

```bash
sudo apt install htop -y
```

### Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

Ajouter dans le .bashrc ou .zshrc

```bash
eval "$(starship init bash)"
```

Ajouter le preset dans le chemin ci-dessous (suivant l'OS) :

- Linux/MacOs : `~/.config/starship.toml`
- Windows : `%USERPROFILE%\.config\starship.toml`

Preset perso : [lien](https://github.com/ProtoxViler/HomeServerConfig/blob/main/OsConfig/starship_perso.toml) (à rename starship.toml)
Preset serveur: [lien](https://github.com/ProtoxViler/HomeServerConfig/blob/main/OsConfig/starship_server.toml) (à rename starship.toml)
List de preset : [https://starship.rs/presets/](https://starship.rs/presets/)

Font : [Nerd Font](https://www.nerdfonts.com/) ([Cascadia Code](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip) recommandé)

### Alias utiles

A ajouter dans le .bashrc ou .zshrc

#### Équivalent _ipconfig /all_ court

```bash
alias ipa='ip -br -c -4 a'
```

## Fichier automatique shell (WIP)

### avec Autoconfig (WIP)

Copier le bash ci dessous pour tout installer

```bash
# Install curl
sudo apt install curl -y

# Execute script
curl -sSL "https://raw.githubusercontent.com/ProtoxViler/HomeServerConfig/main/OsConfig/AutoConfig.sh" -o AutoConfig.sh
chmod +x AutoConfig.sh
sudo ./AutoConfig.sh
rm ./AutoConfig.sh
```

### Sans Autoconfig

Installation des paquets

```bash
sudo apt update && sudo apt upgrade
sudo apt install fastfetch curl tree htop openssh-server xrdp samba -y
sudo curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```

Configuration de starship

#### Config Perso

```bash
curl https://raw.githubusercontent.com/ProtoxViler/HomeServerConfig/refs/heads/main/OsConfig/Starship/starship_perso.toml -o ~/.config/starship.toml
```

#### Config Server

```bash
curl https://raw.githubusercontent.com/ProtoxViler/HomeServerConfig/refs/heads/main/OsConfig/Starship/starship_server.toml -o ~/.config/starship.toml
```
