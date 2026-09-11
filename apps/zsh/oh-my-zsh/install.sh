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
## Default ZSH_CUSTOM if not set
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM/plugins"
## necessary to manually clone, since they are not oh-my-zsh plugins
clone_repo https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_repo https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_repo https://github.com/zsh-users/zsh-completions.git "$ZSH_CUSTOM/plugins/zsh-completions"
success "Installed Oh My Zsh plugins"

# installing Theme
## p10k
clone_repo "https://github.com/romkatv/powerlevel10k.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
success "Installed Oh My Zsh p10k theme"
## sync .p10k.zsh (config file)
"$DEV_ENV/apps/zsh/powerlevel10k/sync-p10k_zsh.sh"