# Configuration Serveur Samba

## 1. Installation de Samba

```bash
# Installation du paquet
sudo apt install -y samba

# Vérification du service
sudo systemctl status smbd

# Activation au démarrage
sudo systemctl enable smbd
```

## 2. Configuration du partage

### Préparation du dossier

```bash
# Création du répertoire
sudo mkdir -p /srv/partage

# Attribution des permissions
sudo chmod 770 /srv/partage
sudo chown root:partage /srv/partage
```

### Configuration des utilisateurs

```bash
# Création du groupe
sudo groupadd partage

# Ajout d'un utilisateur au groupe
sudo usermod -aG partage <nom_utilisateur>

# Création du compte Samba
sudo smbpasswd -a <nom_utilisateur>
```

### Configuration de Samba

```bash
# Sauvegarde du fichier original
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# Édition du fichier de configuration
sudo nano /etc/samba/smb.conf
```

Ajouter à la fin du fichier :

```ini
[partage]
   comment = Partage de données
   path = /srv/partage
   guest ok = no
   read only = no
   browseable = yes
   valid users = @partage
```

### Redémarrage du service

```bash
sudo systemctl restart smbd
```

## 3. Test et vérification

### Vérification de la configuration

```bash
# Test de la syntaxe
testparm

# Vérification des partages disponibles
smbclient -L localhost -U <nom_utilisateur>
```

### Connexion depuis Windows

1. Ouvrir l'Explorateur de fichiers
2. Taper `\\IP-SERVEUR\partage` dans la barre d'adresse
3. Entrer les identifiants créés avec smbpasswd

### Connexion depuis Linux

```bash
smbclient //IP-SERVEUR/partage -U <nom_utilisateur>
```

### Connexion depuis MacOs

##############

## 4. Dépannage courant

### Problèmes de permissions

```bash
# Vérification des permissions
ls -l /srv/partage

# Réinitialisation des permissions
sudo chmod 770 /srv/partage
sudo chown root:partage /srv/partage
```

### Logs et diagnostic

```bash
# Consultation des logs
sudo tail -f /var/log/samba/log.smbd

# Status du service
sudo systemctl status smbd
```

## 5. Sécurité

- Utilisez des mots de passe forts pour les comptes Samba
- Limitez l'accès aux utilisateurs nécessaires
- Surveillez régulièrement les logs
- Maintenez Samba à jour

Source : [IT-Connect](https://www.it-connect.fr/serveur-de-fichiers-debian-installer-et-configurer-samba-4/)
