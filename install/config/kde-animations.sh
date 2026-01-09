#!/bin/bash
# Configure KDE animations to instant (no animations)
# This script disables all animations for a snappy, responsive desktop experience

echo "Configuring instant animations (disabling all animations)..."

# Set global animation duration to 0 (instant)
# This is the main setting that affects most KDE animations
kwriteconfig5 --file kdeglobals --group KDE --key AnimationDurationFactor 0

# Window manager animation settings
# Disable window open/close animations
kwriteconfig5 --file kwinrc --group Effect-kwin4_effect_fade --key Duration 0

# Disable various KWin effects for instant response
kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_fadeEnabled false
kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_translucencyEnabled false
kwriteconfig5 --file kwinrc --group Plugins --key slideEnabled false
kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_squashEnabled false
kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_morphingpopupsEnabled false

# Disable desktop switching animations
kwriteconfig5 --file kwinrc --group Plugins --key slideEnabled false

# Disable minimize/maximize animations
kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_squashEnabled false

# Set compositing animation speed to instant
kwriteconfig5 --file kwinrc --group Compositing --key AnimationSpeed 0

# Disable tooltip animations
kwriteconfig5 --file plasmarc --group PlasmaToolTips --key Delay 0

echo ""
echo "Animation settings configured:"
echo "  - Global animation duration: 0 (instant)"
echo "  - Window effects: disabled"
echo "  - Desktop switching: instant"
echo "  - Minimize/maximize: instant"
echo ""
echo "Note: Some changes may require logging out and back in to take full effect."
echo "You can also run: kwin_x11 --replace & (or kwin_wayland --replace on Wayland)"
