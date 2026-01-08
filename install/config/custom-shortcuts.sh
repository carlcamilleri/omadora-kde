#!/bin/bash
# Configure custom application shortcuts using KDE's custom shortcuts system

CONFIG_FILE="$HOME/.config/khotkeysrc"

# Create custom shortcuts configuration
cat > "$CONFIG_FILE" << 'EOF'
[Data]
DataCount=10

# Terminal with Meta+Return
[Data_1]
Comment=Launch Terminal
DataCount=1
Enabled=true
Name=Terminal
SystemGroup=0
Type=SIMPLE_ACTION_DATA

[Data_1Actions]
ActionsCount=1

[Data_1Actions0]
CommandURL=konsole
Type=COMMAND_URL

[Data_1Conditions]
Comment=
ConditionsCount=0

[Data_1Triggers]
Comment=Simple_action
TriggersCount=1

[Data_1Triggers0]
Key=Meta+Return
Type=SHORTCUT
Uuid={d03619b6-9b3c-496a-a937-f65b621c1a46}

# File Manager with Meta+Shift+F
[Data_2]
Comment=Launch File Manager
DataCount=1
Enabled=true
Name=File Manager
SystemGroup=0
Type=SIMPLE_ACTION_DATA

[Data_2Actions]
ActionsCount=1

[Data_2Actions0]
CommandURL=dolphin
Type=COMMAND_URL

[Data_2Conditions]
Comment=
ConditionsCount=0

[Data_2Triggers]
Comment=Simple_action
TriggersCount=1

[Data_2Triggers0]
Key=Meta+Shift+F
Type=SHORTCUT
Uuid={a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d}

# Browser with Meta+Shift+B
[Data_3]
Comment=Launch Browser
DataCount=1
Enabled=true
Name=Browser
SystemGroup=0
Type=SIMPLE_ACTION_DATA

[Data_3Actions]
ActionsCount=1

[Data_3Actions0]
CommandURL=$HOME/.local/share/omadora-kde/bin/omadora-launch-browser
Type=COMMAND_URL

[Data_3Conditions]
Comment=
ConditionsCount=0

[Data_3Triggers]
Comment=Simple_action
TriggersCount=1

[Data_3Triggers0]
Key=Meta+Shift+B
Type=SHORTCUT
Uuid={b2c3d4e5-6f7a-8b9c-0d1e-2f3a4b5c6d7e}

# Editor with Meta+Shift+N
[Data_4]
Comment=Launch Editor
DataCount=1
Enabled=true
Name=Editor
SystemGroup=0
Type=SIMPLE_ACTION_DATA

[Data_4Actions]
ActionsCount=1

[Data_4Actions0]
CommandURL=$HOME/.local/share/omadora-kde/bin/omadora-launch-editor
Type=COMMAND_URL

[Data_4Conditions]
Comment=
ConditionsCount=0

[Data_4Triggers]
Comment=Simple_action
TriggersCount=1

[Data_4Triggers0]
Key=Meta+Shift+N
Type=SHORTCUT
Uuid={c3d4e5f6-7a8b-9c0d-1e2f-3a4b5c6d7e8f}

# LazyDocker with Meta+Shift+D
[Data_5]
Comment=Launch LazyDocker
DataCount=1
Enabled=true
Name=LazyDocker
SystemGroup=0
Type=SIMPLE_ACTION_DATA

[Data_5Actions]
ActionsCount=1

[Data_5Actions0]
CommandURL=$HOME/.local/share/omadora-kde/bin/omadora-launch-tui lazydocker
Type=COMMAND_URL

[Data_5Conditions]
Comment=
ConditionsCount=0

[Data_5Triggers]
Comment=Simple_action
TriggersCount=1

[Data_5Triggers0]
Key=Meta+Shift+D
Type=SHORTCUT
Uuid={d4e5f6a7-8b9c-0d1e-2f3a-4b5c6d7e8f9a}

# System Monitor (btop) with Meta+Ctrl+T
[Data_6]
Comment=Launch System Monitor
DataCount=1
Enabled=true
Name=System Monitor
SystemGroup=0
Type=SIMPLE_ACTION_DATA

[Data_6Actions]
ActionsCount=1

[Data_6Actions0]
CommandURL=$HOME/.local/share/omadora-kde/bin/omadora-launch-tui btop
Type=COMMAND_URL

[Data_6Conditions]
Comment=
ConditionsCount=0

[Data_6Triggers]
Comment=Simple_action
TriggersCount=1

[Data_6Triggers0]
Key=Meta+Ctrl+T
Type=SHORTCUT
Uuid={e5f6a7b8-9c0d-1e2f-3a4b-5c6d7e8f9a0b}

[Main]
AlreadyImported=defaults,kde32b1,konqueror_gestures_kde321
Disabled=false
Version=2
EOF

echo "Custom shortcuts configured"

# Restart khotkeys to apply changes
if command -v kquitapp5 &>/dev/null; then
  kquitapp5 khotkeys 2>/dev/null
  khotkeys5 &
fi
