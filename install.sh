#!/bin/bash

# Auto-detect OS
case "$(uname -s)" in
  Linux*)     detected_os="linux" ;;
  Darwin*)    detected_os="linux" ;;  # macOS → treat like linux bash-wise
  CYGWIN*|MINGW*|MSYS*) detected_os="windows" ;;
  *)          detected_os="unknown" ;;
esac

echo "Detected OS: $detected_os"

read -r -p "Use detected OS? (Y/n): " confirm

if [[ "$confirm" =~ ^[Nn]$ ]]; then
  echo "Select your operating system:"
  echo "1) Linux"
  echo "2) Windows"
  read -r -p "Enter choice [1-2]: " choice

  case $choice in
    1) os="linux" ;;
    2) os="windows" ;;
    *) echo "Invalid choice. Exiting."; exit 1 ;;
  esac
else
  os="$detected_os"
fi

if [ "$os" = "unknown" ]; then
  echo "Could not detect OS. Please choose manually."
  exit 1
fi

echo "Using OS: $os"

bash ./scripts/sync-bashrc.sh "$os"
bash ./scripts/sync-gitconfig.sh