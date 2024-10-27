#!/bin/bash

# Fish
######################################################################

# Oh-my-fish
#pretty-print 'Installing Oh-my-fish'
#curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish --init-command 'set argv --noninteractive'

# bobthefish theme for fish shell
#pretty-print 'Installing bobthefish theme'
#fish -c "omf install bobthefish"
#fish -c "set -g theme_nerd_fonts yes"

# Fisher
pretty-print 'Installing fisher'
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# sdkman-for-fish
pretty-print 'Installing sdkman-for-fish'
fish -c "fisher install reitzig/sdkman-for-fish@v2.1.0"

# tide
pretty-print 'Installing & configuring tide'
fish -c "fisher install IlanCosman/tide@v6"
fish -c "tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time='24-hour format' --rainbow_prompt_separators=Angled --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Dark --prompt_spacing=Compact --icons='Many icons' --transient=Yes"

# aliases
pretty-print 'Setting up aliases'

echo 'll -> eza --header --long --git --icons'
fish -c "alias --save ll='eza --header --long --git --icons'"

######################################################################