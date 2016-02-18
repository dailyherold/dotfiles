#
# Executes commands at the start of an interactive session.
#
# Authors:
#   John Paul Herold
#   Branched from Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# add .dotfiles/bin to path for dfm
export PATH=$PATH:$HOME/bin

# handle colors if tmux is running
if [ -n "$TMUX" ]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi

## Aliases ##
# ls
alias ls='ls -F --color'
alias ll='ls -lF --color'
alias lla='ls -alF --color'
# Other #
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias tmux='tmux -2'

# TMUX
alias tnew='tmux new-session -s'

# Solarize ls colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/repos/git/dircolors-solarized/dircolors.256dark && eval "$(dircolors -b ~/repos/git/dircolors-solarized/dircolors.256dark)" || eval "$(dircolors -b)"
fi

# Run xcape once.
if [ -z "$(pgrep xcape)" ]; then
    ~/repos/git/xcape/xcape -e 'Control_L=Escape'
fi

export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jpherold/.sdkman"
[[ -s "/home/jpherold/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jpherold/.sdkman/bin/sdkman-init.sh"
