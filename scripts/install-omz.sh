#!/usr/bin/env bash
source "scripts/utils.sh"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "Installing Oh My Zsh..."
	# Prevent auto-launching zsh after install
	RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo "Oh My Zsh installed"
else
	info "Skipped Oh My Zsh install (already installed)"
fi

# installing plugins
"$HOME/dev-environment/scripts/install-omz-p10k-theme.sh"
# installing p10k theme
"$HOME/dev-environment/scripts/install-omz-plugins.sh"

