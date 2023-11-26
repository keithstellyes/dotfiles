#!/usr/bin/env bash

echo Install some of the common apps I use on everything
HAS_BREW=false
HAS_PACMAN=false
brew --version 2> /dev/null && HAS_BREW=true
pacman --version 2> /dev/null && HAS_PACMAN=true

function install() {
	if [ $HAS_BREW == true ]; then
		brew --install $@
	elif [ $HAS_PACMAN == true ]; then
		pacman -S $@
	fi
}

install git neovim tmux gcc 
