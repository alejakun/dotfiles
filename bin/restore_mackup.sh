#!/bin/sh

# Warn before mackup restoration
wait_for_confirmation "Confirm Dropbox Mackup folder is already synched"

echo "🚛 Moving Mackup configuration files"

# Symlink the Mackup config file to the home directory
rm -rf "$HOME/.mackup.cfg"
ln -s "$DOTFILES/macos/mackup/mackup.cfg" "$HOME/.mackup.cfg"
rm -rf "$HOME/.mackup"
ln -s "$DOTFILES/macos/mackup/apps" "$HOME/.mackup"

mackup restore

# Restore the OmniApps Templates
ask_for_confirmation_input "Do you wish to to restore OmniGraffle 7 Templates?"
if test $confirm = true; then
    # Open the app to be sure the directories exist
    open_app "OmniGraffle"
    sleep 2
    killall "OmniGraffle"

    cp -rf "$HOME/Dropbox/Mackup/Library/Containers/com.omnigroup.OmniGraffle7.MacAppStore/Data/Library/Application Support/The Omni Group/OmniGraffle/" \
           "$HOME/Library/Containers/com.omnigroup.OmniGraffle7.MacAppStore/Data/Library/Application Support/The Omni Group/OmniGraffle/"
fi
