# Services Docker pour héberger N8N.

## Container et images utilisés

- N8N

## Port mapping (Sortant)
- **N8N** : 5678

## Notes
- Pour lier N8N à tout autre service (Ex.: Portfolio), il faut que vous ajouter son réseaux au container après déploiement de la stack
- N8N_SECURE_COOKIE est mis à false pour permettre l'utilisation de N8N en HTTP (non sécurisé). À utiliser uniquement dans un réseau local de confiance.