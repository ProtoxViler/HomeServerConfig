# Configuration et installation des services Docker

## Prérequis

Faire la configuration de base de l'OS : [OsConfig](../OsConfig/README.md)

## 1. Installation de Docker, Docker Compose

### Docker

```bash
sudo apt-get install docker.io
```

### Docker Compose

Installe le plugin, ne pas utiliser la version standalone (`docker-compose` obsolète).

```bash
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.40.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
```

Vérifier l'installation :

```bash
docker --version
docker compose version
```

## 2. Installation de Portainer (optionnel)

```bash
docker volume create portainer_data
docker run -d -p 9000:9000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
```

**ATTENTION** : Le port 9000 est un port en HTTP a contrario du 9443, qui est en HTTPS. Utiliser qu'en LAN. Ou le passé en HTTPS avec le tunneling Cloudflare, qui lui générera un certificat SSL.

1. Aller sur `http://<IP_SERVEUR>:9000` ou `https://<IP_SERVEUR>:9443`
2. Créer le compte admin
3. Se connecter
4. Aller dans "Environnements" > "Ajouter un environnement" > "Docker"
5. Sélectionner "Local" puis cliquer sur "Ajouter un environnement"

## 3. Utilisation de Portainer (Ajout de stack)

1. Aller dans "Stacks" > "Ajouter une stack"
2. Donner un nom à la stack (ex: N8N)

## Table des matières

- [**Portfolio**](../Docker/Portfolio/README.md) - _Site web personnel_
- [**N8N**](../Docker/N8N/README.md) - _Programation par flux avec intégration IA_
- [**Domotique**](../Docker/Domotique/README.md) - _Home Assistant, MQTT, Node-Red_
- [**JellyFin**](../Docker/Jellyfin/README.md) - _Médiathèque_
- [**Uptime Kuma**](../Docker/UptimeKuma/README.md) - _Monitoring de l'état de serveur.s_
