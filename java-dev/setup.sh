#!/bin/bash

######################################################################

function download-if-missing() {
  if [ ! -f "$HOME/Downloads/$1" ]; then
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
download-if-missing "$FONT_ARCHIVE" "$FONT_LINK"
tar -xf $HOME/Downloads/$FONT_ARCHIVE -C $HOME/.local/share/fonts
fc-cache -fv

######################################################################

# tldr page cache
tldr --update

# Oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish --init-command 'set argv --noninteractive'
# bobthefish theme for fish shell
fish -c "omf install bobthefish"
fish -c "set -g theme_nerd_fonts yes"
# Fisher
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
# sdkman-for-fish
fish -c "fisher install reitzig/sdkman-for-fish@v2.0.0"
# aliases
fish -c "alias --save ll='eza --header --long --git --icons'"
# set fish as default shell
sudo chsh -s /usr/bin/fish $USER

######################################################################

# APPSs
APP_DIR="$HOME/.local/lib"
BIN_DIR="$HOME/.local/bin"

# IntelliJ IDEA Ultimate
IDEA_ARCHIVE="ideaIU-2023.3.4.tar.gz"
IDEA_LINK="https://download.jetbrains.com/idea/$IDEA_ARCHIVE"
IDEA_DIR="$APP_DIR/idea"
if [ ! -d "$IDEA_DIR" ]; then
  echo '### Installing IntelliJ IDEA Ultimate ###'
  mkdir -p "$IDEA_DIR"
  download-if-missing "$IDEA_ARCHIVE" "$IDEA_LINK"
  tar -xzf $HOME/Downloads/$IDEA_ARCHIVE --strip-components=1 -C "$IDEA_DIR/"
  mkdir -p "$BIN_DIR"
  ln -sf "$IDEA_DIR/bin/idea.sh" "$BIN_DIR/idea"
fi

# NetBeans
NETBEANS_ARCHIVE="netbeans-21-bin.zip"
NETBEANS_LINK="https://dlcdn.apache.org/netbeans/netbeans/21/$NETBEANS_ARCHIVE"
NETBEANS_DIR="$APP_DIR/netbeans"
if [ ! -d "$NETBEANS_DIR" ]; then
  echo '### Installing NetBeans ###'
  mkdir -p "$NETBEANS_DIR"
  download-if-missing "$NETBEANS_ARCHIVE" "$NETBEANS_LINK"
  unzip -q $HOME/Downloads/$NETBEANS_ARCHIVE -d "$NETBEANS_DIR/../"
  mkdir -p "$BIN_DIR"
  ln -sf "$NETBEANS_DIR/bin/netbeans" "$BIN_DIR/netbeans"
fi
