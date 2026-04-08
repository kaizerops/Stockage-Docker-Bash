# Stockage-Docker-Bash


# ☁️ Projet : Stockage et Archivage Automatique (Clinique)

Ce dépôt contient les livrables du TP de mise en œuvre d'une solution de stockage Cloud et d'archivage automatisé pour une infrastructure de clinique comportant plusieurs annexes.

## 📋 Contexte du projet
* **Partie 1 :** Déploiement d'un serveur Cloud privé (Owncloud) pour assurer le partage et la synchronisation sécurisée des fichiers au sein de la clinique.
* **Partie 2 :** Centralisation des logs téléphoniques (TOIP) d'une annexe vers le serveur FTP principal (OpenMediaVault) du site.

## 🛠️ Technologies utilisées
* **Serveur Cloud :** Owncloud (déployé via conteneurisation Docker)
* **Serveur de destination (Principal) :** OMV (OpenMediaVault) / Serveur FTP
* **Automatisation :** Scripting Bash et tâches planifiées (Cron) sous Debian 12.

## 🚀 Contenu du dépôt
* `archivage_toip.sh` : Le script d'automatisation chargé de copier, compresser (ZIP) et transférer les logs CSV vers le serveur principal.
* `Compte_Rendu_TP.pdf` : Le document détaillant l'installation de l'architecture, la justification des choix techniques (LDAP) et les preuves de fonctionnement.

## ⚙️ Déploiement de l'automatisation
Le script `archivage_toip.sh` s'exécute automatiquement tous les jours à 23h45 via la crontab suivante :
`45 23 * * * /chemin/vers/archivage_toip.sh >> /chemin/vers/archivage.log 2>&1`

## 🚀 Contenu du dépôt
* `docker-compose.yml` : Le fichier de configuration permettant le déploiement automatisé du conteneur Owncloud.
* `archivage_toip.sh` : Le script d'automatisation chargé de copier, compresser (ZIP) et transférer les logs CSV vers le serveur principal.
* `Compte_Rendu_TP.pdf` : Le document détaillant l'installation de l'architecture, la justification des choix techniques (LDAP) et les preuves de fonctionnement.
