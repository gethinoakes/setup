#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# first install apps and system dependencies
apps=(
    xcode
    homebrew
    node
    google-fonts
)

echo "\033[34;7m installing apps \033[0m"
for file in "${apps[@]}"; do
    source "apps/$file.sh"
done

# apply app preferences
app_preferences=(
    activity-monitor
    bartender
    contacts
    finder
    mail
    messages
    photos
    plex
    safari
    terminal
    transmission
)

echo "\033[34;7m applying app preferences \033[0m"
for file in "${app_preferences[@]}"; do
    source "app-preferences/$file.sh"
done

# system-preferences
system_preferences=(
    general
    desktop-screensaver
    dock
    mission-control
    # language-region
    security-privacy
    spotlight
    notifications

    # displays
    # energy-saver
    keyboard
    # mouse
    trackpad
    printers-scanners
    sound
    # startup-disk

    icloud
    # internet-accounts
    app-store
    # network
    bluetooth
    # extensions
    # sharing

    users-groups
    # parental-controls
    siri
    date-time
    time-machine
    accessibility

    # miscellaneous settings
    misc
)

echo "\033[34;7m applying system preferences \033[0m"
for file in "${system_preferences[@]}"; do
    source "system-preferences/$file.sh"
done

# prompt to restart after everything is done, should always restart!
echo "Done. Note that some of these changes require a logout/restart to take effect."
read -p "Would you like to restart the computer now? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    osascript -e 'tell app "System Events" to restart'
fi