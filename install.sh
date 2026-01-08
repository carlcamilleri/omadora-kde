#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Omadora locations
export OMADORA_PATH="$HOME/.local/share/omadora-kde"
export OMADORA_INSTALL="$OMADORA_PATH/install"
export OMADORA_INSTALL_LOG_FILE="/var/log/omadora-install.log"
export PATH="$OMADORA_PATH/bin:$PATH"

# Install
source "$OMADORA_INSTALL/helpers/all.sh"
source "$OMADORA_INSTALL/preflight/all.sh"
source "$OMADORA_INSTALL/packaging/all.sh"
source "$OMADORA_INSTALL/config/all.sh"
source "$OMADORA_INSTALL/post-install/all.sh"
