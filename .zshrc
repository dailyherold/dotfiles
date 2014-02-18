#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# add dfm to path
export PATH=$PATH:$HOME/bin

export TERM="xterm-256color"

# Customize to your needs...

## Aliases ##
# VPN #
alias vpnstart='sudo vpnc Examsoft'
alias vpnstop='sudo vpnc-disconnect'
alias vpnstatus='~/vpn/vpnStatus'
# ls
alias ls='ls -F --color'
alias ll='ls -lF --color'
alias lla='ls -alF --color'
# Other #
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias tmux='tmux -2'

# Solarize ls colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Run xcape once.
if [ -z "$(pgrep xcape)" ]; then
    ~/repos/git/xcape/xcape -e 'Control_L=Escape'
fi

