#!/bin/bash

######################################################################

# SDKMAN
pretty-print 'Installing SDKMAN'
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

######################################################################

# Java tools
pretty-print 'Installing java tools via SDKMAN'
sdk install java
sdk install maven
sdk install mvnd
sdk install quarkus
sdk install jbang

######################################################################
