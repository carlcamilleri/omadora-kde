# Copy over Omadora configs
mkdir -p ~/.config
if [ -d "$OMADORA_PATH/config" ]; then
  cp -R "$OMADORA_PATH/config"/* ~/.config/ 2>/dev/null || true
fi

# Use default bashrc from Omadora if it exists
if [ -f "$OMADORA_PATH/default/bashrc" ]; then
  cp "$OMADORA_PATH/default/bashrc" ~/.bashrc
fi
