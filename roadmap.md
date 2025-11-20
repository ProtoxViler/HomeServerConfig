# Roadmap — Exemple pour services implantés (à adapter)

## Objectif

Fournir une feuille de route claire pour déployer, sécuriser et maintenir les services du dépôt Git.

## Hypothèse

Services courants présumés : Docker, Nginx/Traefik, Nextcloud, Home Assistant, Plex, WireGuard, Pi-hole, Samba, Prometheus/Grafana, sauvegardes. Remplacer ou ajuster selon ton repo.

## Priorités (0–12 mois)

- Court terme (0–1 mois)
  - [ ] Inventaire des services présents dans le repo et état (compose, dockerfiles, infra-as-code).
  - [ ] Déploiement minimal en environnement de test (docker-compose up / stack).
  - [ ] Configuration réseau de base (DNS local, firewall, WireGuard).
- Moyen terme (1–4 mois)
  - [ ] Mise en place du reverse proxy (Nginx/Traefik) + HTTPS (Let's Encrypt).
  - [ ] Authentification centralisée (OAuth/LDAP/Traefik Forward Auth).
  - [ ] Monitoring basique (Prometheus + Grafana) et alerting.
  - [ ] Sauvegardes automatisées (données + configs).
- Long terme (4–12 mois)
  - [ ] Haute disponibilité / restauration après sinistre.
  - [ ] Tests de montée en charge et optimisations.
  - [ ] Audit de sécurité + correction des vulnérabilités.
  - [ ] CI/CD pour images et configurations (GitOps).

## Exemple par service (tâches typiques)

- Docker / docker-compose
  - [ ] Standardiser les labels / réseaux / volumes.
  - [ ] Templates d’environnement et secrets management.
- Reverse proxy (Nginx / Traefik)
  - [ ] Routes, certificats, redirections HTTP->HTTPS.
  - [ ] Rate-limiting et protections basiques.
- Nextcloud / stockage
  - [ ] Chiffrement, backups, quotas, intégration LDAP.
- Home Assistant
  - [ ] Isolation réseau, sauvegarde d’entrées, intégration MQTT.
- Plex / médias
  - [ ] Indexation planifiée, protection accès externe.
- WireGuard / VPN
  - [ ] Rotations de clés, règles de routage, onboarding scripts.
- Monitoring & logs
  - [ ] Dashboards essentiels, rétention des logs, alertes emails/Telegram.

## Jalons (exemples)

- Semaine 1–2 : inventaire + déploiement test.
- Mois 1 : reverse proxy + HTTPS fonctionnels.
- Mois 2–3 : monitoring + sauvegardes.
- Mois 4–6 : sécurisation avancée + CI/CD.

## Risques & actions mitigantes

- Secret exposés -> utiliser vault / fichiers .env exclus du repo.
- Coupures réseau -> procédures de restauration, snapshots réguliers.
- Compatibilité versions -> matrix de tests automatisés.

## Action requise

Fournis la liste exacte des services et fichiers importants du dépôt (docker-compose.yml, Dockerfile, ansible, Terraform, manifests) pour générer une roadmap personnalisée et un planning détaillé.
