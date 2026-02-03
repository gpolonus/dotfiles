# dotfiles


## How To Use
1. Put repo in `~/dotfiles` or else none of this works
1. Run the `./init_dotfiles.sh {machine name}` script
1. Fill the newly generated `.env` file with names of desired alias files in the `./aliases` folder, one on each line
    - note that the alias files are loaded in order
    - put your local machine aliases last so that the bash aliases `_A` has a proper default

## Current Features:
- bash aliases
- `_A` will commit new aliases to the proper bucket
- every sourcing will check for new updates and pull them in
- each environment only gets the config and aliases it needs
    - based on the value in a hidden file created on repo init
- symlinks between files in repo and where the OS needs them to be
- only do an automated pull down from repo once a day
    - check on date stored in a hidden file with the current day before pulling down


## Future Features:
- git config
    - username etc
    - create branch in remote on push globally
        - and changing the 'grcb' alias to reflect this change
- vim config
- tmux config
- vscode settings
- upon initialization installs desired environment tooling
    - fzf
    - neovim


## Future Future Features:
- getting `zsh` to work and figuring what it is
- upon initialization installs desired environment tooling
    - a better terminal filesystem?
    - docker?
    - docker-compose?
    - lando?

