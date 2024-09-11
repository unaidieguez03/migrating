#!/bin/bash
source /etc/os-release
case $ID in
	
	"opensuse-tumbleweed")
		echo "install nvim"
		sudo zypper install -y nvim
		echo "move nvim config files"
		unzip nvim.zip
		mv nvim nvim ~/.config/
		echo "install packer"
		git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
		if ! command -v ${gcc} >/dev/null; then
			sudo zypper install -y gcc
  			exit 1
		fi
		nvim --headless -c 'PackerSync' / -c 'q!'
		echo "Enjoy!"
		;;
	*)
		echo "default"
		;;
esac
