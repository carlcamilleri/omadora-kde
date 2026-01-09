#!/bin/bash
# Configure KDE to have 10 virtual desktops
# This script sets up the virtual desktop configuration for KWin

echo "Configuring 10 virtual desktops..."

# Number of desktops to create
NUM_DESKTOPS=10

# Number of rows (1 row = horizontal layout, 2 rows = 2x5 grid)
DESKTOP_ROWS=1

# Function to generate a UUID
generate_uuid() {
    if command -v uuidgen &>/dev/null; then
        uuidgen | tr '[:upper:]' '[:lower:]'
    else
        # Fallback: generate a pseudo-UUID
        cat /proc/sys/kernel/random/uuid 2>/dev/null || \
        printf '%08x-%04x-%04x-%04x-%012x\n' \
            $RANDOM$RANDOM \
            $RANDOM \
            $((RANDOM & 0x0fff | 0x4000)) \
            $((RANDOM & 0x3fff | 0x8000)) \
            $RANDOM$RANDOM$RANDOM
    fi
}

# Set the total number of desktops
kwriteconfig5 --file kwinrc --group Desktops --key Number "$NUM_DESKTOPS"

# Set the number of rows
kwriteconfig5 --file kwinrc --group Desktops --key Rows "$DESKTOP_ROWS"

# Generate IDs and names for each desktop
for i in $(seq 1 $NUM_DESKTOPS); do
    # Check if ID already exists, if not generate a new one
    existing_id=$(kreadconfig5 --file kwinrc --group Desktops --key "Id_${i}" 2>/dev/null)

    if [ -z "$existing_id" ]; then
        new_uuid=$(generate_uuid)
        kwriteconfig5 --file kwinrc --group Desktops --key "Id_${i}" "$new_uuid"
        echo "Created Desktop $i with ID: $new_uuid"
    else
        echo "Desktop $i already has ID: $existing_id"
    fi

    # Optionally set desktop names (uncomment and customize if desired)
    # kwriteconfig5 --file kwinrc --group Desktops --key "Name_${i}" "Desktop ${i}"
done

echo ""
echo "Virtual desktops configuration complete!"
echo "Number of desktops: $NUM_DESKTOPS"
echo "Desktop layout: $DESKTOP_ROWS row(s)"
echo ""
echo "Restarting KWin to apply changes..."

# Restart KWin to apply the changes
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # On Wayland, we need to restart the compositor
    echo "Wayland session detected. Changes will take effect after logout/login."
    echo "Alternatively, you can run: kwin_wayland --replace &"
else
    # On X11, we can restart kwin directly
    kwin_x11 --replace &
    disown
    echo "KWin restarted on X11."
fi

echo ""
echo "You can verify the number of desktops with:"
echo "  kreadconfig5 --file kwinrc --group Desktops --key Number"
echo ""
echo "Use Meta+1 through Meta+9 to switch to desktops 1-9"
echo "Desktop 10 can be accessed with Meta+0"
