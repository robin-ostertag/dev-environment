# TODOs
- use Variable for folder path
- add bin cmd to navigate to this directory (e.g. rrz for cd $HOME/$DEV_ENV)
- rename $DEV_ENV to $ROBINO_ROOT or sth
- move scripts from scripts folder to apps/lib/bin/helpers
- remove run if confirmed script
- move scripts to bin and remove .sh file extension (not all scripts, just the ones used as "program" in terminal)
- remove option to override os detection

## NVIM
- sort & cleanup init.lua

## .NET
- dotnet install script: check if already installed => then skip
- dotnet install script: prompt for dotnet version and runtime to install:  
  [linux install dotnet sdk](https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install)
- add dotnet windows install script:  
  https://learn.microsoft.com/en-us/dotnet/core/install/windows#install-with-powershell


## VSCODE
- sync script for vscode files: copy vscode files to user profile (maybe append) 
  https://code.visualstudio.com/docs/configure/profiles#_where-are-profiles-kept
  => profiles are stored in `%APPDATA%\Code\User\profiles` (Windows) and `$HOME/.config/Code/User/profiles` (Linux)
- also export script for vscode profiles and settings (maybe, also maybe not since i do not want all settings to be saved)
- vscode: add profiles with extensions => code --list-extensions > extensions.txt 
  - then load again with `xargs -L 1 code --install-extension < ~/dotfiles/vscode/extensions.txt`


## ZSH
- use new git aliases & remove omz git plugin
- update & cleanup zshrc and use & source files for aliases, function etc.
- for zsh environment variables, use .zshenv
- try starship zsh prompt 
- try mise for env management [https://mise.jdx.dev/](https://mise.jdx.dev/)

test config:
- initial install in docker: