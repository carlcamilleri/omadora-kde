#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export OMADORA_ONLINE_INSTALL=true

ansi_art='                 ▄▄▄
 ▄█████▄    ▄███████████▄    ▄███████   ▄███████   ▄███████   ▄█   █▄    ▄█   █▄
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   █▀   ███   ███  ███   ███
███   ███  ███   ███   ███ ▄███▄▄▄███ ▄███▄▄▄██▀  ███       ▄███▄▄▄███▄ ███▄▄▄███
███   ███  ███   ███   ███ ▀███▀▀▀███ ▀███▀▀▀▀    ███      ▀▀███▀▀▀███  ▀▀▀▀▀▀███
███   ███  ███   ███   ███  ███   ███ ██████████  ███   █▄   ███   ███  ▄██   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
 ▀█████▀    ▀█   ███   █▀   ███   █▀   ███   ███  ███████▀   ███   █▀    ▀█████▀
                                       ███   █▀

                              OMADORA KDE
                      Fedora KDE Spin Configuration'

clear
echo -e "\n$ansi_art\n"

# Update system and install git
sudo dnf update -y
sudo dnf install -y git

# Use custom repo if specified, otherwise default to your repo
OMADORA_REPO="${OMADORA_REPO:-carlcamilleri/omadora-kde}"

echo -e "\nCloning Omadora KDE from: https://github.com/${OMADORA_REPO}.git"
rm -rf ~/.local/share/omadora-kde/
git clone "https://github.com/${OMADORA_REPO}.git" ~/.local/share/omadora-kde >/dev/null

# Use custom branch if instructed, otherwise default to main
OMADORA_REF="${OMADORA_REF:-main}"
if [[ $OMADORA_REF != "main" ]]; then
  echo -e "\e[32mUsing branch: $OMADORA_REF\e[0m"
  cd ~/.local/share/omadora-kde
  git fetch origin "${OMADORA_REF}" && git checkout "${OMADORA_REF}"
  cd -
fi

# Set mirror for dev installs (optional - can be used for testing repos)
if [[ $OMADORA_REF == "dev" ]]; then
  export OMADORA_MIRROR=edge
else
  export OMADORA_MIRROR=stable
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omadora-kde/install.sh
