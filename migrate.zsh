#!/usr/bin/env zsh

## Use this on a machine that has not yet been converted to keep all 
## zsh config files in ~/.config (i.e. still using ~/.zsh).

## Download latest versions
cd ~/src/githome
git pull

## Install locally
cp -vir ~/src/githome/.config/zsh ~/.config

## Make redundant backups and create symlinks
mv -vi  ~/.zshrc                  ~/.zshrc.orig 
mv -vi  ~/.zshenv                 ~/.zshenv.orig
ln -vis ~/.config/zsh/zshrc       ~/.zshrc
ln -vis ~/.config/zsh/zshenv      ~/.zshenv
mv -vi  ~/.zkbd/*                 ~/.config/zsh/kbd
mv -vi  ~/.zkbd                   ~/.zkbd.orig
ln -vis ~/.config/zsh/kbd         ~/.zkbd

## Load new configs
source  ~/.config/zsh/zshenv
source  ~/.config/zsh/zshrc
rehash

