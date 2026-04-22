#!/usr/bin/env bash
source "scripts/utils.sh"

# source to get access to $os variable
source "scripts/detect_os.sh"

# Helper function: asks and then executes the command if confirmed
run_if_confirmed() {
    local step_name="$1"
    local cmd="$2"

    # Changed prompt to (Y/n) to indicate 'Y' is the default
    read -r -p "Install $step_name? (Y/n): " choice
    
    case "$choice" in 
      # Matches empty string (Enter) or any variation of 'y'
      ""|[yY][eE][sS]|[yY]) 
        eval "$cmd" 
        ;;
      *) 
        info "Skipped Install: $step_name"
        ;;
    esac
}

# Install dependencies

# --- Shared installations ---
run_if_confirmed "nvm" "./scripts/nvm-v0.40.4-install.sh"

# --- OS-Specific installations ---
if [ "$os" = "linux" ]; then
    run_if_confirmed "Oh My Zsh" "./scripts/install-omz.sh"
elif [ "$os" = "windows" ]; then
    run_if_confirmed "Bashrc Sync" "./scripts/sync-bashrc.sh \"$os\""
fi

# sync config files
"$HOME/dev-environment/sync.sh"