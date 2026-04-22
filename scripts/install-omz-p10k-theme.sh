#!/usr/bin/env bash
source "scripts/utils.sh"

target="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
url="https://github.com/romkatv/powerlevel10k.git"
clone_repo $url $target

success "Installed Oh My Zsh p10k theme"

# sync .p10k.zsh (config file)
"$HOME/dev-environment/scripts/sync-p10k_zsh.sh"