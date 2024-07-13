#!/bin/bash

######################################################################

function pretty-print() {
  echo ""
  echo "##########################################################################################"
  printf '###  %-80s  ###\n' "$1"
  echo "##########################################################################################"
}

######################################################################

function download-if-missing() {
  if [ ! -f "$HOME/Downloads/$1" ]; then
    pretty-print "Downloading $1 from $1"
    aria2c -x 5 -d "$HOME/Downloads" "$2"
  else
    pretty-print "Skip downloading $1: already prenent at ~/Downloads"
  fi
}

######################################################################

# SDKMAN
pretty-print 'Installing SDKMAN'
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install maven
sdk install mvnd
sdk install quarkus
sdk install jbang

######################################################################

# Nerd fonts (JetBrainsMono)
FONT_DIR="$HOME/.local/share/fonts"
FONT_ARCHIVE="JetBrainsMono.tar.xz"
FONT_LINK="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
EXISTING_FILES=$(ls -l $FONT_DIR/JetBrains* | wc -l)
if [ "$EXISTING_FILES" -lt 1 ]; then
  pretty-print 'Installing JetBrainsMono'
  download-if-missing "$FONT_ARCHIVE" "$FONT_LINK"
  tar -xf $HOME/Downloads/$FONT_ARCHIVE -C $FONT_DIR
  fc-cache -fv
else
  pretty-print "Skip installing JetBrainsMono: already present at ~/.local/share/fonts"
fi

######################################################################

# tldr page cache
pretty-print 'Updating tldr page cache'
tldr --update

# Oh-my-fish
pretty-print 'Installing Oh-my-fish'
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish --init-command 'set argv --noninteractive'

# bobthefish theme for fish shell
pretty-print 'Installing bobthefish theme'
fish -c "omf install bobthefish"
fish -c "set -g theme_nerd_fonts yes"

# Fisher
pretty-print 'Installing fisher'
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# sdkman-for-fish
pretty-print 'Installing sdkman-for-fish'
fish -c "fisher install reitzig/sdkman-for-fish@v2.0.0"

# aliases
pretty-print 'Setting up aliases'

echo 'll -> eza --header --long --git --icons'
fish -c "alias --save ll='eza --header --long --git --icons'"

# set fish as default shell
pretty-print "Setting fish as default shell for user $USER"
sudo chsh -s /usr/bin/fish $USER

######################################################################
