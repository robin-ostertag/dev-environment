#!/usr/bin/env bash
source "scripts/utils.sh"

clone_repo() {
	local url="$1"
	local target="$2"

	if [ ! -d "$target" ]; then
		git clone "$url" "$target"
		echo "Cloned $url"
	else
		echo "Skipped clone (already exists): $target"
	fi
}

# Default ZSH_CUSTOM if not set
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

mkdir -p "$ZSH_CUSTOM/plugins"

clone_repo https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_repo https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_repo https://github.com/zsh-users/zsh-completions.git "$ZSH_CUSTOM/plugins/zsh-completions"

success "Installed Oh My Zsh plugins"