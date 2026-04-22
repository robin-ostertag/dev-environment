#!/usr/bin/env bash
source "scripts/utils.sh"

# source to get access to $os variable
source "scripts/detect_os.sh"

# Install dependencies

# Shared scripts
./scripts/nvm-v0.40.4-install.sh

# Call OS-specific scripts
if [ "$os" = "linux" ]; then
  ./scripts/install-omz.sh
elif [ "$os" = "windows" ]; then
  ./scripts/sync-bashrc.sh "$os"
fi

# sync config files
"$HOME/dev-environment/sync.sh"