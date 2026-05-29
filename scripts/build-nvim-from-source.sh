#!/bin/bash
set -euo pipefail

source "$HOME/dev-environment/scripts/utils.sh"
REPO_DEST="$HOME/neovim"

STABLE=false
UPDATE=false
for arg in "$@"; do
 if [[ "$arg" == "--stable" ]]; then
  STABLE=true
 elif [[ "$arg" == "--update" ]]; then
  UPDATE=true
 fi
done

BRANCH="master"
if $STABLE; then
 BRANCH="stable"
fi

info "Using branch: $BRANCH"

info "Installing dependencies for Ubuntu"
sudo apt-get -y install ninja-build gettext cmake unzip curl

function build_nvim() {
 sudo make clean distclean
 info "Starting build process..."
 make CMAKE_BUILD_TYPE=RelWithDebInfo

 info "Installing Neovim..."
 sudo make install
}

if [ -d "$REPO_DEST" ]; then
 cd "$REPO_DEST" || exit 1

 if $UPDATE; then
  info "Updating repository..."
  git fetch --depth 1 origin $BRANCH
  git checkout "$BRANCH"
 else
  info "Directory exists. Skipping update (use --update to pull latest changes)."
  git checkout "$BRANCH"
 fi
else
 info "Cloning Neovim repository..."
 git clone --depth 1 --no-single-branch "https://github.com/neovim/neovim" "$REPO_DEST"
 cd "$REPO_DEST" || exit 1
 git checkout "$BRANCH"
fi

build_nvim

success "Neovim installation complete."
 
