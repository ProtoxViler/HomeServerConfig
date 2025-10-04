# Configuration Serveur XRDP

## Installation XRDP

```bash
sudo apt install -y xrdp
sudo systemctl enable xrdp
sudo systemctl start xrdp
sudo systemctl status xrdp
```

## Utilisation

**ATTENTION** : Si l'utilisateur sur lequel vous vous connectez est déjà connecté en local, la session RDP ne se fera pas.

### Windows

1. Ouvrir le client Bureau à distance (Tapez RDP dans le menu démarrer)
2. Entrer l'adresse IP du serveur Linux
3. Cliquer sur "Connecter"
4. Entrer les identifiants de l'utilisateur Linux

### MacOS

1. Installer le client Windows App depuis l'App Store
2. Cliquer sur "Add PC"
3. Entrer l'adresse IP du serveur Linux
4. Cliquer sur "Save"
5. Double cliquer sur le PC ajouté
6. Entrer les identifiants de l'utilisateur Linux

## Dépannage

Pour plus de détail voir ce tuto : [AvenaCloud](https://avenacloud.com/blog/how-to-set-up-multi-user-access-in-xrdp-on-ubuntu/?srsltid=AfmBOoroDyv5YJcE6uo_SnlAaW73tomjaHfCakEsCXs0rM168BH3L_sx)
