# TODOs
- use Variable for folder path
- add bin cmd to navigate to this directory (e.g. rrz for cd $HOME/$DEV_ENV)
- rename $DEV_ENV to $ROBINO_ROOT
- move scripts from scripts folder to apps/lib/bin/helpers
- remove run if confirmed
- move scripts to bin and remove .sh file extension (not all scripts, just the ones used as "program" in terminal)
- remove option to override os detection
- dotnet install script: check if already installed => then skip
- dotnet install script: prompt for dotnet version and runtime to install: https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install
- add dotnet windows install script: https://learn.microsoft.com/en-us/dotnet/core/install/windows#install-with-powershell
- sync script for vscode files: copy vscode files to user profile (maybe append)
    - https://code.visualstudio.com/docs/configure/profiles#_where-are-profiles-kept
     => profiles are stored in `%APPDATA%\Code\User\profiles` (Windows) and `$HOME/.config/Code/User/profiles` (Linux)
- also export script for vscode profiles and settings (maybe, also maybe not since i do not want all settings to be saved)
- vscode: add profiles with extensions
- remove aliases from gitconfig that already exist in omz git plugin aliases

test config:
- initial install in docker