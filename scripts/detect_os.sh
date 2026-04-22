#!/usr/bin/env bash
source "scripts/utils.sh"

# 1. Check if OS is already defined to avoid re-running
if [[ -n "$OS_DETECTED" ]]; then
    info "OS already set to: $OS_DETECTED (skipping detection)"
    os="$OS_DETECTED"
else
    # Auto-detect OS
    case "$(uname -s)" in
      Linux*)     detected_os="linux" ;;
      Darwin*)    detected_os="linux" ;; 
      CYGWIN*|MINGW*|MSYS*) detected_os="windows" ;;
      *)          detected_os="unknown" ;;
    esac

    info "Detected OS: $detected_os"

    # Let the user override the detected OS
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

    # 2. Export the variable so sub-shells or future calls see it
    export OS_DETECTED="$os"
    info "Using OS: $os"
fi

# Final variable for rest of script
os="$OS_DETECTED"