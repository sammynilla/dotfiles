
# Setting up our Neovim installation.
This writeup will expect that you have `git` already installed and configured with `ssh` on your system.

## Arch Linux
### Prerequisites
```bash
sudo pacman -S neovim fd ripgrep curl wget unzip tar gzip
```

### Installation
```bash
cd ~
git clone git@github.com:sammynilla/dotfiles.git
mkdir .config
mv dotfiles/shared/nvim .config
rm -rf dotfiles
```

## Windows
Let's start by installing `scoop`; one of the multiple package managers for Windows. Visit the website [here](https://scoop.sh) and just follow the instructions. Once it's installed you can install `Neovim` by opening an administrator elevated command prompt and using the following command: `scoop install neovim`.

Once it's fully installed, you can follow it up in the same command prompt with the following commands:

### Prerequisites
```batch
scoop install neovim
scoop install ripgrep
scoop install fd
scoop install tar
scoop install 7z
```
### Installation
```batch
setx /M XDG_CONFIG_HOME "%USERPROFILE%\.config"
cd %USERPROFILE%
git clone git@github.com:sammynilla/dotfiles.git
move dotfiles/windows/.config .config
move dotfiles/shared/nvim .config/nvim
```

Our editor should be set up to be utilizing our configuration files and be prepared for our first run of `Neovim`. However, while the first run may seem completely successful, unfortuantely the application has to be restarted in the event that you plan to use any installed `LSP` with it's associated filetype. All installed `LSP`'s automatically function properly in all subsequent runs.

