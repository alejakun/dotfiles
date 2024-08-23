#!/usr/bin/zsh

# As prerequisites the following syno packages should
# already be installed:
# - Z shell with modules
# - Git
# - Vim

INSTALL_HOME=/volume1/homes/alex

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/Tarrasch/zsh-autoenv.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autoenv
git clone --depth=1 https://github.com/agkozak/zsh-z.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z

chmod g-w,o-w $INSTALL_HOME/.oh-my-zsh/custom/plugins/zsh-z
chmod g-w,o-w $INSTALL_HOME/.oh-my-zsh/custom/plugins/zsh-autocomplete/Completions
chmod g-w,o-w $INSTALL_HOME/.oh-my-zsh/custom/plugins
chmod g-w,o-w $INSTALL_HOME/.oh-my-zsh/custom/plugins/zsh-autocomplete

ln -s $INSTALL_HOME/.oh-my-zsh /root/.oh-my-zsh
ln -s $INSTALL_HOME/.aliases.zsh /root/.aliases.zsh
ln -s $INSTALL_HOME/.zshenv /root/.zshenv
ln -s $INSTALL_HOME/.zshrc /root/.zshrc
ln -s $INSTALL_HOME/.p10k.zsh /root/.p10k.zsh
