#!/bin/bash
# Configure KDE top panel with virtual desktops pager
# This script creates a top panel with a virtual desktop pager widget

CONFIG_FILE="$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"

# Function to get the next available containment ID
get_next_containment_id() {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "100"
        return
    fi

    # Find all containment IDs and get the highest one
    local max_id=$(grep -oP '^\[Containments\]\[\K[0-9]+(?=\])' "$CONFIG_FILE" 2>/dev/null | sort -n | tail -1)

    if [ -z "$max_id" ]; then
        echo "100"
    else
        echo $((max_id + 1))
    fi
}

# Function to get the next available applet ID
get_next_applet_id() {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "100"
        return
    fi

    # Find all applet IDs (both in Containments and nested Applets)
    local max_id=$(grep -oP '\[Applets\]\[\K[0-9]+(?=\])' "$CONFIG_FILE" 2>/dev/null | sort -n | tail -1)

    if [ -z "$max_id" ]; then
        echo "100"
    else
        echo $((max_id + 1))
    fi
}

# Check if a top panel already exists
check_existing_top_panel() {
    if [ ! -f "$CONFIG_FILE" ]; then
        return 1
    fi

    # Check for any panel with location=3 (top)
    grep -q "location=3" "$CONFIG_FILE" 2>/dev/null
    return $?
}

# Main function to create top panel with pager
create_top_panel() {
    echo "Configuring KDE top panel with virtual desktops..."

    # Check if top panel already exists
    if check_existing_top_panel; then
        echo "A top panel already exists. Skipping creation."
        echo "To recreate, manually remove the top panel first from System Settings."
        return 0
    fi

    # Get IDs for the new panel and widget
    local panel_id=$(get_next_containment_id)
    local pager_id=$(get_next_applet_id)

    echo "Creating top panel (ID: $panel_id) with pager widget (ID: $pager_id)..."

    # Backup existing configuration
    cp "$CONFIG_FILE" "${CONFIG_FILE}.backup.$(date +%s)" 2>/dev/null || true

    # Add the panel containment
    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --key "activityId" ""

    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --key "formfactor" "2"

    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --key "immutability" "1"

    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --key "lastScreen" "0"

    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --key "location" "3"

    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --key "plugin" "org.kde.panel"

    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --key "wallpaperplugin" "org.kde.image"

    # Add the pager widget to the panel
    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --group "Applets" \
        --group "$pager_id" \
        --key "immutability" "1"

    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --group "Applets" \
        --group "$pager_id" \
        --key "plugin" "org.kde.plasma.pager"

    # Configure the pager widget
    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --group "Applets" \
        --group "$pager_id" \
        --group "Configuration" \
        --group "General" \
        --key "displayedText" "Number"

    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --group "Applets" \
        --group "$pager_id" \
        --group "Configuration" \
        --group "General" \
        --key "showWindowOutlines" "false"

    # Set the applet order in the panel
    kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc \
        --group "Containments" \
        --group "$panel_id" \
        --group "General" \
        --key "AppletOrder" "$pager_id"

    echo "Top panel configuration written to $CONFIG_FILE"
    echo ""
    echo "Restarting plasmashell to apply changes..."

    # Restart plasmashell to apply changes
    killall plasmashell 2>/dev/null || true
    sleep 2
    plasmashell &
    disown

    echo ""
    echo "Top panel with virtual desktops created successfully!"
    echo "The panel should appear at the top of your screen showing virtual desktop numbers."
}

# Run the main function
create_top_panel
