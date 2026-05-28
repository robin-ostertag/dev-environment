#!/usr/bin/env bash
source "scripts/utils.sh"

# source to get access to $os variable
source "scripts/detect_os.sh"

# Shared scripts
./scripts/sync-gitconfig.sh
./scripts/sync-git-foreach-repo.sh

# Call OS-specific scripts
if [ "$os" = "linux" ]; then
  ./scripts/sync-zshrc.sh
  ./scripts/sync-p10k_zsh.sh
elif [ "$os" = "windows" ]; then
  ./scripts/sync-bashrc.sh "$os"
fi