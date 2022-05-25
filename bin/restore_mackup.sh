#!/bin/sh

# Warn before mackup restoration
wait_for_confirmation "Confirm Dropbox Mackup folder is already synched"

echo "🚛  Moving Mackup configuration files"

# Symlink the Mackup config file to the home directory
rm -rf $HOME/.mackup.cfg
ln -s $DOTFILES/macos/mackup/mackup.cfg $HOME/.mackup.cfg
rm -rf $HOME/.mackup
ln -s $DOTFILES/macos/mackup/apps $HOME/.mackup

mackup restore

# Restore the OmniApps Templates
read -p "👨🏻‍💻 Please confirm if you wish to restore OmniGraffle 7 Templates (y|N)... " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" && "$confirm" != "yes" && "$confirm" != "Yes" && "$confirm" != "YES" ]];
  then

       # Warn before restoring OmniGraffle stencils
       open_app "OmniGraffle"
       sleep 2
       killall "OmniGraffle"

       cp -rf "$HOME/Dropbox/Mackup/Library/Containers/com.omnigroup.OmniGraffle7.MacAppStore/Data/Library/Application Support/The Omni Group/OmniGraffle/" \
              "$HOME/Library/Containers/com.omnigroup.OmniGraffle7.MacAppStore/Data/Library/Application Support/The Omni Group/OmniGraffle/"
fi
