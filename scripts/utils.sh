#!/usr/bin/env bash

# Colored outputs
RED="\033[0;31m"
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
NC="\033[0m" # No Color

error() {
	echo -e "${RED}[ERROR] $*${NC}"
}
warn() {
	echo -e "${YELLOW}[WARN] $*${NC}"
}
success() {
	echo -e "${GREEN}[SUCCESS] $*${NC}"
}
info() {
	echo -e "${BLUE}[INFO] $*${NC}"
}

clone_repo() {
	local url="$1"
	local target="$2"

	if [ ! -d "$target" ]; then
		git clone --depth=1 "$url" "$target"
		echo "Cloned $url"
	else
		echo "Skipped clone (already exists): $target"
	fi
}