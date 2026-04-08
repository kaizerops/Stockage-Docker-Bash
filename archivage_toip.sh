#!/bin/bash

# ==============================================================================
# SCRIPT D'ARCHIVAGE AUTOMATIQUE DES LOGS TOIP
# ==============================================================================

# --- Variables de configuration ---
FTP_HOST="192.168.20.50"
FTP_USER="utilisateur_omv"   # À remplacer par ton vrai identifiant FTP OMV
FTP_PASS="mot_de_passe_omv"  # À remplacer par ton vrai mot de passe FTP OMV

DIR_TOIP="/home/debian/toip"
DIR_ARCHIVE="/home/debian/archive"

# --- Formatage de la date (sio2-jour-mois-année_heure:minutes:secondes) ---
DATE_TIME=$(date +"%d-%m-%Y_%H:%M:%S")
NOM_BASE="sio2-${DATE_TIME}"

# ==============================================================================
# 1. Sauvegarde locale du fichier CSV
# ==============================================================================
echo "Création de la sauvegarde locale..."
cp "$DIR_TOIP/logs_telephoniques.csv" "$DIR_ARCHIVE/${NOM_BASE}.csv"

# ==============================================================================
# 2. Compression du contenu du répertoire toip
# ==============================================================================
echo "Compression en cours..."
cd "$DIR_TOIP" || exit
zip -r "$DIR_ARCHIVE/${NOM_BASE}.zip" ./*

# ==============================================================================
# 3. Transfert FTP vers le serveur principal (OMV)
# ==============================================================================
echo "Envoi vers le serveur FTP distant ($FTP_HOST)..."
ftp -inv "$FTP_HOST" <<EOF
user $FTP_USER $FTP_PASS
mkdir archives_toip
cd archives_toip
lcd $DIR_ARCHIVE
put ${NOM_BASE}.zip
bye
EOF

echo "Archivage terminé avec succès."
