alias boottime='systeminfo | grep "Systemstartzeit"'
alias home='explorer "$(cygpath -w ~)"' # workaround for explorer ~ not working

# lazy load nvm since it takes about 15s on windows (git bash) or 2.2s in WSL (zsh)
load_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo "NVM loaded. Current Node version: $(node -v 2>/dev/null || 'none')"
}

# load nvm when using node-y programs
nvm() {
	unset -f nvm
    unset -f node
	unset -f npm
	unset -f npx
    load_nvm
    nvm "$@"        # Call nvm executable with the provided arguments
}
node() {
	unset -f nvm
    unset -f node
	unset -f npm
	unset -f npx
    load_nvm
    command node "$@"      # Call node executable with the provided arguments
}
npm() {
    unset -f nvm
    unset -f node
	unset -f npm
	unset -f npx
    load_nvm
    command npm "$@"       # Call npm executable with the provided arguments
}
npx() {
    unset -f nvm
    unset -f node
	unset -f npm
	unset -f npx
    load_nvm
    command npx "$@"       # Call npx executable with the provided arguments
}