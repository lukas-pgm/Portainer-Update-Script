#!/bin/bash
# Script written by lukas-pgm
echo "Checking compatibility..."
if [ -x "$(command -v docker)" ]; then
    echo "Docker installation found."
    echo ""
    echo "Trying to stop portainer container..."
    sudo docker stop portainer
    echo "Completed."
    echo "Trying to remove old portainer container..."
    sudo docker rm portainer
    echo "Completed."
    echo "Trying to pull the new version of portainer..."
    sudo docker pull portainer/portainer-ce:latest
    echo "Completed."
    echo "Trying to launch the newest version of portainer..."
    sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    echo "Completed."
    echo ""
    echo ""
    echo "Update finished!"
else
    echo "No docker installation found!"
fi
