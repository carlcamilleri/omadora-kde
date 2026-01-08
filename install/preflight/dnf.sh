if [[ -n ${OMADORA_ONLINE_INSTALL:-} ]]; then
  # Update system and enable fastest mirror
  echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf >/dev/null
  echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf >/dev/null

  # Remove tuned-ppd if installed (conflicts with power-profiles-daemon)
  sudo dnf remove -y tuned-ppd 2>/dev/null || true

  # Install development tools (dnf5 compatible syntax)
  sudo dnf group install -y "Development Tools" "Development Libraries"

  # Enable RPM Fusion repositories (Free and Nonfree)
  sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

  # Update all packages
  sudo dnf upgrade -y --refresh
fi
