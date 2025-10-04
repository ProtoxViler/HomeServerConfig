# HomeServerConfig

Configuration et documentation centralisée pour le Home Server (Firebat) — gestion de services, partages et domotique.

## Environnement système utilisé

- Debian 13.0.1

## Environnement matériel

| Composant | Détail                                                                                                                                    |
| --------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| CPU       | [Intel N100](https://www.intel.fr/content/www/fr/fr/products/sku/231803/intel-processor-n100-6m-cache-up-to-3-40-ghz/specifications.html) |
| RAM       | 16 Go DDR4                                                                                                                                |
| Stockage  | 512 Go SSD + 1 slot 2.5" libre                                                                                                            |
| Réseau    | Wi‑Fi5 / RJ45 (1 Gbps)                                                                                                                    |

## Raccourci rapide

### 1. Mettre à jour le système :

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Consulter les guides détaillés :

_Grand point cliquable pour voir comment installer/configurer._

- [**OsConfig**](https://github.com/ProtoxViler/HomeServerConfig/tree/main/OsConfig)
  - **Serveur SSH** - _Contrôle à distance par terminal_
  - **Serveur XRDP** - _Contrôle à distance via RDP pour Linux_
  - **Serveur Samba** - _Fichiers_
  - **Cloudflare/Cloudflared** - _Zero trust, VPN, DNS, ..._
  - **_Optionnel_**
    - **Curl** - _Outil ligne de commande pour les requêtes réseau_
    - **Tree** - _Affichage arborescence dans le terminal_
    - **Htop** - _Gestionnaire de tâches avancé_
    - **Starship** - _Personalisation terminal_
- [**Docker**](https://github.com/ProtoxViler/HomeServerConfig/tree/main/Docker)
  - **Portainer** - _Affiche web pour docker_
  - **Portfolio**
    - **Wordpress**
    - **MySQL** - _Base de donnée_
    - **PHPMyAdmin** - _Affichage web en PHP pour la BDD_
  - **Domotique**
    - **Home Assistant**
    - **Eclipse-Mosquitto** - _Broker MQTT_
    - **Node-Red** - _Programmation par flux orienté domotique_
  - **JellyFin** - _Médiathèque_
  - **N8N** - _Programation par flux avec intégration IA_
  - **Uptime Kuma** - _Monitoring de l'état de serveur.s_

## Structure du dépôt

- **OsConfig/** — Guide pour la configuration des serveurs intégré à l'OS (SSH et Clé, Samba, XRDP)
- **Docker/** — Fichiers compose de configuration pour les services voulu (Portfolio, Domotique,...)

## Contribution

- Ouvrir une issue pour une nouvelle configuration ou un bug
- PRs acceptées pour documentations/recipes. Respecter la structure des dossiers et ajouter un README si vous créez un dossier service.

## Licence & contact

- **Projet personnel** — Pas de licence explicite
- **Contact :** contact@devallek.fr
- **mention honorable :** le_renard_12 (Discord)

## Ressources

- Guide Samba utilisé : https://www.it-connect.fr/serveur-de-fichiers-debian-installer-et-configurer-samba-4/
