#!/bin/bash

# Install scrips
SSHFolder="/home/$USER/.ssh"
configFolder="/home/$USER/.config"


yay -S --needed - < needed-packages.md

echo "enter ssh private key"
read sshKey

SSHfolder="/home/$USER/.ssh"

if [ -d "$SSHFolder" ]; then
    :
else
   mkdir /home/$USER/.ssh/
fi

if [ -d "$configFolder"]; then
	:
else
   mkdir /home/$USER/.config/
fi

echo sshKey /home/$USER/.ssh/id_rsa

cp -r .ssh .gitconfig .zshrc .vscode-oss .boto /home/$USER
cp -r hypr neofetch spotify terminator waybar wofi /home/$USER/.config
cp -r sddm.config /etc/
cp -r sddm_themes/silent /usr/share/sddm/themes/
cp settings.json "/home/$USER/.config/Code - OSS/User/"


