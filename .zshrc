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
export PATH=$PATH:$HOME/.dotfiles/bin

# ignore EOF ('^D') (i.e. don't log out on it)
setopt ignoreeof

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
alias gw='./gradlew'
alias watch='watch '

# TMUX
alias tnew='tmux new-session -s'

# SWA K8s
alias k='kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}" ${KUBECTL_NAMESPACE/[[:alnum:]-]*/--namespace=${KUBECTL_NAMESPACE}}'
alias wk='watch "kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}" ${KUBECTL_NAMESPACE/[[:alnum:]-]*/--namespace=${KUBECTL_NAMESPACE}}"'

# Solarize ls colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/repos/git/dircolors-solarized/dircolors.256dark && eval "$(dircolors -b ~/repos/git/dircolors-solarized/dircolors.256dark)" || eval "$(dircolors -b)"
fi

# Run xcape once.
if [ -z "$(pgrep xcape)" ]; then
    ~/repos/git/xcape/xcape -e 'Control_L=Escape'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jpherold/.sdkman"
[[ -s "/home/jpherold/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jpherold/.sdkman/bin/sdkman-init.sh"

# direnv
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/jpherold/dev/work/swa/src/platform-logging/runway/20-curator.sls/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/jpherold/dev/work/swa/src/platform-logging/runway/20-curator.sls/node_modules/tabtab/.completions/serverless.zsh
