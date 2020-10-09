#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#


#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='gvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/local/go/bin
  /opt/apache-ant/bin
  /opt/apache-maven/bin
  /opt/gradle/bin
  /opt/keychain
  /opt/terraform
  /opt/packer
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

#
# NVM
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#
# Keychain
# https://www.funtoo.org/Keychain
#

# For Gnome <=3.24 in Wayland support, this is needed to ensure SSH_AUTH_SOCK isn't overridden
# https://wiki.archlinux.org/index.php/GNOME/Keyring#Disable_keyring_daemon_components
# https://eklitzke.org/down-the-ssh-auth-sock-rabbit-hole-a-gnome-adventure
# https://bugzilla.gnome.org/show_bug.cgi?id=772919
export GSM_SKIP_SSH_AGENT_WORKAROUND=1

# Start Keychain
eval `keychain --eval --agents ssh,gpg --gpg2 --inherit any jpherold.pem 6C34FCD0FFF69C43`

# SWA
source ~/.swa/login-functions.sh

