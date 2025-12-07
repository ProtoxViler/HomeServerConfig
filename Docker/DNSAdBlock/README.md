# Services Docker pour héberger un bloqueur de publicité DNS

## Container et images utilisés

- Adgurad (bloqueur de publicité DNS)

## Port mapping (Sortant)

- **DNS** (53 : TCP/UDP)
- **Interface web** (3080, 3000 : TCP & 443 : TCP/UDP)

## Utilisation

1. Accéder à l'interface web via le port 3000 pour la configuration.
2. Entrez les interfaces réseau et vos login.
3. Ils vous redirigeront vers le port 80 pér défaut car configuré par défaut dans le YML, il vous changer le port en 3080.
4. Configurer vos appareils pour utiliser le serveur DNS de votre Docker hôte.
