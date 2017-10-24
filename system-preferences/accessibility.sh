#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: accessibility \033[0m"

###############################################################################
# Accessibility
###############################################################################

# enable three finger drag
# yes this is a stupid place for a trackpad preference to be - talk to apple.
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true