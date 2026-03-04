alias boottime='systeminfo | grep "Systemstartzeit"'
alias home='explorer "$(cygpath -w ~)"' # workaround for explorer ~ not working

# lazy load nvm
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
    nvm "$@"
}

# Wrapper function for node
node() {
	unset -f nvm
    unset -f node
	unset -f npm
	unset -f npx
    load_nvm
    command node "$@"      # Call the actual node executable
}

# Wrapper function for npm
npm() {
    unset -f nvm
    unset -f node
	unset -f npm
	unset -f npx
    load_nvm
    command npm "$@"       # Call the actual npm executable
}

# Wrapper function for npx
npx() {
    unset -f nvm
    unset -f node
	unset -f npm
	unset -f npx
    load_nvm
    command npx "$@"       # Call the actual npx executable
}