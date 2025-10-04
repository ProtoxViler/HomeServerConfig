# Paramètres pour le premier démarrage

Pour tout PC linux compris, pas forcément le Home Server

## 1. Configuration des droits administrateur

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

## 2. Configuration SSH

### Sur le PC client (Windows)

1. Générer une paire de clés SSH :

```bash
ssh-keygen -t ed25519 -C "mon@email.com"
```

2. Copier la clé publique :

```bash
type C:\Users\<username>\.ssh\id_ed25519.pub
```

### Sur le serveur

1. Créer le répertoire .ssh :

```bash
mkdir -p ~/.ssh
```

2. Définir les permissions :

```bash
chmod 700 ~/.ssh
```

3. Créer/modifier le fichier authorized_keys :

```bash
nano ~/.ssh/authorized_keys
```

4. Coller la clé publique du PC client
5. Définir les bonnes permissions :

```bash
chmod 600 ~/.ssh/authorized_keys
```

### Test de connexion

Depuis le PC client :

```bash
ssh <username>@<ip-serveur>
```

## 3. Sécurité SSH (Optionnel)

Éditer le fichier de configuration SSH :

```bash
sudo nano /etc/ssh/sshd_config
```

Paramètres recommandés :

```
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

Redémarrer le service SSH :

```bash
sudo systemctl restart sshd
```
