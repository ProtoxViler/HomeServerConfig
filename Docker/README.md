# Configuration et installation des services Docker

## Prérequis

Faire la configuration de base de l'OS : [OsConfig](../OsConfig/README.md)

## 1. Installation de Docker, Docker Compose

### Docker

```bash
sudo apt-get install docker.io -y
```

### Docker Compose

Installe le plugin, ne pas utiliser la version standalone (`docker-compose` obsolète).

1. Ajoute la source dépot de docker (Non disponible dans les dépôts de debian par défaut)

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

2. Installe les paquets de docker

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

Vérifier l'installation :

```bash
docker --version
docker compose version
```

## 2. Installation de Portainer (optionnel)

```bash
sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
```

**ATTENTION** : Le port 9000 est un port en HTTP a contrario du 9443, qui est en HTTPS. Utiliser qu'en LAN. Ou le passé en HTTPS avec le tunneling Cloudflare, qui lui générera un certificat SSL.

1. Aller sur `http://<IP_SERVEUR>:9000` ou `https://<IP_SERVEUR>:9443`
2. Créer le compte admin
3. Se connecter
4. Aller dans "Environnements" > "Ajouter un environnement" > "Docker"
5. Sélectionner "Local" puis cliquer sur "Ajouter un environnement"

## 3. Utilisation de Portainer

### Déploiement d'une stack

1. Aller dans "Stacks" > "Ajouter une stack"
2. Donner un nom à la stack (ex: portfolio)
3. Choisissez le build method "Repository"
4. Renseigner l'URL du dépôt git (`https://github.com/ProtoxViler/HomeServerConfig.git`)
5. main comme branche
6. Renseigner le chemin du fichier `docker-compose.yml` (Docker/Portfolio/docker-compose.yml)
7. Renseigner les variables d'environnement si besoin pour la gestion de mots de passe (voir plus bas)
8. Cocher `GitOps updates` pour que la stack se mette à jour automatiquement si le dépôt git est mis à jour.
9. Cliquer sur "Déployer la stack"

### Gestion des mots de passe et variables d'environnement

Dans votre stacks, il est possible d'avoir des mots de passe qui sont stocké en clair dans le fichier `docker-compose.yml`. Pour éviter cela, il est possible d'utiliser des variables d'environnement.

Pour cela, il faut créer un fichier `.env` que vous stockerez dans un dossier qui vous est propre (/home/$USER/DockerPassword/ par exemple).

## A noter

Les stacks sont configuré pour ne jamais avoir les ports en conflit. Vérifier dans chaque dossier Services les ports utilisés.
Des petits tutos sont disponible dans chaque dossier de service.

## Table des matières

- [**Portfolio**](../Docker/Portfolio/) - _Site web personnel_
- [**N8N**](../Docker/N8N/) - _Programation par flux avec intégration IA_
- [**Domotique**](../Docker/Domotique/) - _Home Assistant, MQTT, Node-Red_
- [**JellyFin**](../Docker/Jellyfin/) - _Médiathèque_
- [**Uptime Kuma**](../Docker/UptimeKuma/) - _Monitoring de l'état de serveur.s_
