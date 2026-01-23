# Configuration et installation des services Docker

## Prérequis

Faire la configuration de base de l'OS : [OsConfig](../OsConfig/README.md)

---

## 1. Installation de Docker et Docker Compose (plugin)

⚠️ Attention, cette installation est **uniquement valable pour Debian**.  
Il existe quelques différences si vous êtes sur Ubuntu.

⚠️ **Ne pas installer `docker.io`** (version des dépôts Debian).  
Nous utilisons ici **Docker officiel (`docker-ce`)** et **Docker Compose via le plugin officiel**.

---

### Docker

Si une ancienne version est présente, la supprimer :

```bash
sudo apt remove -y docker docker.io docker-compose docker-compose-v2 containerd runc
```

---

### Docker Compose

Docker Compose est installé via le **plugin officiel**.  
⚠️ Ne pas utiliser la version standalone (`docker-compose` obsolète).

#### 1. Ajout du dépôt Docker officiel (non disponible par défaut sur Debian)

```bash
# Installation des dépendances
sudo apt update
sudo apt install -y ca-certificates curl

# Ajout de la clé GPG officielle Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Ajout du dépôt Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
```

---

#### 2. Installation des paquets Docker

```bash
sudo apt install -y   docker-ce   docker-ce-cli   containerd.io   docker-buildx-plugin   docker-compose-plugin
```

---

#### 3. Démarrage de Docker

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

---

#### Vérification de l'installation

```bash
docker --version
docker compose version
```

---

## 2. Installation de Portainer (optionnel)

```bash
sudo usermod -aG docker $USER
```

## 3. Installation de Portainer (optionnel)

```bash
sudo docker volume create portainer_data
sudo docker run -d   -p 9000:9000   -p 9443:9443   --name portainer   --restart=always   -v /var/run/docker.sock:/var/run/docker.sock   -v portainer_data:/data   portainer/portainer-ce:lts
```

**ATTENTION** :  

- Le port **9000** est en **HTTP**
- Le port **9443** est en **HTTPS**

👉 Le port 9000 doit être utilisé **uniquement en LAN**.  
👉 Pour un accès externe, utiliser le 9443 ou un **tunnel Cloudflare** qui génèrera un certificat SSL.

### Configuration initiale

1. Aller sur `http://<IP_SERVEUR>:9000` ou `https://<IP_SERVEUR>:9443`
2. Créer le compte administrateur
3. Se connecter
4. Aller dans **Environnements** > **Ajouter un environnement** > **Docker**
5. Sélectionner **Local** puis cliquer sur **Ajouter un environnement**

---

## 3. Utilisation de Portainer

### Déploiement d'une stack

1. Aller dans **Stacks** > **Ajouter une stack**
2. Donner un nom à la stack (ex: `portfolio`)
3. Choisir le mode de déploiement **Repository**
4. Renseigner l'URL du dépôt Git :  
   `https://github.com/ProtoxViler/HomeServerConfig.git`
5. Sélectionner la branche `main`
6. Renseigner le chemin du fichier `docker-compose.yml`  
   `Docker/Portfolio/docker-compose.yml`
7. Renseigner les variables d'environnement si nécessaire
8. Cocher **GitOps updates** pour la mise à jour automatique
9. Cliquer sur **Déployer la stack**

---

### Gestion des mots de passe et variables d'environnement

Certaines stacks peuvent contenir des mots de passe en clair dans le fichier `docker-compose.yml`.

Pour éviter cela, il est recommandé d'utiliser des **variables d'environnement**.

Créer un fichier `.env` dans un dossier dédié, par exemple :

```bash
/home/$USER/DockerPassword/
```

Ce fichier sera ensuite référencé dans les stacks Portainer.

---

## À noter

- Les stacks sont configurées pour éviter tout conflit de ports
- Vérifier les ports utilisés dans chaque dossier **Services**
- Des tutoriels spécifiques sont disponibles dans chaque dossier de service

---

## Table des matières

- [**Portfolio**](../Docker/Portfolio/) — _Site web personnel_
- [**N8N**](../Docker/N8N/) — _Programmation par flux avec intégration IA_
- [**Domotique**](../Docker/Domotique/) — _Home Assistant, MQTT, Node-RED_
- [**Jellyfin**](../Docker/Jellyfin/) — _Médiathèque_
- [**Uptime Kuma**](../Docker/UptimeKuma/) — _Monitoring de l'état des serveurs_
