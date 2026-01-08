#!/bin/bash
# Configure KDE global shortcuts adapted from Omarchy
# This script uses kwriteconfig5 to set KDE shortcuts

# Helper function to set a KDE shortcut
set_kde_shortcut() {
  local group="$1"
  local key="$2"
  local value="$3"
  kwriteconfig5 --file kglobalshortcutsrc --group "$group" --key "$key" "$value"
}

# Workspace switching shortcuts (Meta+1-9 for workspaces 1-9)
for i in {1..9}; do
  set_kde_shortcut "kwin" "Switch to Desktop $i" "Meta+$i,none,Switch to Desktop $i"
  set_kde_shortcut "kwin" "Window to Desktop $i" "Meta+Shift+$i,none,Window to Desktop $i"
done

# Workspace navigation
set_kde_shortcut "kwin" "Switch to Next Desktop" "Meta+Tab,none,Switch to Next Desktop"
set_kde_shortcut "kwin" "Switch to Previous Desktop" "Meta+Shift+Tab,none,Switch to Previous Desktop"

# Window management
set_kde_shortcut "kwin" "Close Window" "Meta+W,Alt+F4,Close Window"
set_kde_shortcut "kwin" "Window Fullscreen" "Meta+F,none,Make Window Fullscreen"
set_kde_shortcut "kwin" "Window Maximize" "Meta+Up,Meta+PgUp,Maximize Window"
set_kde_shortcut "kwin" "Window Minimize" "Meta+Down,Meta+PgDown,Minimize Window"

# Window focus navigation
set_kde_shortcut "kwin" "Walk Through Windows" "Alt+Tab,Alt+Tab,Walk Through Windows"
set_kde_shortcut "kwin" "Walk Through Windows (Reverse)" "Alt+Shift+Tab,Alt+Shift+Backtab,Walk Through Windows (Reverse)"

# Window positioning
set_kde_shortcut "kwin" "Window Quick Tile Left" "Meta+Left,Meta+Left,Quick Tile Window to the Left"
set_kde_shortcut "kwin" "Window Quick Tile Right" "Meta+Right,Meta+Right,Quick Tile Window to the Right"
set_kde_shortcut "kwin" "Window Quick Tile Top" "Meta+Shift+Up,none,Quick Tile Window to the Top"
set_kde_shortcut "kwin" "Window Quick Tile Bottom" "Meta+Shift+Down,none,Quick Tile Window to the Bottom"

# KRunner (application launcher)
set_kde_shortcut "org.kde.krunner.desktop" "_launch" "Meta+Space\tAlt+F2\tSearch,Alt+Space\tAlt+F2\tSearch,KRunner"

# System shortcuts
set_kde_shortcut "ksmserver" "Lock Session" "Meta+Ctrl+L\tScreensaver Lock,Meta+L\tScreensaver Lock,Lock Session"
set_kde_shortcut "ksmserver" "Log Out" "Ctrl+Alt+Del,Ctrl+Alt+Del,Leave"

# Screenshots (using Spectacle)
set_kde_shortcut "org.kde.spectacle.desktop" "RectangularRegionScreenShot" "Print,Meta+Shift+Print,Capture Rectangular Region"
set_kde_shortcut "org.kde.spectacle.desktop" "FullScreenScreenShot" "Shift+Print,none,Capture Entire Desktop"
set_kde_shortcut "org.kde.spectacle.desktop" "ActiveWindowScreenShot" "Meta+Print,Meta+Print,Capture Active Window"

# Dolphin (file manager)
set_kde_shortcut "org.kde.dolphin.desktop" "_launch" "Meta+Shift+F,none,Dolphin"

# Konsole (terminal)
set_kde_shortcut "org.kde.konsole.desktop" "_launch" "Meta+Return,none,Konsole"

# Calculator
set_kde_shortcut "org.kde.kcalc.desktop" "_launch" "XF86Calculator,none,KCalc"

# Virtual Desktop Management
set_kde_shortcut "kwin" "Switch One Desktop to the Left" "Meta+Ctrl+Left,Meta+Ctrl+Left,Switch One Desktop to the Left"
set_kde_shortcut "kwin" "Switch One Desktop to the Right" "Meta+Ctrl+Right,Meta+Ctrl+Right,Switch One Desktop to the Right"
set_kde_shortcut "kwin" "Switch One Desktop Up" "Meta+Ctrl+Up,Meta+Ctrl+Up,Switch One Desktop Up"
set_kde_shortcut "kwin" "Switch One Desktop Down" "Meta+Ctrl+Down,Meta+Ctrl+Down,Switch One Desktop Down"

# Move window to adjacent desktop
set_kde_shortcut "kwin" "Window One Desktop to the Left" "Meta+Shift+Ctrl+Left,none,Window One Desktop to the Left"
set_kde_shortcut "kwin" "Window One Desktop to the Right" "Meta+Shift+Ctrl+Right,none,Window One Desktop to the Right"
set_kde_shortcut "kwin" "Window One Desktop Up" "Meta+Shift+Ctrl+Up,none,Window One Desktop Up"
set_kde_shortcut "kwin" "Window One Desktop Down" "Meta+Shift+Ctrl+Down,none,Window One Desktop Down"

# Present Windows (window overview)
set_kde_shortcut "kwin" "Overview" "Meta+O,Meta+W,Toggle Overview"

# Desktop Grid (show all desktops)
set_kde_shortcut "kwin" "ShowDesktopGrid" "Meta+G,Ctrl+F8,Show Desktop Grid"

# Minimize all windows (show desktop)
set_kde_shortcut "kwin" "Show Desktop" "Meta+D,Meta+D,Peek at Desktop"

# Task Manager Entry shortcuts (Alt+1-9 to activate taskbar icons)
for i in {1..9}; do
  set_kde_shortcut "plasmashell" "activate task manager entry $i" "Alt+$i,none,Activate Task Manager Entry $i"
done

echo "KDE shortcuts configured successfully!"
echo "Note: You may need to log out and log back in for all shortcuts to take effect."
