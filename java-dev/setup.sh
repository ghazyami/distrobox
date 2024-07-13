#!/bin/bash

######################################################################

function download-if-missing() {
  if [ ! -f "$HOME/Downloads/$1" ]; then
    echo "### Downloading $1 from $1 ###"
    aria2c -x 5 -d "$HOME/Downloads" "$2"
  fi
}

######################################################################

# SDKMAN
echo '### Installing SDKMAN ###'
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install maven
sdk install mvnd
sdk install quarkus
sdk install jbang

######################################################################

# Nerd fonts (JetBrainsMono)
FONT_ARCHIVE="JetBrainsMono.tar.xz"
FONT_LINK="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
EXISTING_FILES=(ls -l $HOME/.local/share/fonts/JetBrains* | wc -l)
if [ "$EXISTING_FILES" -lt 1 ]; then
  echo '### Installing JetBrainsMono ###'
  download-if-missing "$FONT_ARCHIVE" "$FONT_LINK"
  tar -xf $HOME/Downloads/$FONT_ARCHIVE -C $HOME/.local/share/fonts
  fc-cache -fv
fi

######################################################################

# tldr page cache
echo '### Updating tldr page cache ###'
tldr --update

# Oh-my-fish
echo '### Installing Oh-my-fish ###'
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish --init-command 'set argv --noninteractive'

# bobthefish theme for fish shell
echo '### Installing bobthefish theme ###'
fish -c "omf install bobthefish"
fish -c "set -g theme_nerd_fonts yes"

# Fisher
echo '### Installing fisher ###'
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# sdkman-for-fish
echo '### Installing sdkman-for-fish ###'
fish -c "fisher install reitzig/sdkman-for-fish@v2.0.0"

# aliases
echo '### Setting up aliases ###'
fish -c "alias --save ll='eza --header --long --git --icons'"

# set fish as default shell
echo "### Setting fish as default shell for user $USER ###"
sudo chsh -s /usr/bin/fish $USER

######################################################################
