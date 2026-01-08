abort() {
  echo -e "\e[31mOmadora KDE install requires: $1\e[0m"
  echo
  gum confirm "Proceed anyway on your own accord and without assistance?" || exit 1
}

# Must be Fedora
if [[ ! -f /etc/fedora-release ]]; then
  abort "Fedora Linux"
fi

# Must not be running as root
if [ "$EUID" -eq 0 ]; then
  abort "Running as root (not user)"
fi

# Must be x86_64 only to fully work
if [ "$(uname -m)" != "x86_64" ]; then
  abort "x86_64 CPU"
fi

# Must have KDE Plasma installed (this is for KDE spin)
if ! rpm -q plasma-desktop &>/dev/null; then
  abort "Fedora KDE Spin (plasma-desktop not found)"
fi

# Cleared all guards
echo "Guards: OK"
