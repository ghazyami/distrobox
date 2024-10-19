#!/bin/bash

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
