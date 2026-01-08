#!/bin/bash
# Install common web apps as .desktop files

# Create icon directory
mkdir -p "$HOME/.local/share/applications/icons"

# Copy icons from omadora-kde/applications/icons if they exist
if [ -d "$OMADORA_PATH/applications/icons" ]; then
  cp -r "$OMADORA_PATH/applications/icons"/* "$HOME/.local/share/applications/icons/" 2>/dev/null || true
fi

# Install common web apps with icons from dashboardicons.com
omadora-webapp-install "ChatGPT" "https://chatgpt.com/" "https://cdn.dashboardicons.com/production/chatgpt/icon/ChatGPT.png"
omadora-webapp-install "YouTube" "https://youtube.com/" "https://cdn.dashboardicons.com/production/youtube/icon/YouTube.png"
omadora-webapp-install "GitHub" "https://github.com/" "https://cdn.dashboardicons.com/production/github/icon/GitHub.png"
omadora-webapp-install "X" "https://x.com/" "https://cdn.dashboardicons.com/production/x/icon/X.png"
omadora-webapp-install "WhatsApp" "https://web.whatsapp.com/" "https://cdn.dashboardicons.com/production/whatsapp/icon/WhatsApp.png"
omadora-webapp-install "Discord" "https://discord.com/channels/@me" "https://cdn.dashboardicons.com/production/discord/icon/Discord.png"
omadora-webapp-install "Figma" "https://figma.com/" "https://cdn.dashboardicons.com/production/figma/icon/Figma.png"
omadora-webapp-install "Google Photos" "https://photos.google.com/" "https://cdn.dashboardicons.com/production/google-photos/icon/Google%20Photos.png"
omadora-webapp-install "Google Messages" "https://messages.google.com/web/conversations" "https://cdn.dashboardicons.com/production/google-messages/icon/Google%20Messages.png"
omadora-webapp-install "Google Maps" "https://maps.google.com" "https://cdn.dashboardicons.com/production/google-maps/icon/Google%20Maps.png"
omadora-webapp-install "Zoom" "https://app.zoom.us/wc/home" "https://cdn.dashboardicons.com/production/zoom/icon/Zoom.png"

echo "Web apps installed successfully!"
echo "You can launch them from KRunner (Meta+Space) or the Application Launcher"
