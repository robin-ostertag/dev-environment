#!/usr/bin/env bash
set -euo pipefail

"$DEV_ENV/apps/nvim/build-from-source.sh"
"$DEV_ENV/apps/nvim/sync.sh"