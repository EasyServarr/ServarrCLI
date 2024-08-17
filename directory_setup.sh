# Gather variables from your .env file
set -a
source .env
set +a

# Main users
sudo useradd homarr -u $HOMARR_UID
sudo useradd radarr -u $RADARR_UID
sudo useradd sonarr -u $SONARR_UID
sudo useradd lidarr -u $LIDARR_UID
sudo useradd readarr -u $READARR_UID 

# Request tool users
sudo useradd jellyseerr -u $JELLYSEER_UID
sudo useradd overseerr -u $OVERSEER_UID

# Indexer users
sudo useradd prowlarr -u $PROWLARR_UID
sudo useradd jackett -u $JACKETT_UID

# Media server users
sudo useradd jellyfin -u $JELLYFIN_UID
sudo useradd plex -u $PLEX_UID

# Torrenter users
sudo useradd qbittorrent -u $QBITTORRENT_UID

# Create group
sudo groupadd mediaservarr -g $MEDIASERVARR_GID

# Give permissions to mediaservarr group, safer this way then running all as root
# Its recommended to reboot your server after running this script
sudo usermod -a -G mediaservarr $USER

# Adds main users to mediaservarr group
sudo usermod -a -G mediaservarr homarr
sudo usermod -a -G mediaservarr radarr
sudo usermod -a -G mediaservarr sonarr
sudo usermod -a -G mediaservarr lidarr
sudo usermod -a -G mediaservarr readarr

# Adds request tool users to mediaservarr group
sudo usermod -a -G mediaservarr jellyseerr
sudo usermod -a -G mediaservarr overseerr

# Adds indexer users to to mediaservarr group
sudo usermod -a -G mediaservarr prowlarr
sudo usermod -a -G mediaservarr jackett

# Adds media server users to mediaservarr group
sudo usermod -a -G mediaservarr jellyfin
sudo usermod -a -G mediaservarr plex

# Adds torrenter users to mediaservarr group
sudo usermod -a -G mediaservarr qbittorrent

# Adds required directorys for hardlinking as well as for configs
sudo mkdir -pv ${ROOT_DIR:-.}/config/{homarr, radarr, sonarr, lidarr, readarr, jellyseerr, overseerr, prowlarr, jackett, jellyfin, plex, qbittorrent}-config
sudo mkdir -pv ${ROOT_DIR:-.}/data/{torrents,media}/{tv,movies,music,books}

# Sets the permissions for all the direcotrys created above

sudo chmod -R 775 ${ROOT_DIR:-.}/data/
sudo chmod -R 775 ${ROOT_DIR:-.}/config/

# Gives permissions to the main user (you)
sudo chown -R $UID:mediaservarr ${ROOT_DIR:-.}/data/
sudo chown -R $UID:mediaservarr ${ROOT_DIR:-.}/config/

# Main users
sudo chown -R homarr:mediaservarr ${ROOT_DIR:-.}/config/homarr-config
sudo chown -R radarr:mediaservarr ${ROOT_DIR:-.}/config/radarr-config
sudo chown -R sonarr:mediaservarr ${ROOT_DIR:-.}/config/sonarr-config
sudo chown -R lidarr:mediaservarr ${ROOT_DIR:-.}/config/lidarr-config
sudo chown -R readarr:mediaservarr ${ROOT_DIR:-.}/config/readarr-config

# Request tool users
sudo chown -R jellyseerr:mediaservarr ${ROOT_DIR:-.}/config/jellyseerr-config
sudo chown -R overseerr:mediaservarr ${ROOT_DIR:-.}/config/overseerr-config

# Indexer users
sudo chown -R prowlarr:mediaservarr ${ROOT_DIR:-.}/config/prowlarr-config
sudo chown -R jackett:mediaservarr ${ROOT_DIR:-.}/config/jackett-config

# Media server users
sudo chown -R jellyfin:mediaservarr ${ROOT_DIR:-.}/config/jellyfin-config
sudo chown -R plex:mediaservarr ${ROOT_DIR:-.}/config/plex-config

# Torrenter users
sudo chown -R qbittorrent:mediaservarr ${ROOT_DIR:-.}/config/qbittorrent-config

echo "Done! It is recommended to reboot now so the permissions are set correctly"

# TEST