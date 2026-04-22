#!/usr/bin/env bash
source "scripts/utils.sh"

target="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

if [ ! -d "$target" ]; then
	url="https://github.com/romkatv/powerlevel10k.git"
	git clone --depth=1 $url $target
	echo "Cloned $url"
else
	echo "Skipped clone (already exists): $target"
fi

cp "$HOME/dev-environment/linux/.p10k.zsh" "$HOME/.p10k.zsh"

success "Installed zsh p10k theme"