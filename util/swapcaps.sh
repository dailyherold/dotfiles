#! /bin/bash

if setxkbmap -print|grep --quiet "swapcaps"; then
  setxkbmap -option
else
  setxkbmap -option ctrl:swapcaps
fi

