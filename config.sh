#!/usr/bin/env bash
set -euo pipefail

export DEV_ENV=${DEV_ENV:-"$HOME/dev-environment"}

# INFO: NEOVIM


# anything you can call git checkout on.
# usually 'master' branch or 'stable' tag
export ROBINO_NVIM_GIT_REF=${ROBINO_NVIM_GIT_REF:-stable}

# whether or not to fetch the latest commits before checking out the BUILD_REF
export ROBINO_NVIM_GIT_FETCH=${ROBINO_NVIM_GIT_FETCH:-"no"}
