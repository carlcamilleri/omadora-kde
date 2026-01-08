#!/bin/bash
# Install packages not available in Fedora repos

# Install starship prompt (from their installer)
if ! command -v starship &>/dev/null; then
  echo "Installing starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# eza is not available in Fedora repos, use ls with color instead
# The alias is already set in default/bash/rc
