# Dotfiles

## Overview

This repo is my attempt at backing up my terminal life. It contains a utility ([dfm](https://github.com/justone/dfm)) to help with managing and updating my  dotfiles.

It also contains a massive Ansible bootstrap playbook (pending further role organization and flavor-agnostic optimiztion) for getting a fresh install of a 14.04 based distro setup just how I like it.

You'll also find some scattered scripts and nuggets here and there that might not make much sense. 

## Using this repo

First, read all the codes. Hopefully I'll inspire you with things here and there. In my opinion the repo is too opinionated to be forked, or expected to work upon clone. ha. 

With that said, I would like to refine the repo into something that is friendler for the curious folk. In due time. 

Check out `dfm` though if you are curious about it's role, as I think it is a sweet little utility. The repo itself was also built from justone's dotfiles skeleton. For more information, check out his [wiki](http://github.com/justone/dotfiles/wiki).

## Todo
- Break up monolithic Ansible playbook into roles.
- Abstract some of those roles as separate repos and add to Ansible Galaxy. Then include those "remote" roles in playbook.
- Consider one "barebones" playbook for setting up all the terminal goodies along with dependencies, and another playbook for rest of my system packages and tweaks. This would be good for those that want to try out my terminal config without getting the rest of the enchiladas.
- Update all poorly written scripts.
- Speaking of scripts, add a true bootstrap script that installs Ansible, sets dotfiles, and kicks off a playbook.
- Consider dfm's role and if I would just want to use Ansible for similar tasks.

