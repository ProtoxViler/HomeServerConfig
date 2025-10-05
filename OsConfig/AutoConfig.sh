# !/bin/bash

echo Configuration automatique de l'OS
echo -------------------------------
echo
echo 1. Sudo & Update
echo 2. SSH
echo 3. XRDP
echo 4. Samba
echo 5. Cloudflare
echo 6. Tout
echo
read -p "Choix: " choice
echo

case $choice in
  1) bash OsConfig/SudoAndUpdate.sh ;;
  2) bash OsConfig/SSHConfig.sh ;;
  3) bash OsConfig/XRDPConfig.sh ;;
  4) bash OsConfig/SambaConfig.sh ;;
  5) bash OsConfig/CloudflareConfig.sh ;;
  6) bash OsConfig/AutoConfig.sh ;;
  *) echo "Choix invalide." ;;
esac
