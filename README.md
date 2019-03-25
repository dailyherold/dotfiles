# Dotfiles

## Overview

This repo is my attempt at backing up my terminal life. It contains a utility ([dfm](https://github.com/justone/dfm)) to help with managing and updating my  dotfiles.

It also contains a massive Ansible bootstrap playbook (pending further role organization and flavor-agnostic optimization) for getting a fresh install of a 14.04 based distro setup just how I like it.

You'll also find some scattered scripts and nuggets here and there that might not make much sense. 

## Using this repo

First, read all the codes. Hopefully I'll inspire you with things here and there. In my opinion the repo is too opinionated to be forked, or expected to work upon clone. ha. 

Check out `dfm` though if you are curious about it's role, as I think it is a sweet little utility. The repo itself was also built from justone's dotfiles skeleton. For more information, check out his [wiki](http://github.com/justone/dotfiles/wiki).

- Clone repo: `cd $HOME && git clone https://github.com/dailyherold/dotfiles.git .dotfiles`.
- Pull submodules: `cd .dotfiles && git submodule update --init --recursive`.
- Bootstrap: `./bootstrap`.
- If you want to override any default vars, create vars file named after your $USER in `ansible/vars/`.
- Run ansible playbook: `cd ansible && ansible-playbook bootstrap.yml -i inventory --ask-become-pass`.
- Open up vim and run `:PluginInstall`.
- Pull submodules for YouCompleteMe vim plugin: `cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive`
- Compile YouCompleteMe's component: `cd ~/.vim/bundle/YouCompleteMe && ./install.py`. See README.md in YCM directory for mroe info.
- Start tmux: `tmux`.
- Install tmux plugins: tmux `prefix` + `I`.

## Common commands

- `ansible-playbook bootstrap.yml -i inventory --ask-become-pass --step -e "@vars/jpherold.yml" --tags "packages"`

## Todo
- (IN PROGRESS) Break up monolithic Ansible playbook into roles.
- Abstract some of those roles as separate repos and add to Ansible Galaxy. Then include those "remote" roles in playbook.
- Consider one "barebones" playbook for setting up all the terminal goodies along with dependencies, and another playbook for rest of my system packages and tweaks. This would be good for those that want to try out my terminal config without getting the rest of the enchiladas.
- Update all poorly written scripts.
- Consider dfm's role and if I would just want to use Ansible for similar tasks.

## Updating submodules

There are two submodules in this repo, `.zprezto` and `.vim/bundle/Vundle.vim`. `.zprezto` is forked, which means that [origin](https://github.com/dailyherold/prezto/) does not stay up to day with [upstream](https://github.com/sorin-ionescu/prezto). We will need to first update the forked repo with upstream.

To update `.zprezto` follow these steps (`pwd` should be `.zprezto`):

- Run `git remote -v` and check if there is an upstream remote for the original repo. If not run `git remote add upstream https://github.com/sorin-ionescu/prezto.git`.
- Ensure you are on `master`, and run `git fetch upstream` followed by `git merge upstream/master` if you are okay with the changes. `git pull` also an option but doesn't give you a break to assess what you are about to merge.
- After merging, we need to update zprezto's submodules as well: `git submodule update --init --recursive`.
- Commit and push the changes to origin to ensure the forked prezto repo is up to date.

To update `.zprezto` and `.vim/bundle/Vundle.vim` submodules (`pwd` should be root of this dotfile repo):

- Init and update each submodule: `git submodule update --init --recursive`.
- Ensure each submodule is on master branch: `git submodule foreach git checkout master`.
- Pull in latest changes from each submodule's origin repo: `git submodule foreach git pull --rebase origin master`.
- If there were changes, `git status` should show each submodule directory as modified with with "(new commits)" next to it.
- Add those directories to the stage then commit them.

