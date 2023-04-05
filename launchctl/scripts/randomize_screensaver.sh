#!/usr/local/bin/zsh

# https://egeek.me/2016/02/20/os-x-flexible-random-screensavers/

# Generate a list with all the non default installed screensavers
ls -1d ~/Library/Screen\ Savers/*.saver | sed -E 's!.*/(.*)\.saver!\1!' > ~/.dotfiles/tmp/.screensavers

# Pick one of the available screensavers
f=$( gshuf -n1 ~/.dotfiles/tmp/.screensavers ); plistbuddy -c "Set :moduleDict:moduleName $f" -c "Set :moduleDict:path $HOME/Library/Screen Savers/$f.saver" ~/Library/Preferences/ByHost/com.apple.screenSaver.$( ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ && gsub("\"", "") { print $3 }' ).plist

# Write the configuration
plistbuddy -c "Print :moduleDict" ~/Library/Preferences/ByHost/com.apple.screenSaver.$( ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ && gsub("\"", "") { print $3 }' ).plist

# Load the new settings by killing the cache app
killall cfprefsd

# NOTES

# launchctl bootout gui/`id -u` ~/Library/LaunchAgents/io.alejakun.screensavers.plist
# launchctl bootstrap gui/`id -u` ~/Library/LaunchAgents/io.alejakun.screensavers.plist

# f=${$( ls -1 ~/Library/Screen\ Savers | gshuf -n1 )%.saver}; defaults -currentHost write com.apple.screensaver moduleDict '{"type"=0; "path"="'$HOME/Library/Screen\ Savers/$f.saver'"; "moduleName"='$f';}'
# f=$( gshuf -n1 ~/.screensavers ); defaults -currentHost write com.apple.screensaver moduleDict '{"type"=0; "path"="'$HOME/Library/Screen\ Savers/$f.saver'"; "moduleName"='$f';}'
