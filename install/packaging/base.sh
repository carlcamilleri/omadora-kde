# Install all base DNF packages
mapfile -t packages < <(grep -v '^#' "$OMADORA_INSTALL/omadora-base.packages" | grep -v '^$')
sudo dnf install -y "${packages[@]}"
