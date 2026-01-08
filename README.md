# Omadora KDE

A modern, opinionated Fedora KDE configuration inspired by [Omarchy](https://omarchy.org).

## Overview

Omadora KDE is a configuration framework for Fedora KDE Spin that provides:

- **Modular installation system** - Organized scripts for packages, configuration, and post-install tasks
- **Modern development environment** - Pre-configured tools for developers
- **KDE Plasma desktop** - Beautiful and functional desktop environment
- **Automated setup** - One-command installation of a complete system

## Requirements

- **Fedora KDE Spin** (tested on Fedora 39+)
- **x86_64 architecture**
- **Non-root user** with sudo privileges
- **Internet connection** for downloading packages

## Installation

### Quick Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/omadora-kde/main/boot.sh)
```

### Manual Install

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/omadora-kde.git ~/.local/share/omadora-kde

# Run the installer
cd ~/.local/share/omadora-kde
./install.sh
```

### Custom Installation

You can customize the installation using environment variables:

```bash
# Use a custom repository
export OMADORA_REPO="yourusername/omadora-kde"

# Use a specific branch
export OMADORA_REF="dev"

# Set git user information
export OMADORA_USER_NAME="Your Name"
export OMADORA_USER_EMAIL="your.email@example.com"

# Run the installer
bash boot.sh
```

## What Gets Installed

### Core Packages

- **Development Tools**: git, gcc, clang, rust, go, nodejs, python
- **Terminal Emulators**: alacritty, kitty, konsole
- **Shell Enhancements**: starship, zoxide, fzf, ripgrep, bat, eza
- **Containers**: docker, docker-compose, podman
- **Editors**: neovim, vim
- **Version Control**: git, gh (GitHub CLI), lazygit

### Desktop Applications (via Flatpak)

- **Browsers**: Brave, Chromium
- **Communication**: Discord, Signal
- **Productivity**: Obsidian, Spotify, VS Code
- **Media**: VLC, GIMP, Inkscape, Kdenlive

### Web Applications

Omadora KDE includes a web app installer that creates standalone browser windows for web services:

- **Pre-installed**: ChatGPT, YouTube, GitHub, X, WhatsApp, Discord, Google Photos, Google Messages, Zoom
- **Custom apps**: Install any website as an app with `omadora-webapp-install`

Web apps appear in KRunner and the Application Launcher like native applications.

### Configurations

- **Starship prompt** - Beautiful shell prompt
- **Git configuration** - User name and email setup
- **Docker configuration** - Optimized for development
- **Bash aliases** - Modern CLI tools (eza, bat, etc.)
- **KDE theming** - Consistent look and feel

## Project Structure

```
omadora-kde/
├── boot.sh                    # Bootstrap script for online installation
├── install.sh                 # Main installation orchestrator
├── logo.txt                   # ASCII logo
├── README.md                  # This file
├── bin/                       # Custom scripts and utilities
├── config/                    # Application configurations
│   └── starship.toml         # Starship prompt configuration
├── default/                   # Default configuration files
│   ├── bashrc                # Bash configuration
│   └── bash/
│       └── rc                # Bash runtime configuration
├── install/                   # Installation scripts
│   ├── helpers/              # Helper functions
│   │   ├── all.sh
│   │   ├── errors.sh
│   │   ├── logging.sh
│   │   └── presentation.sh
│   ├── preflight/            # Pre-installation checks
│   │   ├── all.sh
│   │   ├── guard.sh          # System requirements checks
│   │   ├── begin.sh          # Installation start
│   │   ├── show-env.sh       # Environment display
│   │   └── dnf.sh            # DNF configuration
│   ├── packaging/            # Package installation
│   │   ├── all.sh
│   │   ├── base.sh           # DNF packages
│   │   └── flatpak.sh        # Flatpak applications
│   ├── config/               # System configuration
│   │   ├── all.sh
│   │   ├── config.sh         # Copy configurations
│   │   ├── git.sh            # Git setup
│   │   ├── docker.sh         # Docker configuration
│   │   └── firewall.sh       # Firewall setup
│   ├── post-install/         # Post-installation tasks
│   │   ├── all.sh
│   │   ├── dnf-cleanup.sh    # Clean up packages
│   │   └── finished.sh       # Installation completion
│   ├── omadora-base.packages     # DNF package list
│   └── omadora-flatpak.packages  # Flatpak package list
└── themes/                   # Theme files (if any)
```

## Key Differences from Omarchy

While inspired by Omarchy, Omadora KDE is adapted for Fedora:

1. **Package Manager**: Uses `dnf` instead of `pacman`
2. **Desktop Environment**: KDE Plasma instead of Hyprland
3. **Package Sources**: Fedora repos, RPM Fusion, and Flatpak
4. **System Requirements**: Fedora-specific checks
5. **Bootloader**: No Limine/btrfs requirements
6. **Simplified**: Streamlined for Fedora KDE workflow

## Keyboard Shortcuts

Omadora KDE configures comprehensive keyboard shortcuts adapted from Omarchy. Key shortcuts include:

- **Meta+1-9** - Switch to workspaces 1-9
- **Meta+Shift+1-9** - Move window to workspace 1-9
- **Meta+Return** - Open terminal
- **Meta+Space** - Application launcher (KRunner)
- **Meta+Shift+F** - File manager
- **Meta+Shift+B** - Browser
- **Meta+W** - Close window
- **Meta+F** - Fullscreen
- **Meta+Left/Right** - Tile window left/right

See [SHORTCUTS.md](SHORTCUTS.md) for the complete list of keyboard shortcuts and what was adapted from Omarchy.

## Customization

After installation, you can customize your setup:

### Bash Configuration

Edit `~/.bashrc` to add your own aliases and functions:

```bash
# Add your custom aliases
alias myproject='cd ~/projects/myproject'

# Add custom environment variables
export MY_VAR="value"
```

### Starship Prompt

Modify `~/.config/starship.toml` to customize your prompt.

### Package Management

Add packages to the lists:
- `install/omadora-base.packages` - DNF packages
- `install/omadora-flatpak.packages` - Flatpak applications

## Troubleshooting

### Installation Logs

Installation logs are saved to `/var/log/omadora-install.log`:

```bash
# View the full log
less /var/log/omadora-install.log

# View recent errors
tail -50 /var/log/omadora-install.log
```

### Re-running Installation

If the installation fails, you can retry:

```bash
cd ~/.local/share/omadora-kde
./install.sh
```

### Common Issues

1. **Package conflicts**: Update your system first with `sudo dnf upgrade -y`
2. **Missing repositories**: Ensure RPM Fusion is enabled
3. **Network issues**: Check your internet connection

## Development

To contribute or modify:

```bash
# Fork and clone your fork
git clone https://github.com/YOUR_USERNAME/omadora-kde.git

# Make changes
# Test your changes

# Submit a pull request
```

## License

This project is released under the MIT License.

## Credits

- Inspired by [Omarchy](https://omarchy.org) by DHH
- Built for the Fedora KDE community
- Contributions welcome!

## Support

For issues and questions:
- Open an issue on GitHub
- Check the installation logs
- Review the Omarchy documentation for general concepts
