# Configuration Serveur OpenSSH et clé SSH

## 1. Vérification de l'installation SSH

```bash
sudo systemctl status sshd
```

Si le service n'est pas actif, l'installer et l'activer :

```bash
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh
```

## 2. Configuration de l'authentification par clé SSH

### Sur le PC client

#### Windows

1. Générer une paire de clés SSH :

```bash
ssh-keygen -t ed25519 -C "mon@email.com"
```

_Optionnel mais recommandé : ajouter une passphrase_

2. Copier la clé publique :

```bash
type ~\.ssh\id_ed25519.pub
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

## 3. Test de connexion

Depuis le PC client :

```bash
ssh <username>@<ip-serveur>
```

## 4. Sécurité SSH (Optionnel)

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

## 5. Facilité (Perd en sécu sur le poste)

Sur la machine client, réaliser la commande ci-dessous pour garder en mémoire la passphrase

```bash
ssh-add ~/.ssh/id_ed25519
```
