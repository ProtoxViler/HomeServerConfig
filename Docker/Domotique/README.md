# Services Docker pour héberger Home Assistant et un broker MQTT.

## Container et images utilisés

- Home Assistant
- Eclipse-Mosquitto

## Configuration du broker MQTT

## Port mapping (Sortant)
- **Home Assistant** : 8123
- **MQTT** : 1883 (TCP)

### Création d’un utilisateur : Création d’un utilisateur :

1. Maintenant que votre conteneur fonctionne, vous devez créer un utilisateur et un mot de passe. Pour cela connectez vous en ssh sur notre serveur.

2. Rendez vous dans le volume « config » de votre conteneur. Vous trouverez le chemin de votre volume sur Portainer dans l’onglet « volume » puis cliquez sur le nom du volume.

```bash
cd /var/lib/docker/volumes/mqtt_config/_data
```

3. Ensuite, connectez vous en ssh sur votre Installation du broker Mosquitto sur Docker.

```bash
docker exec -it MQTT sh
```

4. Puis, vous devez créer votre utilisateur « admin » et définir son mot de passe.

```bash
mosquitto_passwd -c mosquitto/config/mqtt_passwd admin
```

5. Vous pouvez taper exit pour sortir de la console ssh de votre conteneur. Ensuite, éditer le fichier « mosquitto.conf » dans le volume « config » avec le code suivant.

```bash
nano mosquitto.conf
```

6. puis, pour terminer l’installation du broker Mosquitto sur Docker collez le code ci-dessous.

```conf
listener 1883
listener 9001
protocol websockets
persistence true
persistence_location /mosquitto/data
allow_anonymous false
password_file mosquitto/config/mqtt_passwd
```

7. En dernier lieu, sauvegardé votre fichier et redémarré votre conteneur. Pour tester votre broker Mosquitto, vous pouvez télécharger MQTT Explorer et essayer de vous connecter.

##### Source : [Technologie Geek](https://technologie-geek.fr/installation-broker-mosquitto-docker/)
