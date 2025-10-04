# Configuration Cloudflared (Cloudflare)

## Prérequis (OBLIGATOIRE)

- Avoir un compte Cloudflare
- Avoir un domaine (gratuit ou payant) ajouté à Cloudflare

## 1. Installation de Cloudflared

```bash
# Add cloudflare gpg key
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

# Add this repo to your apt repositories
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | sudo tee /etc/apt/sources.list.d/cloudflared.list

# install cloudflared
sudo apt-get update && sudo apt-get install cloudflared
```

## 2. Configuration de Cloudflared

1. Aller dans le tableau de bord Cloudflare
2. Aller dans la section "Zero Trust" (https://one.dash.cloudflare.com/)
3. Aller dans "Réseaux" > "Applications" > "Tunnels" > "Créer un tunnel"
4. Séléctionner "Clouflared" puis donner un nom au tunnel et cliquer sur "Suivant"
5. Sélectionner "Debian" puis copier la commande fournie (sudo cloudflared service install #####)
6. Coller et exécuter la commande dans le terminal du serveur

## Utilisation

à venir...
