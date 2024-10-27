#!/bin/bash

######################################################################

function pretty-print() {
  echo ""
  echo "##########################################################################################"
  printf '###  %-80s  ###\n' "$@"
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

pretty-print 'Running as' "$(whoami)"

######################################################################