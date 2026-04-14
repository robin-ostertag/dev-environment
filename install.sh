#!/bin/bash

source "scripts/utils.sh"

# Auto-detect OS
case "$(uname -s)" in
  Linux*)     detected_os="linux" ;;
  Darwin*)    detected_os="linux" ;;  # macOS → treat like linux bash-wise
  CYGWIN*|MINGW*|MSYS*) detected_os="windows" ;;
  *)          detected_os="unknown" ;;
esac

info "Detected OS: $detected_os"

# let the user override the detected OS
read -r -p "Use detected OS? (Y/n): " confirm

if [[ "$confirm" =~ ^[Nn]$ ]]; then
  echo "Select your operating system:"
  echo "1) Linux"
  echo "2) Windows"
  read -r -p "Enter choice [1-2]: " choice

  case $choice in
    1) os="linux" ;;
    2) os="windows" ;;
    *) error "Invalid choice. Exiting."; exit 1 ;;
  esac
else
  os="$detected_os"
fi

if [ "$os" = "unknown" ]; then
  error "Could not detect OS. Please choose manually."
  exit 1
fi

info "Using OS: $os"

# Shared scripts
source ./scripts/nvm-v0.40.4-install.sh
source ./scripts/sync-gitconfig.sh

# Call OS-specific scripts
if [ "$os" = "linux" ]; then
  source ./scripts/sync-zshrc.sh
  source ./scripts/install-omz.sh
  source ./scripts/dotnet-install.sh
elif [ "$os" = "windows" ]; then
  source ./scripts/sync-bashrc.sh "$os"
fi