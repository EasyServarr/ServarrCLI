# Servarr for dummies (Work in Progress)

This repository was created to hopefully help automade the downloading of servarr so that anyone can use these awesome tools!

At the time of typing this, I have no idea how to create a CLI in python, generate a docker-compose.yml, or even use shell beyond the most basic levels. I hope to use this as a learning oportunity as well has give others confidence to attemp their own projects. I hope to someday create a webui (maybe a full website) that allows you to configure EVERYTHING via a convenient GUI. I hope this finds you well and helps you start your mediaserver journey. I may create a WIKI for this, to further help new users understand the script and the arr's in general.

Also, big credits to Ezarr (Similar projects) for giving me the idea to create this, its more of a learning oportunity and im definitlye going to take alot from their project.

Ezarr: https://github.com/Luctia/ezarr

Roadmap: https://github.com/users/SouthernCure/projects/2/views/2

# Apps

**Main**
- Homarr
- Radarr
- Sonarr
- Lidarr
- Readarr

**Request Tools**
- Jellyseerr
- Overseerr

**Indexers**
- Prowlarr
- Jackett

**Media Servers**
- Jellyfin
- Plex

**Torrenter**
- qBittorrent

# Requirements

- Python3
- Docker
- Docker Compose V2

```
sudo apt-get install python3 docker.io docker-compose-v2
```

# Running the CLI (command line interface)

Clone this repository
```
git clone https://github.com/SouthernCure/ServarrCompose.git
```

Use cd to navigate to the repository file
```
cd ServarrCompose
```

Run the python script
```
python3 main.py
```
