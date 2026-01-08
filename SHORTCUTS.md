# Omadora KDE Keyboard Shortcuts

This document lists all keyboard shortcuts configured in Omadora KDE, adapted from Omarchy.

## Notation
- `Meta` = Windows/Super key
- `Ctrl` = Control key
- `Alt` = Alt key
- `Shift` = Shift key

## Workspaces (Virtual Desktops)

### Switch to Workspace
- `Meta+1` through `Meta+9` - Switch to workspaces 1-9
- `Meta+Tab` - Next workspace
- `Meta+Shift+Tab` - Previous workspace
- `Meta+Ctrl+Left/Right/Up/Down` - Switch to adjacent workspace

### Move Windows Between Workspaces
- `Meta+Shift+1` through `Meta+Shift+9` - Move active window to workspace 1-9
- `Meta+Shift+Ctrl+Left/Right/Up/Down` - Move window to adjacent workspace

## Applications

### Core Applications
- `Meta+Return` - Open terminal (Konsole)
- `Meta+Shift+F` - File manager (Dolphin)
- `Meta+Shift+B` - Browser
- `Meta+Shift+Alt+B` - Browser (private mode)
- `Meta+Shift+N` - Code editor
- `Meta+Shift+D` - LazyDocker (TUI)

### Web Applications (via omadora-launch-webapp)
The following shortcuts can be configured to launch web apps in standalone windows:
- `Meta+Shift+A` - ChatGPT
- `Meta+Shift+Y` - YouTube
- `Meta+Shift+X` - X (Twitter)
- `Meta+Shift+E` - Email (webmail)
- `Meta+Shift+C` - Calendar (web calendar)

Web apps are installed as .desktop files and can be launched via:
- KRunner (Meta+Space) - Type the app name
- Application Launcher - Find in the Internet category

### Launchers
- `Meta+Space` - KRunner (application launcher)
- `XF86Calculator` - Calculator

## Window Management

### Basic Window Operations
- `Meta+W` - Close window
- `Meta+F` - Fullscreen
- `Meta+D` - Show desktop (minimize all)
- `Meta+O` - Overview (show all windows)
- `Meta+G` - Desktop grid (show all desktops)

### Window Positioning
- `Meta+Left` - Tile window to left half
- `Meta+Right` - Tile window to right half
- `Meta+Up` - Maximize window
- `Meta+Down` - Minimize window
- `Meta+Shift+Up` - Tile window to top half
- `Meta+Shift+Down` - Tile window to bottom half

### Window Navigation
- `Alt+Tab` - Cycle through windows
- `Alt+Shift+Tab` - Cycle through windows (reverse)

## System

### System Controls
- `Meta+Ctrl+L` - Lock screen
- `Ctrl+Alt+Del` - Log out menu

### Screenshots (Spectacle)
- `Print` - Capture rectangular region (with editing)
- `Shift+Print` - Capture entire desktop
- `Meta+Print` - Capture active window

## Media Controls

### Audio (Laptop Keys)
- `XF86AudioRaiseVolume` - Volume up
- `XF86AudioLowerVolume` - Volume down
- `XF86AudioMute` - Toggle mute
- `XF86AudioMicMute` - Toggle microphone mute

### Brightness (Laptop Keys)
- `XF86MonBrightnessUp` - Brightness up
- `XF86MonBrightnessDown` - Brightness down

### Media Playback
- `XF86AudioPlay/Pause` - Play/pause
- `XF86AudioNext` - Next track
- `XF86AudioPrev` - Previous track

## Advanced Features

### System Monitoring
- `Meta+Ctrl+T` - System monitor (btop in terminal)

## Not Included from Omarchy

The following Omarchy shortcuts are **not included** because they are Hyprland-specific:

### Hyprland Tiling Features
- Window tiling controls (togglesplit, pseudo, togglefloating)
- Scratchpad workspace
- Window grouping and group navigation
- Manual window resizing with keyboard
- Swapping windows with arrow keys

### Hyprland-Specific Utilities
- Waybar toggle
- Mako notifications (KDE uses its own notification system)
- Hyprland transparency controls
- Walker application launcher (KDE uses KRunner)
- Custom Omarchy menus (theme menu, system menu, etc.)

### Display/Hardware Specific
- Apple Display brightness controls
- Hyprsunset (night light) - KDE has built-in night color
- SwayOSD - KDE has built-in OSD

## KDE-Specific Features

Omadora KDE uses KDE Plasma's built-in features instead:

- **Notifications**: KDE Notification Center (accessible from system tray)
- **Night Light**: System Settings > Display > Night Color
- **Application Launcher**: KRunner (Meta+Space)
- **System Menu**: K-Menu or Application Dashboard
- **Window Overview**: Overview effect (Meta+O)
- **Desktop Grid**: Show all virtual desktops (Meta+G)

## Customization

To customize shortcuts:

1. **System Settings** → **Shortcuts** → **Global Shortcuts**
2. Edit `~/.config/kglobalshortcutsrc` directly
3. Modify `~/.local/share/omadora-kde/install/config/kde-shortcuts.sh` and re-run

To add more custom application shortcuts:

1. Edit `~/.local/share/omadora-kde/install/config/custom-shortcuts.sh`
2. Add launcher scripts in `~/.local/share/omadora-kde/bin/`
3. Re-run the configuration scripts

### Installing Web Apps

Create your own web app launchers:

```bash
# Interactive mode
omadora-webapp-install

# Or specify directly
omadora-webapp-install "App Name" "https://example.com" "https://example.com/icon.png"

# Remove a web app
omadora-webapp-remove "App Name"
```

The web apps appear in KRunner and Application Launcher just like native applications!

## Notes

- Some shortcuts may conflict with existing KDE shortcuts. Check System Settings if a shortcut doesn't work.
- You may need to log out and log back in after installation for all shortcuts to take effect.
- Media keys (XF86Audio*, XF86MonBrightness*) work automatically on most laptops.
