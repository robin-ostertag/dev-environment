# TODOs
- dotnet install script: check if already installed => then skip
- dotnet install script: prompt for dotnet version and runtime to install: https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install
- add dotnet windows install script: https://learn.microsoft.com/en-us/dotnet/core/install/windows#install-with-powershell
- sync script for vscode files: copy vscode files to user profile (maybe append)
    - https://code.visualstudio.com/docs/configure/profiles#_where-are-profiles-kept
     => profiles are stored in `%APPDATA%\Code\User\profiles` (Windows) and `$HOME/.config/Code/User/profiles` (Linux)
- vscode: add profiles with extensions
- use shared script to lazy load nvm
- nvm lazy load command pass through not working in zsh: [https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm)