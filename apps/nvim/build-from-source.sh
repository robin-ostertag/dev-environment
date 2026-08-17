#!/bin/bash
set -euo pipefail

source "$DEV_ENV/config.sh"
source "$DEV_ENV/scripts/utils.sh"

# default values are based on what guarantees a most stable system

ROBINO_NVIM_GIT_REF="${ROBINO_NVIM_GIT_REF:-stable}"
info "Using git ref: $ROBINO_NVIM_GIT_REF"

ROBINO_NVIM_GIT_FETCH="${ROBINO_NVIM_GIT_FETCH:-no}"

function build_nvim() {
	info "Starting build process..."
	make CMAKE_BUILD_TYPE=Release

	info "Installing Neovim..."
	sudo make install
}

mkdir -p "$HOME/.local/share/robino"
REPO_DEST="$HOME/.local/share/robino/neovim"
if [ -d "$REPO_DEST" ]; then
	cd "$REPO_DEST" || exit 1

	if [[ "$ROBINO_NVIM_GIT_FETCH" == "yes" ]]; then
		info "Fetching $ROBINO_NVIM_GIT_REF"
		git fetch --depth 1 origin "$ROBINO_NVIM_GIT_REF"
	fi

	commit_hash_before_checkout=$(git -C "$REPO_DEST" rev-parse HEAD)
	git checkout "$ROBINO_NVIM_GIT_REF"
	if [[ $commit_hash_before_checkout != $(git -C "$REPO_DEST" rev-parse HEAD) ]]; then
		sudo make clean distclean
		build_nvim
	else
		info "Commit unchanged. Skipping build."
	fi
else

	info "Installing dependencies for Ubuntu"
	sudo apt-get -y install ninja-build gettext cmake unzip curl

	info "Cloning Neovim repository..."
	git clone --depth 1 --no-single-branch "https://github.com/neovim/neovim" "$REPO_DEST"
	cd "$REPO_DEST" || exit 1
	git checkout "$ROBINO_NVIM_GIT_REF"
	build_nvim
fi

success "Neovim installation complete."
