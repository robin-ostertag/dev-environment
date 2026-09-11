#!/usr/bin/env bash
set -euo pipefail

sudo apt install zsh
"$DEV_ENV/apps/zsh/oh-my-zsh/install.sh"
"$DEV_ENV/apps/zsh/sync.sh"