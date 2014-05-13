#! /bin/bash

if setxkbmap -print|grep --quiet "swapcaps"; then
  setxkbmap -option
else
  setxkbmap -option ctrl:swapcaps
fi

# Kill xcape
pgrep xcape|awk '{print "kill "$1}'|sh 

# Restart xcape
if [ -z "$(pgrep xcape)" ]; then
    ~/repos/git/xcape/xcape -e 'Control_L=Escape'
fi

