stop_install_log

clear
echo
cat ~/.local/share/omadora-kde/logo.txt 2>/dev/null || echo "OMADORA KDE"
echo
echo

# Display installation time if available
if [[ -f $OMADORA_INSTALL_LOG_FILE ]] && grep -q "Omadora:" "$OMADORA_INSTALL_LOG_FILE" 2>/dev/null; then
  echo
  OMADORA_TIME=$(tail -n 20 "$OMADORA_INSTALL_LOG_FILE" | grep "^Omadora:" | sed 's/^Omadora:[[:space:]]*//')
  if [ -n "$OMADORA_TIME" ]; then
    echo "Installed in $OMADORA_TIME"
  fi
else
  echo "Installation completed!"
fi

echo
echo "Omadora KDE has been installed successfully."
echo

# Ask if user wants to reboot
if gum confirm "Reboot now?" --default; then
  clear
  sudo reboot 2>/dev/null
else
  echo "You can reboot later to apply all changes."
  echo "Run 'sudo reboot' when ready."
fi
