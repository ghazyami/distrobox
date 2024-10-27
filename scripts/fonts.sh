#!/bin/bash

# Fonts
######################################################################

FONT_DIR="$HOME/.local/share/fonts"

# JetBrainsMono
FONT_ARCHIVE="JetBrainsMono.tar.xz"
FONT_LINK="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
FONT_PREFIX="JetBrains"
EXISTING_FILES=$(ls -l $FONT_DIR/$FONT_PREFIX* | wc -l)
if [ "$EXISTING_FILES" -lt 1 ]; then
  pretty-print "Installing $FONT_PREFIX font"
  download-if-missing "$FONT_ARCHIVE" "$FONT_LINK"
  tar -xf $HOME/Downloads/$FONT_ARCHIVE --wildcards -C $FONT_DIR "$FONT_PREFIX*"
else
  pretty-print "Skip installing $FONT_PREFIX: already present at ~/.local/share/fonts"
fi

# Inter
FONT_ARCHIVE="Inter-4.0.zip"
FONT_LINK="https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip"
FONT_PREFIX="Inter"
EXISTING_FILES=$(ls -l $FONT_DIR/$FONT_PREFIX* | wc -l)
if [ "$EXISTING_FILES" -lt 1 ]; then
  pretty-print "Installing $FONT_PREFIX font"
  download-if-missing "$FONT_ARCHIVE" "$FONT_LINK"
  unzip -o $HOME/Downloads/$FONT_ARCHIVE -d $FONT_DIR "$FONT_PREFIX*"
else
  pretty-print "Skip installing $FONT_PREFIX: already present at ~/.local/share/fonts"
fi

# update font cache on host
distrobox-host-exec fc-cache -vrf

######################################################################