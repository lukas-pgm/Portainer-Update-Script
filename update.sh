#!/bin/bash
# Script written by lukas-pgm
echo "[Updater] Checking compatibility..."
if [ -x "$(command -v docker)" ]; then
    echo "[Updater] Docker installation found."
    echo "[Updater] Trying to stop portainer container..."
    sudo docker stop portainer
    echo "[Updater] Completed."
    echo "[Updater] Trying to remove old portainer container..."
    sudo docker rm portainer
    echo "[Updater] Completed."
    echo "[Updater] Trying to pull the new version of portainer..."
    sudo docker pull portainer/portainer-ce:latest
    echo "[Updater] Completed."
    echo "[Updater] Trying to launch the newest version of portainer..."
    sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    echo "[Updater] Completed."
    echo ""
    echo "[Updater] Update finished!"
else
    echo ""
    echo "No docker installation found!"
fi
