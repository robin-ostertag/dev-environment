alias boottime='systeminfo | grep "Systemstartzeit"'
alias home='explorer "$(cygpath -w ~)"' # workaround for explorer ~ not working

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion