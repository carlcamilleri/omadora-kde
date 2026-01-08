# Install Flatpak if not already installed
sudo dnf install -y flatpak

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Flatpak applications
mapfile -t flatpaks < <(grep -v '^#' "$OMADORA_INSTALL/omadora-flatpak.packages" | grep -v '^$')
for app in "${flatpaks[@]}"; do
  flatpak install -y flathub "$app" || echo "Warning: Could not install $app"
done
